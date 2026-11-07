import Link from "next/link";
import { getDictionary, getLang } from "@/lib/i18n";
import { categories, getRecipes, getArticles, getRecipe } from "@/lib/content";
import RecipeCard from "@/components/RecipeCard";
import ArticleCard from "@/components/ArticleCard";
import Tecka from "@/components/Tecka";

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
      <section className="hero">
        <div className="hero-text">
          <h1>{h.title}</h1>
          <p className="lead">{h.lead}</p>
          <div className="actions">
            <Link className="btn btn-primary" href={`/${lang}/recepty/`}>{h.ctaRecipes}</Link>
            <a className="btn btn-accent" href={APP_URL}>{h.ctaApp}</a>
          </div>
        </div>
        <Tecka podoba="ahoj" size={260} className="hero-tecka" />
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

      {/* O Niky */}
      <section className="about-teaser" aria-labelledby="niky">
        <h2 id="niky">{h.aboutTitle}</h2>
        <p>{h.aboutLead}</p>
        <Link href={`/${lang}/o-mne/`}>{h.aboutCta} →</Link>
      </section>
    </>
  );
}
