"use client";

import { useRef, useState } from "react";

// Listování knížkou: dvojstrany se přepínají šipkami ◀ ▶, klávesami ← → nebo přetažením prstem.
// Obsah stránek připraví server (BookPreview), tady se jen přepíná, která dvojstrana je vidět.
export default function BookFlip({ spreads, labels, ariaLabel }) {
  const [i, setI] = useState(0);
  const [smer, setSmer] = useState("");
  const startX = useRef(null);
  const posledni = spreads.length - 1;

  const jdi = (kam) => {
    const n = Math.max(0, Math.min(posledni, kam));
    if (n === i) return;
    setSmer(n > i ? "flip-next" : "flip-prev");
    setI(n);
  };

  return (
    <div className="book-flip">
      <figure
        key={i}
        className={`book ${smer}`}
        aria-label={ariaLabel}
        aria-roledescription="kniha"
        tabIndex={0}
        onKeyDown={(e) => {
          if (e.key === "ArrowRight") jdi(i + 1);
          if (e.key === "ArrowLeft") jdi(i - 1);
        }}
        onTouchStart={(e) => { startX.current = e.touches[0].clientX; }}
        onTouchEnd={(e) => {
          if (startX.current === null) return;
          const dx = e.changedTouches[0].clientX - startX.current;
          if (Math.abs(dx) > 50) jdi(dx < 0 ? i + 1 : i - 1);
          startX.current = null;
        }}
      >
        <div className="book-page book-left">
          {spreads[i].left}
          <span className="book-num">{i * 2 + 1}</span>
        </div>
        <div className="book-page book-right">
          {spreads[i].right}
          <span className="book-num">{i * 2 + 2}</span>
        </div>
      </figure>

      <div className="book-controls">
        <button type="button" className="btn btn-ghost book-arrow" onClick={() => jdi(i - 1)} disabled={i === 0} aria-label={labels.prev}>◀</button>
        <span className="book-count" aria-live="polite">{labels.pageOf.replace("{n}", i + 1).replace("{z}", spreads.length)}</span>
        <button type="button" className="btn btn-primary book-arrow" onClick={() => jdi(i + 1)} disabled={i === posledni} aria-label={labels.next}>▶</button>
      </div>
    </div>
  );
}
