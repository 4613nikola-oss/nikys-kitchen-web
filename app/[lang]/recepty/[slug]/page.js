import Link from "next/link";
import Image from "next/image";
import { notFound } from "next/navigation";
import { getDictionary, getLang } from "@/lib/i18n";
import { getRecipes, getRecipe, getArticles, articlesFor, getAllergenNames } from "@/lib/content";
import RecipeCard from "@/components/RecipeCard";
import { asset } from "@/lib/asset";
import PortionCalculator from "@/components/PortionCalculator";
import Icon from "@/components/Icon";
import ComicPanel from "@/components/ComicPanel";
import ArticleCard from "@/components/ArticleCard";
import Tecka from "@/components/Tecka";
import PrintButton from "@/components/PrintButton";
import DifficultyFace from "@/components/DifficultyFace";
import AppBridge from "@/components/AppBridge";
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

// V krocích postupu zvýrazní teplotu a časy (180 °C, 12–15 minut, 1 hodina, 30 sekund)
const DULEZITE = /(\d+(?:[,.]\d+)?(?:\s?[–-]\s?\d+)?\s?°\s?C|\d+(?:\s?[–-]\s?\d+)?\s?(?:minut[a-zěščřžýáíéůú]*|min\b|hodin[a-zěščřžýáíéůú]*|hod\b|sekund[a-zěščřžýáíéůú]*|minutes?|hours?|seconds?))/gi;
function zvyrazni(text) {
  return text.split(DULEZITE).map((kus, i) =>
    i % 2 === 1 ? <strong key={i} className={`step-key${kus.includes("°") ? " step-temp" : ""}`}>{kus}</strong> : kus
  );
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
  if (recipe.kcal && recipe.bilkoviny != null) data.nutrition.proteinContent = `${recipe.bilkoviny} g`;
  if (recipe.vegetarianske) data.suitableForDiet = "https://schema.org/VegetarianDiet";
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
  // články: nejdřív napojené na recept, pak doplnit do 3 podle toho, pro koho recept je
  const prime = await articlesFor(recipe);
  const ostatniClanky = (await getArticles())
    .filter((a) => !prime.some((p) => p.slug === a.slug))
    .map((a) => ({ a, skore: a.cile.includes("vse") ? 1 : a.cile.filter((c) => recipe.cile.includes(c)).length * 2 }))
    .sort((x, y) => y.skore - x.skore)
    .map((x) => x.a);
  const related = [...prime, ...ostatniClanky].slice(0, 3);
  // podobné recepty: stejná kategorie, společný cíl, přednostně s fotkou
  const podobne = (await getRecipes())
    .filter((r) => r.slug !== recipe.slug)
    .map((r) => ({
      r,
      skore: (r.kategorie === recipe.kategorie ? 3 : 0) + r.cile.filter((c) => recipe.cile.includes(c)).length + (r.obrazek ? 1 : 0),
    }))
    .sort((x, y) => y.skore - x.skore)
    .slice(0, 3)
    .map((x) => x.r);
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
          {recipe.puvod !== "niky" && (
            <Link className="chip chip-grandma" href={`/${lang}/od-babicky/`}><Icon name="babicka" size={16} /> {dict.grandma.badge[recipe.puvod]}</Link>
          )}
          <h1>{t.nazev}</h1>
          {/* V kostce: úvod a hlavní údaje na první pohled */}
          <section className="in-short" aria-label={d.inShort}>
            <p>{t.uvod}</p>
            <dl className="facts">
              <div><dt><Icon name="cas" size={18} /> {d.time}</dt><dd>{recipe.cas} min</dd></div>
              <div><dt><Icon name="porce" size={18} /> {d.portions}</dt><dd>1</dd></div>
              <div>
                <dt><Icon name="kcal" size={18} /> {d.kcal}</dt>
                <dd>{recipe.kcal ? `~${recipe.kcal} (${d.kcalApprox})` : d.kcalMissing}</dd>
              </div>
              {recipe.bilkoviny != null && (
                <div>
                  <dt><Icon name="bilkoviny" size={18} /> {d.protein}</dt>
                  <dd>~{recipe.bilkoviny} g ({d.kcalApprox})</dd>
                </div>
              )}
              {recipe.narocnost && (
                <div>
                  <dt>{d.difficulty}</dt>
                  {/* 1–3 vařečky; slovo vedle nese význam i bez obrázku */}
                  <dd className="difficulty">
                    <DifficultyFace level={recipe.narocnost} />
                    {d.difficultyNames[recipe.narocnost]}
                  </dd>
                </div>
              )}
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

          {/* propojení s appkou: přidat suroviny do nákupu, zpět do appky */}
          <AppBridge items={recipe.cs?.nakup || []} labels={d.bridge} />

          {/* Pro koho to je: štítky Fit / Normal / Svaly a jednou větou proč */}
          {recipe.cile.length > 0 && (
            <section className="for-whom" aria-labelledby="pro-koho">
              <h2 id="pro-koho" className="h3">{d.forWhom}</h2>
              <ul>
                {recipe.cile.map((c) => (
                  <li key={c}>
                    <span className={`goal goal-${c}`}>{d.goals[c]}</span>
                    <span>{d.goalWhy[c]}</span>
                  </li>
                ))}
              </ul>
              <p className="for-whom-note">{d.forWhomNote}</p>
            </section>
          )}
          {recipe.status === "ukazka" && <p className="note">{d.draft}</p>}
        </div>
        <div className="recipe-media">
          {recipe.obrazek ? (
            <figure className="photo-fig">
              <Image src={asset(`/images/recepty/${recipe.obrazek}`)} alt={t.nazev} width={700} height={525} priority />
              {/* volná fotka: autor a licence (podmínka licence CC BY) */}
              {recipe.obrazekZdroj && (
                <figcaption className="photo-credit">
                  {d.photoBy} {recipe.obrazekZdroj.odkaz ? <a href={recipe.obrazekZdroj.odkaz} rel="noopener" target="_blank">{recipe.obrazekZdroj.autor}</a> : recipe.obrazekZdroj.autor}
                  {", "}
                  {recipe.obrazekZdroj.licence_url ? <a href={recipe.obrazekZdroj.licence_url} rel="noopener" target="_blank">{recipe.obrazekZdroj.licence}</a> : recipe.obrazekZdroj.licence}
                  {" · "}{d.photoNote}
                </figcaption>
              )}
            </figure>
          ) : (
            <Tecka podoba={recipe.tecka} size={240} />
          )}
        </div>
      </header>

      {/* Příběh receptu – jako lísteček z rodinné kuchařky */}
      {t.pribeh && (
        <aside className="tip story" aria-labelledby="pribeh">
          <Tecka podoba="kolac" size={90} />
          <div>
            <h2 id="pribeh">{dict.grandma.storyTitle}</h2>
            <p>{t.pribeh}</p>
          </div>
        </aside>
      )}

      <div className="recipe-body">
        <section aria-labelledby="suroviny" className="card pad sticker">
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
          <ol className="steps steps-clippings">
            {t.postup.map((s, i) => (
              <li key={i}>
                <p>{zvyrazni(s.text)}</p>
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
        <aside className="tip tip-highlight">
          <Tecka podoba="vari" size={90} />
          <div>
            <h2>{d.tip}</h2>
            <p>{t.tip}</p>
          </div>
        </aside>
      )}

      {/* konec receptu: komiksová hláška a cesta do appky */}
      <section className="band band-honey recipe-outro" aria-labelledby="kolik-snist">
        <ComicPanel {...dict.comics.recipe} size={130} />
        <div className="recipe-outro-text">
          <h2 id="kolik-snist">{d.outro.title}</h2>
          <p>{d.outro.lead}</p>
          <ul className="outro-perks">
            <li><Icon name="kcal" size={22} /> <span>{d.outro.perks[0]}</span></li>
            <li><Icon name="porce" size={22} /> <span>{d.outro.perks[1]}</span></li>
            <li><Icon name="nakup" size={22} /> <span>{d.outro.perks[2]}</span></li>
          </ul>
          <a className="btn btn-accent" href={APP_URL}>{d.outro.cta} →</a>
          <p className="outro-note">{d.outro.note}</p>
        </div>
      </section>

      {podobne.length > 0 && (
        <section aria-labelledby="podobne-recepty">
          <div className="section-head">
            <h2 id="podobne-recepty">{d.similar}</h2>
            <Link href={`/${lang}/recepty/`}>{d.allRecipes} →</Link>
          </div>
          <div className="grid">
            {podobne.map((r) => <RecipeCard key={r.slug} recipe={r} lang={lang} dict={dict} />)}
          </div>
        </section>
      )}

      {related.length > 0 && (
        <section aria-labelledby="clanky-k-receptu">
          <div className="section-head">
            <h2 id="clanky-k-receptu">{d.related}</h2>
            <Link href={`/${lang}/clanky/`}>{d.allArticles} →</Link>
          </div>
          <div className="grid grid-articles">
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
