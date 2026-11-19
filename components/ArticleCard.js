import Link from "next/link";
import Tecka from "./Tecka";
import Icon from "./Icon";

// Karta článku: komiksový obrázek s Tečkou, název, perex psaný rukou, dole čas čtení a pro koho (Fit / Normal / Svaly)
const PODOBY = ["premysli", "vidlicka", "talir", "radost", "pohar", "vari", "jejda"];
const TONY = ["zelena", "med", "ruzova"];
const hash = (s) => [...s].reduce((a, c) => (a * 31 + c.charCodeAt(0)) >>> 0, 7);

export default function ArticleCard({ article, lang, dict }) {
  const t = article[lang];
  const h = hash(article.slug);
  const goals = dict.articles.goals;
  return (
    <article className="card article-card">
      <Link href={`/${lang}/clanky/${article.slug}/`} className="card-link">
        <div className={`card-media comic-${TONY[h % TONY.length]}`}>
          <Tecka podoba={PODOBY[h % PODOBY.length]} size={130} />
        </div>
        <div className="card-body">
          <h3>{t.nazev}</h3>
          <p className="hand-sm">{t.perex}</p>
          <p className="card-meta">
            <span className="fact"><Icon name="cas" size={18} /> {dict.articles.readTime.replace("{n}", article.cteni)}</span>
            {article.cile.map((c) => <span key={c} className={`goal goal-${c}`}>{goals[c]}</span>)}
          </p>
        </div>
      </Link>
    </article>
  );
}
