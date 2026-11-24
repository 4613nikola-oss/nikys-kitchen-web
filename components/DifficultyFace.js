// Náročnost receptu jako obličej ve stylu Tečky: s náročností mění výraz i barvu.
// 1 = snadné (usměvavý, šalvějově zelený), 2 = zvládneš (soustředěný, medový),
// 3 = na víkend (udýchaný s kapkou potu, terakotový). Význam nese text vedle – obličej je ozdoba.
const BARVY = { 1: "#cfe0c3", 2: "#f3d98f", 3: "#f2c2b0" };

export default function DifficultyFace({ level = 1, size = 30 }) {
  const n = Math.min(3, Math.max(1, level));
  return (
    <svg className={`difficulty-face difficulty-${n}`} width={size} height={size} viewBox="0 0 32 32" aria-hidden="true">
      <circle cx="16" cy="17" r="12.5" fill={BARVY[n]} stroke="#1f1d1a" strokeWidth="1.8" />
      {/* lísteček jako u Tečky */}
      <path d="M16.5 4.6c1.6-2.2 4.4-2.4 5.6-1.5-1.1 2.3-3.9 2.9-5.6 1.5z" fill="#5e7769" stroke="#1f1d1a" strokeWidth="0.9" />
      {n === 1 && (
        <g fill="none" stroke="#1f1d1a" strokeWidth="1.8" strokeLinecap="round">
          <path d="M10.5 15.5c1-1.5 2.6-1.5 3.6 0M17.9 15.5c1-1.5 2.6-1.5 3.6 0" />
          <path d="M11.5 19.5c2.4 3.2 6.6 3.2 9 0" />
        </g>
      )}
      {n === 2 && (
        <g stroke="#1f1d1a" strokeWidth="1.8" strokeLinecap="round">
          <circle cx="12.3" cy="15.8" r="1.4" fill="#1f1d1a" stroke="none" />
          <circle cx="19.7" cy="15.8" r="1.4" fill="#1f1d1a" stroke="none" />
          <path d="M10.5 12.6l3.2.8M21.5 12.6l-3.2.8" fill="none" />
          <path d="M12.5 21h7" fill="none" />
        </g>
      )}
      {n === 3 && (
        <g stroke="#1f1d1a" strokeWidth="1.8" strokeLinecap="round">
          <path d="M10.6 14.2l3 1.6-3 1.6M21.4 14.2l-3 1.6 3 1.6" fill="none" />
          <ellipse cx="16" cy="21.4" rx="2.6" ry="2.2" fill="#a24e33" />
          {/* kapka potu */}
          <path d="M25.4 9.5c1.2 1.6 1.8 2.7 1.8 3.5a1.8 1.8 0 0 1-3.6 0c0-.8.6-1.9 1.8-3.5z" fill="#8fc4dc" strokeWidth="1" />
        </g>
      )}
    </svg>
  );
}
