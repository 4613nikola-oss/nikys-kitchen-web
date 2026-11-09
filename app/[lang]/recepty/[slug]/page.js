import Link from "next/link";
import Image from "next/image";
import { notFound } from "next/navigation";
import { getDictionary, getLang } from "@/lib/i18n";
import { getRecipes, getRecipe, articlesFor, getAllergenNames } from "@/lib/content";
import { asset } from "@/lib/asset";
import PortionCalculator from "@/components/PortionCalculator";
import ArticleCard from "@/components/ArticleCard";
import Tecka from "@/components/Tecka";
import PrintButton from "@/components/PrintButton";
import { SITE_URL, alternates } from "@/lib/site";

const APP_URL = "https://4613nikola-oss.github.io/jidlo-od-a-z/";

export const dynamicParams = false;
export async function generateStaticParams() {
  return (await getRecipes()).map((r) => ({ slug: r.slug }));
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const lang = await getLang();
  const r = await getRecipe(slug);
  if (!r) return {};
  return {
    title: r[lang].nazev,
    description: r[lang].uvod,
    alternates: alternates(lang, `recepty/${slug}/`),
    openGraph: {
      type: "article",
      title: r[lang].nazev,
      description: r[lang].uvod,
      ...(r.obrazek ? { images: [{ url: `${SITE_URL}/images/recepty/${r.obrazek}`, alt: r[lang].nazev }] } : {}),
    },
  };
}

// Data receptu pro Google (schema.org/Recipe): čas, porce, kcal, suroviny a postup ve výsledcích hledání
function receptProGoogle(recipe, lang, kategorie) {
  const t = recipe[lang];
  const data = {
    "@context": "https://schema.org",
    "@type": "Recipe",
    name: t.nazev,
    description: t.uvod,
    author: { "@type": "Person", name: "Niky" },
    inLanguage: lang,
    recipeCategory: kategorie,
    recipeYield: String(recipe.porce),
    totalTime: `PT${recipe.cas}M`,
    recipeIngredient: t.suroviny.map((s) => [s.mnozstvi, s.jednotka, s.co].filter(Boolean).join(" ")),
    recipeInstructions: t.postup.map((s) => ({ "@type": "HowToStep", text: s.text })),
  };
  if (recipe.kcal) data.nutrition = { "@type": "NutritionInformation", calories: `${recipe.kcal} kcal` };
  if (recipe.obrazek) data.image = [`${SITE_URL}/images/recepty/${recipe.obrazek}`];
  return JSON.stringify(data).replace(/</g, "\\u003c");
}

