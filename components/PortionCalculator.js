"use client";

import { useState } from "react";

// Suroviny s přepočtem porcí (tlačítka − a +). Začíná se na 1 porci, aby sedělo s „kcal na porci“.
// Množství se zaokrouhlí rozumně.
const KUSY = ["ks", "pc", "pcs", "stroužky", "cloves"];
function format(n, lang, jednotka) {
  // kusy na půlky (2,5 ks cukety), gramy a ml na pětky, malá čísla na desetiny
  const rounded = KUSY.includes(jednotka)
    ? Math.max(0.5, Math.round(n * 2) / 2)
    : n >= 10 ? Math.round(n / 5) * 5 : Math.round(n * 10) / 10;
  return rounded.toLocaleString(lang === "cs" ? "cs-CZ" : "en-GB");
}

// „1 stroužky“ → „1 stroužek“, „1 cloves“ → „1 clove“ (jen jednotky, které se skloňují)
const JEDNOTNE = { "stroužky": "stroužek", cloves: "clove", pcs: "pc" };
function jednotka(n, j) {
  const zaokrouhleno = KUSY.includes(j) ? Math.max(0.5, Math.round(n * 2) / 2) : n;
  return zaokrouhleno <= 1 && JEDNOTNE[j] ? JEDNOTNE[j] : j;
}

export default function PortionCalculator({ ingredients, basePortions, kcal, labels, lang }) {
  const [portions, setPortions] = useState(1);
  const factor = portions / basePortions;

  return (
    <div className="portions">
      <div className="portions-control" role="group" aria-label={labels.portions}>
        <span>{labels.portions}:</span>
        <button type="button" onClick={() => setPortions(Math.max(1, portions - 1))} aria-label={labels.less}>−</button>
        <output aria-live="polite">{portions}</output>
        <button type="button" onClick={() => setPortions(Math.min(20, portions + 1))} aria-label={labels.more}>+</button>
      </div>
      {kcal && (
        <p className="portions-kcal" aria-live="polite">
          {labels.total}: <strong>~{format(kcal * portions, lang)} kcal</strong>{" "}
          <span className="muted">({kcal} kcal {labels.perPortion})</span>
        </p>
      )}
      <ul className="ingredients">
        {ingredients.map((i, idx) => (
          <li key={idx}>
            {i.mnozstvi != null && (
              <strong>
                {format(i.mnozstvi * factor, lang, i.jednotka)} {jednotka(i.mnozstvi * factor, i.jednotka)}{" "}
              </strong>
            )}
            {i.co}
          </li>
        ))}
      </ul>
    </div>
  );
}
