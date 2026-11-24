"use client";

import { useState } from "react";
import ArticleCard from "./ArticleCard";

// Přehled článků: velká barevná tlačítka podle cíle (Vše / Fit / Normal / Svaly)
// a pod nimi hashtagy podle témat. Článek „Pro všechny“ se ukáže u každého cíle.
const CILE = ["vse", "hubnout", "udrzet", "nabrat"];

export default function ArticleBrowser({ articles, lang, dict }) {
  const [cil, setCil] = useState("vse");
  const [tema, setTema] = useState(null);
  const d = dict.articles;
  // témata seřazená podle toho, kolik článků je má
  const temata = Object.entries(articles.flatMap((a) => a.stitky).reduce((m, s) => ({ ...m, [s]: (m[s] || 0) + 1 }), {}))
    .sort((a, b) => b[1] - a[1]).map(([s]) => s);

  const vysledky = articles
    .filter((a) => cil === "vse" || a.cile.includes(cil) || a.cile.includes("vse"))
    .filter((a) => !tema || a.stitky.includes(tema));

  return (
    <>
      <div className="goal-filters" role="group" aria-label={d.filterLabel}>
        {CILE.map((c) => (
          <button
            key={c}
            type="button"
            className={`goal-tile goal-tile-${c}${cil === c ? " is-on" : ""}`}
            aria-pressed={cil === c}
            onClick={() => setCil(c)}
          >
            <span className="goal-tile-name">{c === "vse" ? d.filterAll : d.goalTiles[c].name}</span>
            <span className="goal-tile-sub">{c === "vse" ? d.filterAllSub : d.goalTiles[c].sub}</span>
          </button>
        ))}
      </div>

      <div className="hashtags" role="group" aria-label={d.topicsLabel}>
        {temata.map((s) => (
          <button
            key={s}
            type="button"
            className={`hashtag${tema === s ? " is-on" : ""}`}
            aria-pressed={tema === s}
            onClick={() => setTema(tema === s ? null : s)}
          >
            #{d.tagNames[s] || s}
          </button>
        ))}
        <span className="filter-count" aria-live="polite">{d.filterCount.replace("{n}", vysledky.length)}</span>
      </div>

      {vysledky.length ? (
        <div className="grid grid-articles">
          {vysledky.map((a) => <ArticleCard key={a.slug} article={a} lang={lang} dict={dict} />)}
        </div>
      ) : (
        <p className="card pad">{d.filterEmpty}</p>
      )}
    </>
  );
}
