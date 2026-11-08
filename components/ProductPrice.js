// Cena produktu: zdarma, za měsíc, nebo zaváděcí cena s přeškrtnutou původní
export default function ProductPrice({ product, lang, labels }) {
  const kc = (n) => `${n.toLocaleString(lang === "cs" ? "cs-CZ" : "en-GB")} ${labels.currency}`;
  if (product.cena === 0) {
    return (
      <p className="price">
        <strong>{labels.free}</strong> <span className="muted">{labels.freeNote}</span>
      </p>
    );
  }
  return (
    <p className="price">
      {product.cenaPuvodni && <s className="muted">{kc(product.cenaPuvodni)}</s>}{" "}
      <strong>{kc(product.cena)}</strong>
      {product.zaMesic && <span className="muted"> {labels.perMonth}</span>}
      {product.cenaPuvodni && <span className="chip chip-honey price-note">{labels.launchPrice}</span>}
    </p>
  );
}
