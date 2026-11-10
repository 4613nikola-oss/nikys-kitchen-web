import Link from "next/link";
import ProductCover from "./ProductCover";
import ProductPrice from "./ProductPrice";

// Popisek typu: u kurzů „Online kurz“ / „Kurz naživo“, jinak typ (Plán, E-book…)
export const typeLabel = (product, s) => (product.obrazek && s.forms[product.obrazek]) || s.types[product.typ];

// Karta produktu v obchodě: obálka, název, jedna věta a cena
export default function ProductCard({ product, lang, s }) {
  const t = product[lang];
  return (
    <article className="card product-card">
      <Link href={`/${lang}/obchod/${product.slug}/`} className="card-link">
        <div className="card-media">
          <ProductCover product={product} lang={lang} typeLabel={typeLabel(product, s)} />
        </div>
        <div className="card-body">
          <h3>{t.nazev}</h3>
          <p>{t.popis}</p>
          <ProductPrice product={product} lang={lang} labels={s} />
        </div>
      </Link>
    </article>
  );
}