export default async function RecipePage({ params }) {
  const { slug } = await params;
  const recipe = await getRecipe(slug);
  if (!recipe) notFound();

  const dict = await getDictionary();
  const lang = await getLang();
  const t = recipe[lang];
  const d = dict.recipes;
  const related = await articlesFor(recipe);
  const allergenNames = await getAllergenNames();

  return (
    <article className="recipe">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: receptProGoogle(recipe, lang, dict.categories[recipe.kategorie]) }} />
      <div className="recipe-tools">
        <p className="breadcrumb">
          <Link href={`/${lang}/recepty/`}>← {d.back}</Link>
        </p>
        <PrintButton label={d.print} />
      </div>

      <header className="recipe-head">
        <div>
          <h1>{t.nazev}</h1>
          {/* V kostce: úvod a hlavní údaje na první pohled */}
          <section className="in-short" aria-label={d.inShort}>
            <p>{t.uvod}</p>
            <dl className="facts">
              <div><dt>{d.time}</dt><dd>{recipe.cas} min</dd></div>
              <div><dt>{d.portions}</dt><dd>{recipe.porce}</dd></div>
              <div>
                <dt>{d.kcal}</dt>
                <dd>{recipe.kcal ? `~${recipe.kcal} (${d.kcalApprox})` : d.kcalMissing}</dd>
              </div>
            </dl>
            {/* Alergeny: žlutý rámeček s výstražným trojúhelníkem (nejen barva – i pro lidi, kteří barvy nerozliší) */}
            {recipe.alergeny.length ? (
              <p className="allergens allergens-warn">
                <svg className="warn-icon" viewBox="0 0 24 24" width="26" height="26" aria-hidden="true">
                  <path d="M12 3 L22 20 H2 Z" fill="#f59e0b" stroke="#2c2c2c" strokeWidth="1.6" strokeLinejoin="round" />
                  <path d="M12 9 V14" stroke="#2c2c2c" strokeWidth="2" strokeLinecap="round" />
                  <circle cx="12" cy="17" r="1.2" fill="#2c2c2c" />
                </svg>
                <span>
                  <strong>{d.allergens}:</strong> {recipe.alergeny.map((a) => allergenNames[lang][a]).join(", ")}
                </span>
              </p>
            ) : (
              <p className="allergens"><strong>{d.allergens}:</strong> {d.noAllergens}</p>
            )}
          </section>
          {recipe.status === "ukazka" && <p className="note">{d.draft}</p>}
        </div>
        <div className="recipe-media">
          {recipe.obrazek ? (
            <Image src={asset(`/images/recepty/${recipe.obrazek}`)} alt={t.nazev} width={700} height={382} priority />
          ) : (
            <Tecka podoba={recipe.tecka} size={240} />
          )}
        </div>
      </header>

      <div className="recipe-body">
        <section aria-labelledby="suroviny" className="card pad">
          <h2 id="suroviny">{d.ingredients}</h2>
          <PortionCalculator
            ingredients={t.suroviny}
            basePortions={recipe.porce}
            kcal={recipe.kcal}
            labels={{ portions: d.portions, less: d.less, more: d.more, total: d.kcalTotal, perPortion: d.kcalPerPortion }}
            lang={lang}
          />
        </section>

        <section aria-labelledby="postup">
          <h2 id="postup">{d.steps}</h2>
          <ol className="steps">
            {t.postup.map((s, i) => (
              <li key={i}>
                <p>{s.text}</p>
                {s.obrazek && (
                  <Image src={asset(`/images/recepty/${s.obrazek}`)} alt="" width={560} height={306} loading="lazy" />
                )}
              </li>
            ))}
          </ol>
          {recipe.obrazekAi && <p className="note">{d.aiPhoto}</p>}
        </section>
      </div>

      {t.varianty && (
        <section className="band band-sage" aria-labelledby="varianty">
          <h2 id="varianty">{d.variantsTitle}</h2>
          <p>{d.variantsLead}</p>
          {/* Každá varianta jako výrazná karta na jiný den: v neděli upečeš základ, pak každý den jinak */}
          <ol className="variant-cards">
            {t.varianty.map((v, i) => {
              const [pismeno, ...nazev] = v.nazev.split(" – ");
              return (
                <li key={v.nazev} className={`card pad variant-card variant-${i}`}>
                  <span className="variant-day">{d.variantDays[i] || ""}</span>
                  <span className="variant-letter" aria-hidden="true">{pismeno}</span>
                  <h3>{nazev.join(" – ") || v.nazev}</h3>
                  <p>{v.text}</p>
                </li>
              );
            })}
          </ol>
        </section>
      )}

      {t.tip && (
        <aside className="tip">
          <Tecka podoba="vari" size={90} />
          <div>
            <h2>{d.tip}</h2>
            <p>{t.tip}</p>
          </div>
        </aside>
      )}

      <p>
        <a className="btn btn-accent" href={APP_URL}>{d.toApp}</a>
      </p>

      {related.length > 0 && (
        <section aria-labelledby="clanky-k-receptu">
          <h2 id="clanky-k-receptu">{d.related}</h2>
          <div className="grid">
            {related.map((a) => (
              <ArticleCard key={a.slug} article={a} lang={lang} dict={dict} />
            ))}
          </div>
        </section>
      )}

      <p><Link href={`/${lang}/recepty/`}>← {d.back}</Link></p>
    </article>
  );
}
