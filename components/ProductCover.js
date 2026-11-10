import Tecka from "./Tecka";
import CourseScene from "./CourseScene";

// Obálka produktu: „knížka“ v barvách značky s Tečkou (bez fotek z internetu).
// Kurzy mají místo knížky ilustraci (online lektorka / vaření ve skupině).
export default function ProductCover({ product, lang, typeLabel, large = false }) {
  if (product.obrazek) {
    return (
      <div className={`cover cover-scene${large ? " cover-large" : ""}`}>
        <CourseScene varianta={product.obrazek} label={`${typeLabel}: ${product[lang].nazev}`} />
        <span className="cover-badge">{typeLabel}</span>
      </div>
    );
  }
  return (
    <div className={`cover cover-${product.barva || "sage"} cover-${product.typ}${large ? " cover-large" : ""}`} aria-hidden="true">
      <div className="cover-book">
        <span className="cover-type">{typeLabel}</span>
        <span className="cover-title">{product[lang].nazev}</span>
        <Tecka podoba={product.tecka} size={large ? 150 : 96} className="cover-tecka" />
        <span className="cover-brand">Niky&apos;s Kitchen</span>
      </div>
    </div>
  );
}
