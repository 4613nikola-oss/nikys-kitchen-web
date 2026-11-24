import Image from "next/image";
import Tecka from "./Tecka";
import BookFlip from "./BookFlip";
import { asset } from "@/lib/asset";

// Ukázka z knížky jako rozevřená kniha, která jde prolistovat (3 dvojstrany):
// 1) úvodní strana + den z plánu / ukázkový recept
// 2) celý recept: suroviny a postup
// 3) nákupní seznam + závěrečná strana s pozvánkou „Mám zájem“
const VYCHOZI = { "ebook-pro-starsi": "ovesna-kase-s-jablkem", "online-kucharka": "omeleta-se-zeleninou" };

// Malá kulatá fotka receptu jako v kuchařce (bez fotky Tečka v podobě receptu)
function Nahled({ r, velky = false }) {
  const size = velky ? 88 : 52;
  return (
    <span className={`book-thumb${velky ? " book-thumb-big" : ""}`} aria-hidden="true">
      {r.obrazek
        ? <Image src={asset(`/images/recepty/${r.obrazek}`)} alt="" width={size * 2} height={size * 2} sizes={`${size}px`} />
        : <Tecka podoba={r.tecka || "talir"} size={size} />}
    </span>
  );
}

export default function BookPreview({ product, recipes, lang, s, typeLabel }) {
  const t = product[lang];
  const u = product.ukazka || {};
  const find = (slug) => recipes.find((r) => r.slug === slug);
  const cislo = (n) => (Math.round(n * 10) / 10).toLocaleString(lang === "cs" ? "cs-CZ" : "en-GB");
  const b = s.book;
  const surovina = (x, i) => (
    <li key={i}>{x.mnozstvi ? <strong>{cislo(x.mnozstvi)} {x.jednotka || ""} </strong> : null}{x.co}</li>
  );

  // ---- dvojstrana 1 ----
  const uvod = (
    <>
      <p className="book-eyebrow">{typeLabel}</p>
      <p className="book-title">{t.nazev}</p>
      <Tecka podoba={product.tecka || "ahoj"} size={120} className="book-tecka" />
      <p className="book-h4">{b.inside}</p>
      <ul className="book-list">{t.obsah.slice(0, 3).map((x) => <li key={x}>{x}</li>)}</ul>
    </>
  );

  let prvniPrava, recept2, nakup;
  if (u.den) {
    const jidla = u.den.map((d) => ({ jidlo: d.jidlo, r: find(d.recept) })).filter((x) => x.r);
    const soucet = jidla.reduce((a, x) => a + (x.r.kcal || 0), 0);
    prvniPrava = (
      <>
        <p className="book-eyebrow">{b.day}</p>
        <h3 className="book-h">{b.monday}</h3>
        <ul className="book-meals">
          {jidla.map(({ jidlo, r }) => (
            <li key={jidlo}>
              <Nahled r={r} />
              <span className="book-meal-text">
                <span className="book-meal-label">{s.meals[jidlo]}</span>
                <strong>{r[lang].nazev}</strong>
              </span>
              <em>~{r.kcal} kcal</em>
            </li>
          ))}
        </ul>
        <p className="book-note">{b.dayNote.replace("{kcal}", soucet)}</p>
      </>
    );
    // v plánu: celý recept na oběd a nákup na celý den
    recept2 = (jidla.find((x) => x.jidlo === "obed") || jidla[0])?.r;
    nakup = [...new Map(jidla.flatMap(({ r }) => r[lang].suroviny).map((x) => [x.co, x])).values()];
  } else {
    const r = find(u.zaklad) || find(u.recepty?.[0]) || find(VYCHOZI[product.slug]) || recipes[0];
    const rt = r[lang];
    prvniPrava = (
      <>
        <p className="book-eyebrow">{u.zaklad ? b.base : b.recipe}</p>
        <div className="book-recipe-head">
          <Nahled r={r} velky />
          <h3 className="book-h">{rt.nazev}</h3>
        </div>
        <p className="book-meta">{r.cas} min · ~{r.kcal} kcal</p>
        <div className="book-cols">
          <div>
            <h4>{b.ingredients}</h4>
            <ul>{rt.suroviny.slice(0, 7).map(surovina)}</ul>
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
    // druhý recept: jiný, nejlépe s fotkou
    recept2 = find(u.recepty?.[1]) || recipes.find((x) => x.slug !== r.slug && x.obrazek && x.kategorie === r.kategorie) || recipes.find((x) => x.slug !== r.slug);
    nakup = recept2 ? recept2[lang].suroviny : [];
  }

  const spreads = [{ left: uvod, right: prvniPrava }];

  // ---- dvojstrana 2: celý recept ----
  if (recept2) {
    const rt = recept2[lang];
    spreads.push({
      left: (
        <>
          <p className="book-eyebrow">{b.recipe}</p>
          <div className="book-recipe-head">
            <Nahled r={recept2} velky />
            <h3 className="book-h">{rt.nazev}</h3>
          </div>
          <p className="book-meta">{recept2.cas} min · ~{recept2.kcal} kcal</p>
          <h4>{b.ingredients}</h4>
          <ul>{rt.suroviny.slice(0, 10).map(surovina)}</ul>
        </>
      ),
      right: (
        <>
          <h4 className="book-h4-first">{b.steps}</h4>
          <ol>{(rt.postup || []).slice(0, 6).map((k, i) => <li key={i}>{k.text}</li>)}</ol>
          {rt.tip && <p className="book-note">{rt.tip}</p>}
        </>
      ),
    });
  }

  // ---- dvojstrana 3: nákupní seznam + závěr ----
  spreads.push({
    left: (
      <>
        <p className="book-eyebrow">{b.shopping}</p>
        <h3 className="book-h">{u.den ? b.monday : recept2?.[lang].nazev}</h3>
        <ul className="book-shopping">
          {nakup.slice(0, 14).map((x, i) => <li key={i}><span className="book-box" aria-hidden="true" /> {x.co}</li>)}
        </ul>
        <p className="book-note">{b.shoppingNote}</p>
      </>
    ),
    right: (
      <div className="book-end">
        <Tecka podoba="slavi" size={130} />
        <h3 className="book-h">{b.endTitle}</h3>
        <p>{b.endText}</p>
        <a className="btn btn-primary" href="#zajem">{b.endCta} ↓</a>
      </div>
    ),
  });

  return <BookFlip spreads={spreads} labels={b} ariaLabel={`${b.title}: ${t.nazev}`} />;
}
