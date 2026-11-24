import Link from "next/link";
import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getRecipes } from "@/lib/content";
import RecipeCard from "@/components/RecipeCard";
import ComicPanel from "@/components/ComicPanel";
import Tecka from "@/components/Tecka";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.grandma.title, description: dict.grandma.lead, alternates: alternates(await getLang(), "od-babicky/") };
}

// Od babičky: recepty z rodinných kuchařek. Nejdřív Nikyiny, později i od čtenářů (po schválení).
export default async function GrandmaPage() {
  const dict = await getDictionary();
  const lang = await getLang();
  const g = dict.grandma;
  const recepty = (await getRecipes()).filter((r) => r.puvod === "babicka" || r.puvod === "ctenar");

  return (
    <>
      <div className="page-intro">
        <div>
          <h1>{g.title}</h1>
          <p className="lead">{g.lead}</p>
        </div>
        <ComicPanel {...dict.comics.grandma} size={140} />
      </div>

      <section aria-labelledby="babicka-recepty">
        <h2 id="babicka-recepty">{g.listTitle}</h2>
        {recepty.length ? (
          <div className="grid">
            {recepty.map((r) => <RecipeCard key={r.slug} recipe={r} lang={lang} dict={dict} />)}
          </div>
        ) : (
          // prázdná kostra: první recepty doplní Niky
          <div className="card pad grandma-empty">
            <Tecka podoba="kolac" size={120} />
            <div>
              <p><strong>{g.emptyTitle}</strong></p>
              <p>{g.emptyText}</p>
              <Link className="btn btn-primary" href={`/${lang}/recepty/`}>{g.toRecipes}</Link>
            </div>
          </div>
        )}
      </section>

      {/* ochutnávka kroku 2: recepty od čtenářů (formulář přibude s účty) */}
      <section className="band band-honey grandma-soon" aria-labelledby="babicka-brzy">
        <h2 id="babicka-brzy">{g.soonTitle}</h2>
        <p>{g.soonText}</p>
        <ul className="variant-list">{g.soonSteps.map((s) => <li key={s}>{s}</li>)}</ul>
      </section>
    </>
  );
}
