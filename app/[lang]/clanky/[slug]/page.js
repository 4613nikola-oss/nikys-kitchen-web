import Link from "next/link";
import { notFound } from "next/navigation";
import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import Image from "next/image";
import { getArticles, getArticle, recipesFor, getRecipes } from "@/lib/content";
import { asset } from "@/lib/asset";
import Icon from "@/components/Icon";
import Tecka from "@/components/Tecka";
import RecipeCard from "@/components/RecipeCard";
import ComicPanel from "@/components/ComicPanel";
import ArticleCard from "@/components/ArticleCard";
import NewsletterBox from "@/components/NewsletterBox";

export const dynamicParams = false;
export async function generateStaticParams() {
  return (await getArticles()).map((a) => ({ slug: a.slug }));
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const lang = await getLang();
  const a = await getArticle(slug);
  return a ? { title: a[lang].nazev, description: a[lang].perex, alternates: alternates(lang, `clanky/${slug}/`) } : {};
}

// Blok textu článku: nadpis, odstavec, seznam, „Věděla jsi?“, „Vyzkoušej hned“, recept nebo článek v textu
function Block({ b, d, lang, recepty, clanky }) {
  if (b.h) return <h2>{b.h}</h2>;
  if (b.ul) return <ul>{b.ul.map((x, i) => <li key={i}>{x}</li>)}</ul>;
  if (b.fakt) {
    return (
      <aside className="fact-box">
        <p className="fact-box-title"><Icon name="zarovka" size={24} /> {d.didYouKnow}</p>
        <p>{b.fakt}</p>
        {b.url && <p className="fact-box-source">{d.source}: <a href={b.url} rel="noopener" target="_blank">{b.zdroj}</a></p>}
      </aside>
    );
  }
  if (b.tipy) {
    return (
      <aside className="try-box">
        <p className="try-box-title">{d.tryNow}</p>
        <ol>{b.tipy.map((x, i) => <li key={i}>{x}</li>)}</ol>
      </aside>
    );
  }
  if (b.recept) {
    const r = recepty.find((x) => x.slug === b.recept);
    if (!r) return null;
    return (
      <Link className="inline-recipe" href={`/${lang}/recepty/${r.slug}/`}>
        {r.obrazek
          ? <Image src={asset(`/images/recepty/${r.obrazek}`)} alt="" width={120} height={120} className="inline-recipe-img" />
          : <span className="inline-recipe-img inline-recipe-tecka"><Tecka podoba={r.tecka || "talir"} size={70} /></span>}
        <span className="inline-recipe-text">
          <span className="inline-recipe-kicker">{d.tryRecipe}</span>
          <strong>{r[lang].nazev}</strong>
          <span className="inline-recipe-meta">{r.cas} min{r.kcal ? ` · ~${r.kcal} kcal` : ""}</span>
        </span>
        <span className="inline-recipe-arrow" aria-hidden="true">→</span>
      </Link>
    );
  }
  if (b.clanek) {
    const a = clanky.find((x) => x.slug === b.clanek);
    if (!a) return null;
    return (
      <p className="inline-article"><Link href={`/${lang}/clanky/${a.slug}/`}>{d.alsoRead}: <strong>{a[lang].nazev}</strong> →</Link></p>
    );
  }
  return <p>{b.p}</p>;
}

export default async function ArticlePage({ params }) {
  const { slug } = await params;
  const article = await getArticle(slug);
  if (!article) notFound();

  const dict = await getDictionary();
  const lang = await getLang();
  const t = article[lang];
  const d = dict.articles;
  const related = await recipesFor(article);
  const vsechnyRecepty = await getRecipes();
  const vsechnyClanky = await getArticles();
  // 3 další články – víc společných cílů = výš, jinak v pořadí webu
  const spolecne = (a) => a.cile.filter((c) => article.cile.includes(c)).length;
  const doporucene = (await getArticles())
    .filter((a) => a.slug !== article.slug)
    .map((a, i) => ({ a, skore: spolecne(a), i }))
    .sort((x, y) => y.skore - x.skore || x.i - y.i)
    .slice(0, 3)
    .map((x) => x.a);

  return (
    <article className="article">
      <p className="breadcrumb"><Link href={`/${lang}/clanky/`}>← {d.title}</Link></p>
      <h1>{t.nazev}</h1>
      <p className="muted">{d.readTime.replace("{n}", article.cteni)}</p>

      {/* V kostce – 3 body pro rychlé čtení */}
      <section className="in-short card pad" aria-labelledby="v-kostce">
        <h2 id="v-kostce">{d.inShort}</h2>
        <ul>{t.vKostce.map((x, i) => <li key={i}>{x}</li>)}</ul>
      </section>

      {/* Celý text hned vidět (dřív byl schovaný za „Chci vědět víc“) */}
      <div className="prose article-body">
        {t.telo.map((b, i) => <Block key={i} b={b} d={d} lang={lang} recepty={vsechnyRecepty} clanky={vsechnyClanky} />)}
      </div>

      {article.zdroje.length > 0 && (
        <section aria-labelledby="zdroje" className="sources">
          <h2 id="zdroje">{d.sources}</h2>
          <ul>
            {article.zdroje.map((z) => (
              <li key={z.url}><a href={z.url} rel="noopener">{z.nazev}</a></li>
            ))}
          </ul>
        </section>
      )}

      {/* konec článku: komiksová hláška */}
      <ComicPanel {...dict.comics.article} size={140} className="article-comic" />

      {related.length > 0 && (
        <section aria-labelledby="recepty-k-clanku">
          <h2 id="recepty-k-clanku">{d.related}</h2>
          <div className="grid">
            {related.map((r) => (
              <RecipeCard key={r.slug} recipe={r} lang={lang} dict={dict} />
            ))}
          </div>
        </section>
      )}

      {/* Doporučené články: nejdřív ty se stejným cílem (Fit / Normal / Svaly) */}
      {doporucene.length > 0 && (
        <section aria-labelledby="doporucene">
          <h2 id="doporucene">{d.recommended}</h2>
          <div className="grid grid-articles">
            {doporucene.map((a) => <ArticleCard key={a.slug} article={a} lang={lang} dict={dict} />)}
          </div>
        </section>
      )}

      <NewsletterBox dict={dict} lang={lang} id="newsletter-clanek" />

      <p><Link href={`/${lang}/clanky/`}>← {d.back}</Link></p>
    </article>
  );
}
