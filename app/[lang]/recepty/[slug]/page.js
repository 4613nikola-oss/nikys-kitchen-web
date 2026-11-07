import Link from "next/link";
import Image from "next/image";
import { notFound } from "next/navigation";
import { getDictionary, getLang } from "@/lib/i18n";
import { getRecipes, getRecipe, articlesFor, getAllergenNames } from "@/lib/content";
import { asset } from "@/lib/asset";
import PortionCalculator from "@/components/PortionCalculator";
import ArticleCard from "@/components/ArticleCard";
import Tecka from "@/components/Tecka";

const APP_URL = "https://4613nikola-oss.github.io/jidlo-od-a-z/";

export const dynamicParams = false;
export async function generateStaticParams() {
  return (await getRecipes()).map((r) => ({ slug: r.slug }));
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const lang = await getLang();
  const r = await getRecipe(slug);
  return r ? { title: r[lang].nazev, description: r[lang].uvod } : {};
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
      <p className="breadcrumb">
        <Link href={`/${lang}/recepty/#${recipe.kategorie}`}>← {dict.categories[recipe.kategorie]}</Link>
      </p>

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
            <p className="allergens">
              <strong>{d.allergens}:</strong>{" "}
              {recipe.alergeny.length
                ? recipe.alergeny.map((a) => allergenNames[lang][a]).join(", ")
                : d.noAllergens}
            </p>
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
            labels={{ portions: d.portions, less: d.less, more: d.more }}
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
          <ul className="variant-list">
            {t.varianty.map((v) => (
              <li key={v.nazev}><strong>{v.nazev}:</strong> {v.text}</li>
            ))}
          </ul>
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
