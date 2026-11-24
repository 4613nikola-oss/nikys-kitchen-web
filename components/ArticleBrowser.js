"use client";

import { useState } from "react";
import ArticleCard from "./ArticleCard";

// Přehled článků s filtrem podle cíle: Vše / Fit / Normal / Svaly.
// Článek „Pro všechny“ se ukáže u každého cíle.
const CILE = ["vse", "hubnout", "udrzet", "nabrat"];

export default function ArticleBrowser({ articles, lang, dict }) {
  const [cil, setCil] = useState("vse");
  const d = dict.articles;
  const vysledky = cil === "vse" ? articles : articles.filter((a) => a.cile.includes(cil) || a.cile.includes("vse"));

  return (
    <>
      <div className="filter-row article-filters" role="group" aria-label={d.filterLabel}>
        {CILE.map((c) => (
          <button
            key={c}
            type="button"
            className={`chip chip-filter${cil === c ? " is-on" : ""}`}
            aria-pressed={cil === c}
            onClick={() => setCil(c)}
          >
            {c === "vse" ? d.filterAll : d.goals[c]}
          </button>
        ))}
        <span className="filter-count" aria-live="polite">{d.filterCount.replace("{n}", vysledky.length)}</span>
      </div>
      <div className="grid grid-articles">
        {vysledky.map((a) => <ArticleCard key={a.slug} article={a} lang={lang} dict={dict} />)}
      </div>
    </>
  );
}
