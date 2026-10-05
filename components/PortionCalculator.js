"use client";

import { useState } from "react";

// Suroviny s přepočtem porcí (tlačítka − a +). Množství se zaokrouhlí rozumně.
function format(n, lang) {
  const rounded = n >= 10 ? Math.round(n / 5) * 5 : Math.round(n * 10) / 10;
  return rounded.toLocaleString(lang === "cs" ? "cs-CZ" : "en-GB");
}

export default function PortionCalculator({ ingredients, basePortions, labels, lang }) {
  const [portions, setPortions] = useState(basePortions);
  const factor = portions / basePortions;

  return (
    <div className="portions">
      <div className="portions-control" role="group" aria-label={labels.portions}>
        <span>{labels.portions}:</span>
        <button type="button" onClick={() => setPortions(Math.max(1, portions - 1))} aria-label={labels.less}>−</button>
        <output aria-live="polite">{portions}</output>
        <button type="button" onClick={() => setPortions(Math.min(20, portions + 1))} aria-label={labels.more}>+</button>
      </div>
      <ul className="ingredients">
        {ingredients.map((i, idx) => (
          <li key={idx}>
            {i.mnozstvi != null && (
              <strong>
                {format(i.mnozstvi * factor, lang)} {i.jednotka}{" "}
              </strong>
            )}
            {i.co}
          </li>
        ))}
      </ul>
    </div>
  );
}
