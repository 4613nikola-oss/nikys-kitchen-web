import Link from "next/link";
import { alternates } from "@/lib/site";
import { getDictionary, getLang } from "@/lib/i18n";
import { categories, getRecipes, getArticles, getRecipe } from "@/lib/content";
import RecipeCard from "@/components/RecipeCard";
import ArticleCard from "@/components/ArticleCard";
import Tecka from "@/components/Tecka";
import TeckaMorph from "@/components/TeckaMorph";
import ComicPanel from "@/components/ComicPanel";
import NewsletterBox from "@/components/NewsletterBox";

export async function generateMetadata() {
  return { alternates: alternates(await getLang()) };
}

const APP_URL = "https://4613nikola-oss.github.io/jidlo-od-a-z/";

export default async function HomePage() {
  const dict = await getDictionary();
  const lang = await getLang();
  const h = dict.home;
  const base = await getRecipe("pecena-zelenina-s-quinoou");
  const recipes = await getRecipes();
  const articles = await getArticles();

  return (
    <>
      {/* Úvod */}
      {/* Titulní strana novin: velký titulek, perex, vedle komiksový panel */}
      <section className="hero">
        <div className="hero-text">
          <h1 className="headline">{h.title}</h1>
          <p className="lead dropcap">{h.lead}</p>
          <div className="actions">
            <Link className="btn btn-primary" href={`/${lang}/recepty/`}>{h.ctaRecipes}</Link>
            <a className="btn btn-accent" href={APP_URL}>{h.ctaApp}</a>
          </div>
        </div>
        <ComicPanel text={h.heroBubble} label={h.kicker} tone="med" className="hero-panel">
          <TeckaMorph size={220} />
        </ComicPanel>
      </section>

      {/* Komiks dne: tři panely s hláškami */}
      <section aria-labelledby="komiks">
        <h2 id="komiks" className="rubrika">{h.comicTitle} <small>{h.comicSub}</small></h2>
        <div className="comic-strip">
          {h.comics.map((c) => (
            <ComicPanel key={c.text} text={c.text} podoba={c.podoba} tone={c.tone} />
          ))}
        </div>
      </section>

      {/* Jeden základ, tři varianty */}
      <section className="band band-sage" aria-labelledby="zaklad">
        <div className="band-grid">
          <Tecka podoba="talir" size={200} />
          <div>
            <h2 id="zaklad">{h.baseTitle}</h2>
            <p>{h.baseLead}</p>
            <ul className="variant-list">
              {base[lang].varianty.map((v) => (
                <li key={v.nazev}><strong>{v.nazev}:</strong> {v.text}</li>
              ))}
            </ul>
            <Link className="btn btn-primary" href={`/${lang}/recepty/${base.slug}/`}>{h.baseCta}</Link>
          </div>
        </div>
      </section>

      {/* Recepty po kategoriích */}
      <section aria-labelledby="recepty">
        <div className="section-head">
          <h2 id="recepty">{h.recipesTitle}</h2>
          <Link href={`/${lang}/recepty/`}>{h.recipesAll} →</Link>
        </div>
        {categories.map((cat) => (
          <div key={cat} className="category-row">
            <h3 className="category-title">{dict.categories[cat]}</h3>
            <div className="grid">
              {recipes.filter((r) => r.kategorie === cat).slice(0, 3).map((r) => (
                <RecipeCard key={r.slug} recipe={r} lang={lang} dict={dict} />
              ))}
            </div>
          </div>
        ))}
      </section>

      {/* Články */}
      <section aria-labelledby="clanky">
        <div className="section-head">
          <h2 id="clanky">{h.articlesTitle}</h2>
          <Link href={`/${lang}/clanky/`}>{h.articlesAll} →</Link>
        </div>
        <div className="grid">
          {articles.slice(0, 3).map((a) => (
            <ArticleCard key={a.slug} article={a} lang={lang} dict={dict} />
          ))}
        </div>
      </section>

      {/* Appka */}
      <section className="band band-honey" aria-labelledby="appka">
        <div className="band-grid">
          <Tecka podoba="premysli" size={200} />
          <div>
            <h2 id="appka">{h.appTitle}</h2>
            <p>{h.appLead}</p>
            <a className="btn btn-accent" href={APP_URL}>{h.appCta}</a>
          </div>
        </div>
      </section>

      {/* Kdo je Niky: polaroid jako na stránce O mně, krátce a s tlačítkem */}
      <section className="about-teaser card pad" aria-labelledby="niky">
        <figure className="polaroid about-teaser-photo">
          <span className="pin" aria-hidden="true" />
          <Tecka podoba="vari" size={150} />
          <figcaption className="hand">{dict.about.photoCaption}</figcaption>
        </figure>
        <div>
          <h2 id="niky">{h.aboutTitle}</h2>
          <p>{h.aboutLead}</p>
          <ul className="about-facts">
            {h.aboutFacts.map((f) => <li key={f}>{f}</li>)}
          </ul>
          <Link className="btn btn-primary" href={`/${lang}/o-mne/`}>{h.aboutCta}</Link>
        </div>
      </section>

      {/* Newsletter s dárkem */}
      <NewsletterBox dict={dict} lang={lang} id="newsletter-uvod" />
    </>
  );
}
