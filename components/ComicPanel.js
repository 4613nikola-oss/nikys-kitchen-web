import Tecka from "./Tecka";

// Komiksový panel: rastrové pozadí, bublina s hláškou, maskot (Tečka nebo Vařečka).
// tone: med | ruzova | zelena. Bublina je text pro čtečky i pro oči (maskot je jen ozdoba).
export default function ComicPanel({ text, podoba = "radost", tone = "med", label, size = 170, children, className = "" }) {
  return (
    <figure className={`comic-panel comic-${tone} ${className}`}>
      {label && <span className="comic-label">{label}</span>}
      <blockquote className="comic-bubble"><p>{text}</p></blockquote>
      <div className="comic-hero" aria-hidden="true">
        {children || <Tecka podoba={podoba} size={size} />}
      </div>
    </figure>
  );
}
