import Link from "next/link";
import ProductCover from "./ProductCover";
import ProductPrice from "./ProductPrice";

// Karta produktu v obchodě: obálka, typ, název, jedna věta a cena
export default function ProductCard({ product, lang, s }) {
  const t = product[lang];
  return (
    <article className="card product-card">
      <Link href={`/${lang}/obchod/${product.slug}/`} className="card-link">
        <div className="card-media">
          <ProductCover product={product} lang={lang} typeLabel={s.types[product.typ]} />
        </div>
        <div className="card-body">
          {product.stav === "pripravujeme" && <span className="chip chip-terra">{s.soon}</span>}
          <h3>{t.nazev}</h3>
          <p>{t.popis}</p>
          <ProductPrice product={product} lang={lang} labels={s} />
        </div>
      </Link>
    </article>
  );
}
