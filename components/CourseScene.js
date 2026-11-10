// Ilustrace ke kurzům místo obálky knížky (vlastní kresba v barvách značky)
// varianta "kurz-online": lektorka vaří na obrazovce notebooku, vpravo nahoře účastníci z domova
// varianta "kurz-nazivo": skupina lidí u stolu vaří a dívá se na lektorku, která ukazuje postup

const BARVY = {
  krem: "#f6eedf", stena: "#eef2ef", drevo: "#a8865a", drevoTmave: "#8a6c45",
  zelena: "#3d5233", salvej: "#5f7a6a", terra: "#a34d32", med: "#d9a441", bila: "#ffffff", text: "#2c2c2c",
};

// Lektorka zepředu: zástěra, drdol, úsměv
function Lektorka({ x, y, s = 1 }) {
  const kuze = "#e3b48c";
  return (
    <g transform={`translate(${x} ${y}) scale(${s})`}>
      <path d="M-34 70 Q-34 18 0 18 Q34 18 34 70 Z" fill={BARVY.terra} />
      <path d="M-17 26 L-17 70 L17 70 L17 26 Q0 34 -17 26 Z" fill={BARVY.bila} />
      <rect x="-9" y="46" width="18" height="10" rx="3" fill="#f1e6d6" />
      <rect x="-6" y="8" width="12" height="14" fill={kuze} />
      <circle cx="0" cy="-6" r="20" fill={kuze} />
      <circle cx="0" cy="-32" r="9" fill="#5a3a26" />
      <path d="M-21 -4 Q-22 -27 0 -27 Q22 -27 21 -4 Q16 -18 0 -19 Q-14 -18 -21 -4 Z" fill="#5a3a26" />
      <circle cx="-7" cy="-5" r="2.3" fill={BARVY.text} />
      <circle cx="7" cy="-5" r="2.3" fill={BARVY.text} />
      <path d="M-6 4 Q0 9 6 4" stroke={BARVY.text} strokeWidth="2" fill="none" strokeLinecap="round" />
      <circle cx="-12" cy="2" r="3.5" fill="#e98f7d" opacity="0.55" />
      <circle cx="12" cy="2" r="3.5" fill="#e98f7d" opacity="0.55" />
    </g>
  );
}

// Účastník zezadu (díváme se mu přes rameno na lektorku)
function Ucastnik({ x, y, vlasy, triko, uces = "kratke", kuze = "#d9a77f" }) {
  return (
    <g transform={`translate(${x} ${y})`}>
      <path d="M-32 80 Q-32 22 0 22 Q32 22 32 80 Z" fill={triko} />
      <path d="M-15 24 L12 70 M15 24 L-12 70" stroke="#f3ece0" strokeWidth="4" strokeLinecap="round" />
      <rect x="-6" y="10" width="12" height="14" fill={kuze} />
      <circle cx="-19" cy="-2" r="4.5" fill={kuze} />
      <circle cx="19" cy="-2" r="4.5" fill={kuze} />
      <circle cx="0" cy="-4" r="19" fill={vlasy} />
      {uces === "culik" && <path d="M-6 10 Q0 40 6 10 Z" fill={vlasy} />}
      {uces === "drdol" && <circle cx="0" cy="-25" r="8" fill={vlasy} />}
      {uces === "dlouhe" && <path d="M-19 -4 L-20 20 Q0 28 20 20 L19 -4 Z" fill={vlasy} />}
    </g>
  );
}

function Hrnec({ x, y, barva = BARVY.salvej, para = true }) {
  return (
    <g transform={`translate(${x} ${y})`}>
      {para && (
        <g stroke="#c9c2b6" strokeWidth="3" fill="none" strokeLinecap="round">
          <path d="M-8 -6 Q-13 -14 -8 -22 Q-3 -30 -8 -38" />
          <path d="M6 -6 Q1 -14 6 -22 Q11 -30 6 -38" />
        </g>
      )}
      <rect x="-24" y="-4" width="48" height="6" rx="3" fill={BARVY.text} opacity="0.75" />
      <path d="M-21 0 H21 V18 Q21 26 13 26 H-13 Q-21 26 -21 18 Z" fill={barva} />
      <rect x="-30" y="5" width="9" height="5" rx="2.5" fill={barva} />
      <rect x="21" y="5" width="9" height="5" rx="2.5" fill={barva} />
    </g>
  );
}

function Prkenko({ x, y }) {
  return (
    <g transform={`translate(${x} ${y})`}>
      <rect x="-26" y="-6" width="52" height="12" rx="5" fill="#d7b98d" />
      <circle cx="-12" cy="-8" r="6" fill={BARVY.terra} />
      <path d="M2 -9 L22 -12 L20 -6 Z" fill="#e0893a" />
      <path d="M20 -11 l5 -4 M21 -9 l6 -1" stroke={BARVY.zelena} strokeWidth="2" strokeLinecap="round" />
    </g>
  );
}

