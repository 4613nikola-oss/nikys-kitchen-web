"use client";

import { useMemo, useState } from "react";
import RecipeCard from "./RecipeCard";
import { matchScore, suggestions } from "@/lib/search";

const NA_STRANKU = 9;

// Přehled receptů s hledáním, štítky (víc najednou), „bez alergenu“ a postupným načítáním
export default function RecipeBrowser({ recipes, lang, dict, tagKeys, allergenKeys, allergenNames }) {
  const f = dict.recipes.filters;
  const [query, setQuery] = useState("");
  const [kategorie, setKategorie] = useState([]);
  const [stitky, setStitky] = useState([]);
  const [bez, setBez] = useState([]);
  const [pocet, setPocet] = useState(NA_STRANKU);

  const prepni = (seznam, nastav, hodnota) => {
    nastav(seznam.includes(hodnota) ? seznam.filter((x) => x !== hodnota) : [...seznam, hodnota]);
    setPocet(NA_STRANKU);
  };
  const vymazat = () => { setQuery(""); setKategorie([]); setStitky([]); setBez([]); setPocet(NA_STRANKU); };
  const textReceptu = (r) => `${r[lang].nazev} ${r[lang].suroviny.map((s) => s.co).join(" ")}`;

  const vysledky = useMemo(() => {
    return recipes
      .filter((r) => !kategorie.length || kategorie.includes(r.kategorie))
      .filter((r) => stitky.every((s) => r.stitky.includes(s)))
      .filter((r) => bez.every((a) => !r.alergeny.includes(a)))
      .map((r) => ({ r, score: query ? matchScore(query, textReceptu(r)) : 0 }))
      .filter((x) => x.score !== Infinity)
      .sort((a, b) => a.score - b.score)
      .map((x) => x.r);
    // textReceptu závisí jen na lang
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [recipes, kategorie, stitky, bez, query, lang]);

  const aktivni = query || kategorie.length || stitky.length || bez.length;
  const tipy = !vysledky.length && query ? suggestions(query, recipes, textReceptu) : [];

  const chip = (aktivniSeznam, nastav, hodnota, popisek) => (
    <button
      type="button"
      key={hodnota}
      className={`chip chip-filter${aktivniSeznam.includes(hodnota) ? " is-on" : ""}`}
      aria-pressed={aktivniSeznam.includes(hodnota)}
      onClick={() => prepni(aktivniSeznam, nastav, hodnota)}
    >
      {popisek}
    </button>
  );

  return (
    <div className="recipe-browser">
      <div className="filters card pad">
        <label className="search-field">
          <span className="visually-hidden">{f.search}</span>
          <input
            type="search"
            value={query}
            placeholder={f.searchPlaceholder}
            onChange={(e) => { setQuery(e.target.value); setPocet(NA_STRANKU); }}
          />
        </label>

        <div className="filter-row" role="group" aria-label={dict.recipes.filterLabel}>
          {["slane", "sladke", "napoje"].map((k) => chip(kategorie, setKategorie, k, dict.categories[k]))}
        </div>
        <div className="filter-row" role="group" aria-label={f.tags}>
          {tagKeys.map((t) => chip(stitky, setStitky, t, `#${f.tagNames[t]}`))}
        </div>
        <div className="filter-row" role="group" aria-label={f.without}>
          <span className="filter-label">{f.without}:</span>
          {allergenKeys.map((a) => chip(bez, setBez, a, allergenNames[a]))}
        </div>

        <div className="filter-foot">
          <span aria-live="polite">{f.results.replace("{n}", vysledky.length)}</span>
          {aktivni ? <button type="button" className="btn btn-ghost" onClick={vymazat}>{f.clear}</button> : null}
        </div>
      </div>

      {vysledky.length ? (
        <>
          <div className="grid">
            {vysledky.slice(0, pocet).map((r) => (
              <RecipeCard key={r.slug} recipe={r} lang={lang} dict={dict} />
            ))}
          </div>
          {pocet < vysledky.length && (
            <p className="load-more">
              <button type="button" className="btn btn-primary" onClick={() => setPocet(pocet + NA_STRANKU)}>
                {f.loadMore.replace("{n}", vysledky.length - pocet)}
              </button>
            </p>
          )}
        </>
      ) : (
        // Nikdy jen „nic tu není“: nabídneme podobné recepty a cestu zpět
        <div className="empty-state card pad">
          <p><strong>{query ? f.emptyQuery.replace("{q}", query) : f.empty}</strong></p>
          {tipy.length > 0 && (
            <>
              <p>{f.didYouMean}</p>
              <div className="grid">
                {tipy.map((r) => <RecipeCard key={r.slug} recipe={r} lang={lang} dict={dict} />)}
              </div>
            </>
          )}
          <p><button type="button" className="btn btn-primary" onClick={vymazat}>{f.clear}</button></p>
        </div>
      )}
    </div>
  );
}
