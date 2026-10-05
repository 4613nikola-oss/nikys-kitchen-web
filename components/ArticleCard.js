import Link from "next/link";

// Karta článku: název, perex a délka čtení
export default function ArticleCard({ article, lang, dict }) {
  const t = article[lang];
  return (
    <article className="card article-card">
      <Link href={`/${lang}/clanky/${article.slug}/`} className="card-link">
        <div className="card-body">
          <span className="chip chip-honey">{dict.articles.readTime.replace("{n}", article.cteni)}</span>
          <h3>{t.nazev}</h3>
          <p>{t.perex}</p>
        </div>
      </Link>
    </article>
  );
}