function Online({ label }) {
  return (
    <svg viewBox="0 0 400 300" role="img" aria-label={label}>
      <rect width="400" height="300" fill={BARVY.krem} />
      {/* notebook */}
      <rect x="62" y="34" width="276" height="182" rx="14" fill={BARVY.text} />
      <rect x="74" y="46" width="252" height="158" rx="4" fill={BARVY.stena} />
      <path d="M40 216 H360 L346 236 H54 Z" fill="#cfc6b6" />
      <rect x="170" y="216" width="60" height="6" rx="3" fill="#b8ae9c" />
      {/* kuchyně na obrazovce */}
      <rect x="92" y="78" width="70" height="5" rx="2" fill={BARVY.drevoTmave} />
      <rect x="98" y="62" width="12" height="16" rx="3" fill={BARVY.med} />
      <rect x="116" y="66" width="12" height="12" rx="3" fill={BARVY.salvej} />
      <rect x="134" y="60" width="12" height="18" rx="3" fill={BARVY.terra} opacity="0.85" />
      <g clipPath="url(#obrazovka)">
        <Lektorka x={200} y={118} s={0.95} />
      </g>
      <clipPath id="obrazovka"><rect x="74" y="46" width="252" height="158" /></clipPath>
      <rect x="74" y="168" width="252" height="36" fill={BARVY.drevo} />
      <rect x="74" y="168" width="252" height="5" fill={BARVY.drevoTmave} />
      <path d="M226 150 L262 176" stroke="#e3b48c" strokeWidth="8" strokeLinecap="round" />
      <path d="M258 174 L274 146" stroke={BARVY.drevoTmave} strokeWidth="4" strokeLinecap="round" />
      <path d="M174 150 L150 166" stroke="#e3b48c" strokeWidth="8" strokeLinecap="round" />
      <Hrnec x={140} y={150} />
      <Prkenko x={282} y={182} />
      {/* ŽIVĚ */}
      <rect x="84" y="54" width="20" height="14" rx="7" fill="#c0392b" />
      <circle cx="94" cy="61" r="3" fill={BARVY.bila} />
      {/* účastníci z domova */}
      {[["#5a3a26", "#f2c9a5"], ["#2c2c2c", "#8d5b3e"], ["#c58b4c", "#f0c7a2"]].map(([v, k], i) => (
        <g key={i} transform={`translate(${246 + i * 26} 54)`}>
          <rect width="22" height="20" rx="3" fill={BARVY.bila} stroke="#d9d2c5" />
          <circle cx="11" cy="10" r="5" fill={k} />
          <path d="M6 9 Q11 2 16 9" fill={v} />
          <path d="M4 20 Q11 13 18 20 Z" fill={i === 1 ? BARVY.salvej : BARVY.med} />
        </g>
      ))}
      {/* srdíčka a bublina */}
      <g transform="translate(352 70)">
        <rect x="-18" y="-14" width="40" height="26" rx="10" fill={BARVY.bila} stroke="#e3ded5" />
        <path d="M2 4 C-8 -4 -4 -12 2 -6 C8 -12 12 -4 2 4 Z" fill={BARVY.terra} />
      </g>
      <path d="M362 112 C354 106 357 100 362 104 C367 100 370 106 362 112 Z" fill={BARVY.terra} opacity="0.7" />
    </svg>
  );
}

function Nazivo({ label }) {
  return (
    <svg viewBox="0 0 400 300" role="img" aria-label={label}>
      <rect width="400" height="300" fill={BARVY.krem} />
      <rect y="0" width="400" height="150" fill={BARVY.stena} />
      {/* police s nádobím */}
      <rect x="40" y="52" width="110" height="5" rx="2" fill={BARVY.drevoTmave} />
      <rect x="48" y="34" width="14" height="18" rx="3" fill={BARVY.med} />
      <rect x="68" y="38" width="14" height="14" rx="3" fill={BARVY.salvej} />
      <rect x="88" y="30" width="14" height="22" rx="3" fill={BARVY.terra} opacity="0.85" />
      <g stroke={BARVY.drevoTmave} strokeWidth="3" strokeLinecap="round" fill="none">
        <path d="M290 30 V62" /><path d="M310 30 V58" /><path d="M330 30 V64" />
      </g>
      <circle cx="310" cy="64" r="7" fill="none" stroke={BARVY.drevoTmave} strokeWidth="3" />
      <rect x="280" y="26" width="60" height="5" rx="2" fill={BARVY.drevoTmave} />
      {/* lektorka za svou linkou */}
      <Lektorka x={200} y={88} s={0.9} />
      <path d="M226 106 L252 84" stroke="#e3b48c" strokeWidth="8" strokeLinecap="round" />
      <path d="M250 86 L262 66" stroke={BARVY.text} strokeWidth="4" strokeLinecap="round" />
      <rect x="110" y="140" width="180" height="16" rx="4" fill={BARVY.drevoTmave} />
      <Hrnec x={160} y={116} barva={BARVY.zelena} />
      <Prkenko x={236} y={136} />
      {/* stůl účastníků */}
      <rect x="0" y="196" width="400" height="22" fill={BARVY.drevo} />
      <rect x="0" y="196" width="400" height="5" fill={BARVY.drevoTmave} />
      <Prkenko x={112} y={194} />
      <Prkenko x={292} y={194} />
      <circle cx="200" cy="190" r="7" fill={BARVY.terra} />
      <circle cx="212" cy="192" r="6" fill="#7fa65a" />
      {/* účastníci zezadu */}
      <Ucastnik x={62} y={220} vlasy="#5a3a26" triko={BARVY.salvej} uces="culik" kuze="#f0c7a2" />
      <Ucastnik x={154} y={226} vlasy="#2c2c2c" triko={BARVY.med} kuze="#8d5b3e" />
      <Ucastnik x={248} y={222} vlasy="#b9874d" triko={BARVY.zelena} uces="dlouhe" kuze="#f2c9a5" />
      <Ucastnik x={340} y={226} vlasy="#7a7a7a" triko={BARVY.terra} uces="drdol" kuze="#d9a77f" />
    </svg>
  );
}

export default function CourseScene({ varianta, label }) {
  return varianta === "kurz-nazivo" ? <Nazivo label={label} /> : <Online label={label} />;
}
