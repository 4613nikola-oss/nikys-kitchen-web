import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getRecipes, getAllergenNames } from "@/lib/content";
import RecipeBrowser from "@/components/RecipeBrowser";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.recipes.title, description: dict.recipes.lead, alternates: alternates(await getLang(), "recepty/") };
}

// Štítky se odvozují z dat receptu, nic se nevymýšlí ručně
const MASO = /kuř|maso|šunk|ryb|tuňák|slanin/i;
function stitkyReceptu(r) {
  const t = [...(r.jidla || [])];
  if (r.cas <= 15) t.push("rychle");
  if (!r.cs.suroviny.some((s) => MASO.test(s.co))) t.push("vegetarianske");
  return t;
}
const TAGY = ["snidane", "obed", "svacina", "vecere", "rychle", "vegetarianske"];
const ALERGENY = ["lepek", "mleko", "vejce", "orechy"];

// Přehled receptů: hledání, filtry a postupné načítání (RecipeBrowser)
export default async function RecipesPage() {
  const dict = await getDictionary();
  const lang = await getLang();
  const recipes = (await getRecipes()).map((r) => ({ ...r, stitky: stitkyReceptu(r) }));
  const allergenNames = (await getAllergenNames())[lang];

  return (
    <>
      <h1>{dict.recipes.title}</h1>
      <p className="lead">{dict.recipes.lead}</p>
      <RecipeBrowser
        recipes={recipes}
        lang={lang}
        dict={dict}
        tagKeys={TAGY}
        allergenKeys={ALERGENY}
        allergenNames={allergenNames}
      />
    </>
  );
}
