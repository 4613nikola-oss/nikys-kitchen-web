// Mapa webu pro Google (sitemap.xml) – všechny stránky v obou jazycích
import { getRecipes, getArticles, getProducts } from "@/lib/content";
import { SITE_URL } from "@/lib/site";

export const dynamic = "force-static";

const STATICKE = ["", "recepty/", "clanky/", "aplikace/", "obchod/", "o-mne/", "soukromi/", "pristupnost/"];

export default async function sitemap() {
  const [recepty, clanky, produkty] = await Promise.all([getRecipes(), getArticles(), getProducts()]);
  const cesty = [
    ...STATICKE,
    ...recepty.map((r) => `recepty/${r.slug}/`),
    ...clanky.map((a) => `clanky/${a.slug}/`),
    ...produkty.map((p) => `obchod/${p.slug}/`),
  ];
  return cesty.flatMap((cesta) =>
    ["cs", "en"].map((lang) => ({
      url: `${SITE_URL}/${lang}/${cesta}`,
      changeFrequency: "weekly",
      priority: cesta === "" ? 1 : cesta.includes("/") && cesta.split("/").length > 2 ? 0.7 : 0.8,
      alternates: { languages: { cs: `${SITE_URL}/cs/${cesta}`, en: `${SITE_URL}/en/${cesta}` } },
    }))
  );
}
