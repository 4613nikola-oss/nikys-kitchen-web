import Link from "next/link";
import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getRecipes, getAllergenNames } from "@/lib/content";
import RecipeBrowser from "@/components/RecipeBrowser";
import Icon from "@/components/Icon";
import Tecka from "@/components/Tecka";
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
        <div className="page-intro-text">
          <p className="intro-kicker">{dict.recipes.kicker}</p>
          <h1>{dict.recipes.title}</h1>
          <p className="intro-lead">{dict.recipes.lead}</p>
          {/* čísla rubriky jako barevné štítky */}
          <ul className="intro-stats">
            <li className="intro-stat-1"><b>{recipes.length}</b> {dict.recipes.statRecipes}</li>
            <li className="intro-stat-2"><b>{recipes.filter((r) => r.vegetarianske).length}</b> {dict.recipes.statVege}</li>
            <li className="intro-stat-3"><b>{recipes.filter((r) => r.cas <= 15).length}</b> {dict.recipes.statQuick}</li>
          </ul>
        </div>
        <ComicPanel {...dict.comics.recipes} size={140} />
      </div>

      {/* Lákadlo na Od babičky: výrazná karta, ať se tam lidem chce */}
      <Link className="grandma-teaser" href={`/${lang}/od-babicky/`}>
        <Tecka podoba="kolac" size={110} />
        <span className="grandma-teaser-text">
          <span className="grandma-teaser-kicker"><Icon name="babicka" size={18} /> {dict.grandma.teaserKicker}</span>
          <span className="grandma-teaser-title">{dict.grandma.teaserTitle}</span>
          <span className="grandma-teaser-lead">{dict.grandma.teaserLead}</span>
        </span>
        <span className="btn btn-accent grandma-teaser-btn">{dict.grandma.teaserCta} →</span>
      </Link>
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
