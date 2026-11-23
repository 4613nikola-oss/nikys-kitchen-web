"use client";

import { useMemo, useRef, useState } from "react";
import Link from "next/link";
import RecipeCard from "./RecipeCard";
import Icon from "./Icon";
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

  // Našeptávač: při psaní ukáže až 5 receptů (nejlepší shoda), šipkami se dá projít
  const [naseptavac, setNaseptavac] = useState(false);
  const seznamRef = useRef(null);
  const navrhy = query.trim().length >= 2
    ? recipes
        .map((r) => ({ r, score: matchScore(query, textReceptu(r)) }))
        .filter((x) => x.score !== Infinity)
        .sort((a, b) => a.score - b.score)
        .slice(0, 5)
        .map((x) => x.r)
    : [];
  const ukazNavrhy = naseptavac && navrhy.length > 0;
  const posunFokus = (e, smer) => {
    const odkazy = [...(seznamRef.current?.querySelectorAll("a") || [])];
    const i = odkazy.indexOf(document.activeElement);
    const dalsi = odkazy[i + smer];
    if (dalsi) { e.preventDefault(); dalsi.focus(); }
    else if (smer < 0 && i === 0) { e.preventDefault(); document.getElementById("recipe-search")?.focus(); }
  };
  const klavesy = (e) => {
    if (e.key === "Escape") { setNaseptavac(false); document.getElementById("recipe-search")?.focus(); }
    if (e.key === "ArrowDown") posunFokus(e, 1);
    if (e.key === "ArrowUp") posunFokus(e, -1);
  };

  const chip = (aktivniSeznam, nastav, hodnota, popisek, ikona) => (
    <button
      type="button"
      key={hodnota}
      className={`chip chip-filter${ikona ? " chip-filter-cat cat-" + hodnota : ""}${aktivniSeznam.includes(hodnota) ? " is-on" : ""}`}
      aria-pressed={aktivniSeznam.includes(hodnota)}
      onClick={() => prepni(aktivniSeznam, nastav, hodnota)}
    >
      {ikona && <Icon name={ikona} size={26} />}
      {popisek}
    </button>
  );

  return (
    <div className="recipe-browser">
      <div className="filters card pad">
        {/* obal zavře našeptávač, až fokus odejde mimo políčko i seznam */}
        <div
          className="search-wrap"
          onKeyDown={klavesy}
          onBlur={(e) => { if (!e.currentTarget.contains(e.relatedTarget)) setNaseptavac(false); }}
        >
          <label className="search-field">
            <span className="visually-hidden">{f.search}</span>
            <Icon name="hledat" size={24} className="search-icon" />
            <input
              id="recipe-search"
              type="search"
              value={query}
              placeholder={f.searchPlaceholder}
              autoComplete="off"
              aria-autocomplete="list"
              aria-controls="recipe-suggest"
              aria-expanded={ukazNavrhy}
              onFocus={() => setNaseptavac(true)}
              onChange={(e) => { setQuery(e.target.value); setNaseptavac(true); setPocet(NA_STRANKU); }}
            />
          </label>
          {ukazNavrhy && (
            <ul className="suggest" id="recipe-suggest" ref={seznamRef} aria-label={dict.recipes.suggestTitle}>
              {navrhy.map((r) => (
                <li key={r.slug}>
                  <Link href={`/${lang}/recepty/${r.slug}/`} className={`suggest-item cat-${r.kategorie}`}>
                    <Icon name={r.kategorie} size={22} />
                    <span className="suggest-name">{r[lang].nazev}</span>
                    <span className="suggest-meta">{r.cas} min{r.kcal ? ` · ~${r.kcal} kcal` : ""}</span>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </div>

        <div className="filter-row filter-row-cats" role="group" aria-label={dict.recipes.filterLabel}>
          {["slane", "sladke", "napoje"].map((k) => chip(kategorie, setKategorie, k, dict.categories[k], k))}
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
