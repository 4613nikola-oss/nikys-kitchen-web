import Link from "next/link";
import { notFound } from "next/navigation";
import { getDictionary, getLang } from "@/lib/i18n";
import { getArticles, getArticle, recipesFor } from "@/lib/content";
import RecipeCard from "@/components/RecipeCard";

export const dynamicParams = false;
export async function generateStaticParams() {
  return (await getArticles()).map((a) => ({ slug: a.slug }));
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const lang = await getLang();
  const a = await getArticle(slug);
  return a ? { title: a[lang].nazev, description: a[lang].perex } : {};
}

// Blok textu článku: nadpis, odstavec nebo seznam
function Block({ b }) {
  if (b.h) return <h2>{b.h}</h2>;
  if (b.ul) return <ul>{b.ul.map((x, i) => <li key={i}>{x}</li>)}</ul>;
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

      {/* Celý text po rozkliknutí – funguje i s klávesnicí a čtečkou */}
      <details className="more">
        <summary>{d.more}</summary>
        <div className="prose">
          {t.telo.map((b, i) => <Block key={i} b={b} />)}
        </div>
      </details>

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

      <p><Link href={`/${lang}/clanky/`}>← {d.back}</Link></p>
    </article>
  );
}
