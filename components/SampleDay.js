import Link from "next/link";

// Ukázka jednoho dne z plánu: jídla ze skutečných receptů + nákupní seznam na 1 porci
export default function SampleDay({ den, recipes, lang, s }) {
  const items = den
    .map((d) => ({ jidlo: d.jidlo, recipe: recipes.find((r) => r.slug === d.recept) }))
    .filter((x) => x.recipe);

  // Nákupní seznam: suroviny všech jídel přepočtené na 1 porci, stejné položky sečtené
  const seznam = new Map();
  for (const { recipe } of items) {
    for (const s2 of recipe[lang].suroviny) {
      const klic = `${s2.co}|${s2.jednotka || ""}`;
      const mnozstvi = s2.mnozstvi ? s2.mnozstvi / recipe.porce : null;
      const byla = seznam.get(klic);
      seznam.set(klic, {
        co: s2.co,
        jednotka: s2.jednotka,
        mnozstvi: mnozstvi === null ? byla?.mnozstvi ?? null : (byla?.mnozstvi || 0) + mnozstvi,
      });
    }
  }
  const cislo = (n) => (Math.round(n * 10) / 10).toLocaleString(lang === "cs" ? "cs-CZ" : "en-GB");

  return (
    <div className="sample-day">
      <ol className="sample-meals">
        {items.map(({ jidlo, recipe }) => (
          <li key={jidlo} className="card pad">
            <span className="chip">{s.meals[jidlo]}</span>
            <h4 className="h3">{recipe[lang].nazev}</h4>
            <p className="muted">
              {recipe.cas} min{recipe.kcal ? ` · ~${recipe.kcal} kcal` : ""}
            </p>
            <Link href={`/${lang}/recepty/${recipe.slug}/`}>{s.recipeLink} →</Link>
          </li>
        ))}
      </ol>
      <section className="card pad sample-list" aria-labelledby="nakup">
        <h4 id="nakup" className="h3">{s.shoppingList}</h4>
        <ul className="ingredients">
          {[...seznam.values()].map((x) => (
            <li key={`${x.co}|${x.jednotka}`}>
              {x.mnozstvi ? <strong>{cislo(x.mnozstvi)}{x.jednotka ? ` ${x.jednotka}` : ""} </strong> : null}
              {x.co}
            </li>
          ))}
        </ul>
      </section>
    </div>
  );
}
