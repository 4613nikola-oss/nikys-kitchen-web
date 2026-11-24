import Link from "next/link";
import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getRecipes, getAllergenNames } from "@/lib/content";
import RecipeBrowser from "@/components/RecipeBrowser";
import Icon from "@/components/Icon";
import ComicPanel from "@/components/ComicPanel";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.recipes.title, description: dict.recipes.lead, alternates: alternates(await getLang(), "recepty/") };
}

// Štítky se odvozují z dat receptu, nic se nevymýšlí ručně (vegetariánské je údaj v databázi)
function stitkyReceptu(r) {
  const t = [...(r.jidla || [])];
  if (r.cas <= 15) t.push("rychle");
  if (r.vegetarianske) t.push("vegetarianske");
  return t;
}
const TAGY = ["snidane", "obed", "svacina", "vecere", "rychle", "vegetarianske"];
const ALERGENY = ["lepek", "mleko", "vejce", "orechy", "arasidy", "sezam", "soja", "ryby"];

// Přehled receptů: hledání, filtry a postupné načítání (RecipeBrowser)
export default async function RecipesPage() {
  const dict = await getDictionary();
  const lang = await getLang();
  const recipes = (await getRecipes()).map((r) => ({ ...r, stitky: stitkyReceptu(r) }));
  const allergenNames = (await getAllergenNames())[lang];

  return (
    <>
      <div className="page-intro">
        <div>
          <h1>{dict.recipes.title}</h1>
          <p className="lead">{dict.recipes.lead}</p>
          <p><Link className="grandma-link" href={`/${lang}/od-babicky/`}><Icon name="babicka" size={22} /> {dict.grandma.linkFromRecipes} →</Link></p>
        </div>
        <ComicPanel {...dict.comics.recipes} size={140} />
      </div>
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
