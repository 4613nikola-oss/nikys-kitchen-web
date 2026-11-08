// Recepty a články z databáze – hledání, kategorie, alergeny, propojení
// Obsahu je málo, proto se načte celý najednou a dál se jen filtruje.
// cache() zajistí, že se při skládání jedné stránky databáze zeptá jen jednou.
import { cache } from "react";
import sql from "@/lib/db";

export const categories = ["slane", "sladke", "napoje"];

const jazyky = ["cs", "en"];

// Seskupí řádky podle klíče: [{recept: "a"}, ...] → { a: [...] }
function podle(radky, klic) {
  const out = {};
  for (const r of radky) (out[r[klic]] ||= []).push(r);
  return out;
}

const loadRecipes = cache(async () => {
  const [recepty, texty, suroviny, alergeny, vazby] = await Promise.all([
    sql`SELECT * FROM recepty WHERE zverejneno ORDER BY poradi, slug`,
    sql`SELECT * FROM recepty_texty`,
    sql`SELECT recept, jazyk, mnozstvi, jednotka, co FROM suroviny ORDER BY recept, jazyk, poradi`,
    sql`SELECT recept, alergen FROM recepty_alergeny ORDER BY alergen`,
    sql`SELECT recept, clanek FROM recepty_clanky`,
  ]);
  const t = podle(texty, "recept");
  const s = podle(suroviny, "recept");
  const a = podle(alergeny, "recept");
  const v = podle(vazby, "recept");

  // Stejná podoba jako dřív v data/recipes.js, aby stránky zůstaly jednoduché
  return recepty.map((r) => {
    const recept = {
      slug: r.slug,
      kategorie: r.kategorie,
      status: r.stav,
      cas: r.cas_min,
      porce: r.porce,
      kcal: r.kcal,
      jidla: r.jidla,
      alergeny: (a[r.slug] || []).map((x) => x.alergen),
      obrazek: r.obrazek,
      obrazekAi: r.obrazek_ai,
      tecka: r.tecka,
      clanky: (v[r.slug] || []).map((x) => x.clanek),
    };
    for (const jazyk of jazyky) {
      const text = (t[r.slug] || []).find((x) => x.jazyk === jazyk);
      if (!text) continue;
      recept[jazyk] = {
        nazev: text.nazev,
        uvod: text.uvod,
        // množství chodí z databáze jako text (typ numeric) → převod na číslo
        suroviny: (s[r.slug] || [])
          .filter((x) => x.jazyk === jazyk)
          .map((x) => ({ mnozstvi: x.mnozstvi === null ? undefined : Number(x.mnozstvi), jednotka: x.jednotka ?? undefined, co: x.co })),
        postup: text.postup,
        varianty: text.varianty ?? undefined,
        tip: text.tip ?? undefined,
      };
    }
    return recept;
  });
});

const loadArticles = cache(async () => {
  const [clanky, texty, vazby] = await Promise.all([
    sql`SELECT * FROM clanky WHERE zverejneno ORDER BY poradi, slug`,
    sql`SELECT * FROM clanky_texty`,
    sql`SELECT recept, clanek FROM recepty_clanky`,
  ]);
  const t = podle(texty, "clanek");
  const v = podle(vazby, "clanek");

  return clanky.map((c) => {
    const clanek = {
      slug: c.slug,
      cteni: c.cteni_min,
      zdroje: c.zdroje,
      recepty: (v[c.slug] || []).map((x) => x.recept),
    };
    for (const jazyk of jazyky) {
      const text = (t[c.slug] || []).find((x) => x.jazyk === jazyk);
      if (text) clanek[jazyk] = { nazev: text.nazev, perex: text.perex, vKostce: text.v_kostce, telo: text.telo };
    }
    return clanek;
  });
});

// 14 alergenů podle nařízení EU 1169/2011 → { cs: { lepek: "lepek", ... }, en: { ... } }
export const getAllergenNames = cache(async () => {
  const radky = await sql`SELECT kod, cs, en FROM alergeny`;
  const out = { cs: {}, en: {} };
  for (const r of radky) {
    out.cs[r.kod] = r.cs;
    out.en[r.kod] = r.en;
  }
  return out;
});

export const getRecipes = loadRecipes;
export const getRecipe = async (slug) => (await loadRecipes()).find((r) => r.slug === slug);
export const recipesByCategory = async (cat) => (await loadRecipes()).filter((r) => r.kategorie === cat);

export const getArticles = loadArticles;
export const getArticle = async (slug) => (await loadArticles()).find((a) => a.slug === slug);

// Propojení: články k receptu a recepty k článku (v pořadí, v jakém jsou na webu)
export const articlesFor = async (recipe) =>
  (await loadArticles()).filter((a) => recipe.clanky.includes(a.slug));
export const recipesFor = async (article) =>
  (await loadRecipes()).filter((r) => article.recepty.includes(r.slug));

// Produkty obchodu (digitální: plány, e-booky, kurz, předplatné)
const loadProducts = cache(async () => {
  const [produkty, texty] = await Promise.all([
    sql`SELECT * FROM produkty ORDER BY poradi, slug`,
    sql`SELECT * FROM produkty_texty`,
  ]);
  const t = podle(texty, "produkt");
  return produkty.map((p) => {
    const produkt = {
      slug: p.slug,
      typ: p.typ,
      // ceny chodí z databáze jako text (typ numeric) → převod na číslo
      cena: Number(p.cena_kc),
      cenaPuvodni: p.cena_puvodni === null ? null : Number(p.cena_puvodni),
      zaMesic: p.za_mesic,
      stav: p.stav,
      tecka: p.tecka,
      barva: p.barva,
      ukazka: p.ukazka,
    };
    for (const jazyk of jazyky) {
      const text = (t[p.slug] || []).find((x) => x.jazyk === jazyk);
      if (text) {
        produkt[jazyk] = { nazev: text.nazev, popis: text.popis, proKoho: text.pro_koho, obsah: text.obsah, format: text.format };
      }
    }
    return produkt;
  });
});

export const getProducts = loadProducts;
export const getProduct = async (slug) => (await loadProducts()).find((p) => p.slug === slug);

// Recepty pro appku Jídlo od A–Z (pohled appka_recepty v databázi)
export const getAppRecipes = cache(async () => {
  const radky = await sql`SELECT id, nazev, kategorie, jidlo, kcal, cas, suroviny, odkaz FROM appka_recepty ORDER BY poradi`;
  return radky.map((r) => ({ ...r }));
});

export const getAppArticles = cache(async () => {
  const radky = await sql`
    SELECT c.slug, t.nazev, c.cile
    FROM clanky c JOIN clanky_texty t ON t.clanek = c.slug AND t.jazyk = 'cs'
    WHERE c.zverejneno ORDER BY c.poradi`;
  return radky.map((r) => ({ nazev: r.nazev, odkaz: `cs/clanky/${r.slug}/`, cile: r.cile }));
});
