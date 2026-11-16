import Tecka from "./Tecka";

// Ukázka z knížky jako rozevřená kniha: vlevo úvodní strana kapitoly, vpravo skutečná ukázková stránka.
// Obsah pravé strany podle produktu: plán = jeden den, e-book se základem = základ a 3 varianty, jinak recept.
const VYCHOZI = { "ebook-pro-starsi": "ovesna-kase-s-jablkem", "online-kucharka": "omeleta-se-zeleninou" };

export default function BookPreview({ product, recipes, lang, s, typeLabel }) {
  const t = product[lang];
  const u = product.ukazka || {};
  const find = (slug) => recipes.find((r) => r.slug === slug);
  const cislo = (n) => (Math.round(n * 10) / 10).toLocaleString(lang === "cs" ? "cs-CZ" : "en-GB");
  const b = s.book;

  let prava;
  if (u.den) {
    const jidla = u.den.map((d) => ({ jidlo: d.jidlo, r: find(d.recept) })).filter((x) => x.r);
    const soucet = jidla.reduce((a, x) => a + (x.r.kcal || 0), 0);
    prava = (
      <>
        <p className="book-eyebrow">{b.day}</p>
        <h3 className="book-h">{b.monday}</h3>
        <ul className="book-meals">
          {jidla.map(({ jidlo, r }) => (
            <li key={jidlo}><span>{s.meals[jidlo]}</span><strong>{r[lang].nazev}</strong><em>~{r.kcal} kcal</em></li>
          ))}
        </ul>
        <p className="book-note">{b.dayNote.replace("{kcal}", soucet)}</p>
      </>
    );
  } else {
    const r = find(u.zaklad) || find(u.recepty?.[0]) || find(VYCHOZI[product.slug]) || recipes[0];
    const rt = r[lang];
    prava = (
      <>
        <p className="book-eyebrow">{u.zaklad ? b.base : b.recipe}</p>
        <h3 className="book-h">{rt.nazev}</h3>
        <p className="book-meta">{r.cas} min · ~{r.kcal} kcal</p>
        <div className="book-cols">
          <div>
            <h4>{b.ingredients}</h4>
            <ul>
              {rt.suroviny.slice(0, 7).map((x, i) => (
                <li key={i}>{x.mnozstvi ? <strong>{cislo(x.mnozstvi)} {x.jednotka || ""} </strong> : null}{x.co}</li>
              ))}
            </ul>
          </div>
          <div>
            {u.zaklad && rt.varianty ? (
              <>
                <h4>{b.variants}</h4>
                <ol>{rt.varianty.slice(0, 3).map((v) => <li key={v.nazev}><strong>{v.nazev}:</strong> {v.text}</li>)}</ol>
              </>
            ) : (
              <>
                <h4>{b.steps}</h4>
                <ol>{(rt.postup || []).slice(0, 3).map((k, i) => <li key={i}>{k.text}</li>)}</ol>
              </>
            )}
          </div>
        </div>
        {rt.tip && <p className="book-note">{rt.tip}</p>}
      </>
    );
  }

  return (
    <figure className="book" aria-label={`${b.title}: ${t.nazev}`}>
      <div className="book-page book-left">
        <p className="book-eyebrow">{typeLabel}</p>
        <p className="book-title">{t.nazev}</p>
        <Tecka podoba={product.tecka || "ahoj"} size={120} className="book-tecka" />
        <p className="book-h4">{b.inside}</p>
        <ul className="book-list">{t.obsah.slice(0, 3).map((x) => <li key={x}>{x}</li>)}</ul>
        <span className="book-num">1</span>
      </div>
      <div className="book-page book-right">
        {prava}
        <span className="book-num">2</span>
      </div>
    </figure>
  );
}
