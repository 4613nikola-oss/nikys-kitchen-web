// Vlastní ikonky Niky's Kitchen (fáze B): tenká linka jako logo + malý šalvějový lístek Tečky.
// Použití: <Icon name="cas" /> – dekorativní (aria-hidden), text vedle ikonky nese význam.
const L = '<path d="M17.5 3.2c1.6-1.4 3.6-1.4 4.6-.6-.8 1.8-2.8 2.6-4.6.6z" fill="#5e7769" stroke="#3d5233" stroke-width=".7"/>';
const g = (d, listek = true) => `<g fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round">${d}</g>${listek ? L : ""}`;

export const ICONS = {
  cas: g('<circle cx="11" cy="13" r="8"/><path d="M11 8.5V13l3 2"/>'),
  kcal: g('<path d="M11 3c1 3.2 5 5 5 10a5 5 0 0 1-10 0c0-2.4 1.2-3.8 2.4-4.8.2 1.8 1 2.8 2.4 3 .4-3.4-1.2-5.4.2-8.2z"/>'),
  porce: g('<circle cx="13" cy="13.5" r="7.5"/><circle cx="13" cy="13.5" r="4"/><path d="M3 5v5a1.5 1.5 0 0 0 3 0V5M4.5 10v11"/>'),
  slane: g('<path d="M6 3v6a2 2 0 0 0 4 0V3M8 9v12"/><path d="M15 21V3c2.5 1.2 3.5 4 3.5 7.5H15"/>'),
  sladke: g('<path d="M3 19h17V12L3 15.5z"/><path d="M3 15.5 17 9.5"/><path d="M3 17.2h17"/>') + '<circle cx="16" cy="7.4" r="1.8" fill="#a24e33"/>',
  napoje: g('<path d="M5 7h12l-1.6 13.5H6.6z"/><path d="M13 7l2.5-5"/><path d="M6 12h10"/>'),
  alergen: '<path d="M11 3 21 20H1z" fill="#f59e0b" stroke="#2c2c2c" stroke-width="1.5" stroke-linejoin="round"/><path d="M11 9v5" stroke="#2c2c2c" stroke-width="1.9" stroke-linecap="round"/><circle cx="11" cy="16.8" r="1.1" fill="#2c2c2c"/>',
  lednicka: g('<rect x="5" y="3" width="12" height="18.5" rx="2"/><path d="M5 9.5h12M8 6v1.5M8 12.5v3"/>'),
  nakup: g('<path d="M4 8.5h14l-1.3 12H5.3z"/><path d="M8 8.5V7a3 3 0 0 1 6 0v1.5"/>'),
  profil: g('<circle cx="11" cy="9" r="4"/><path d="M3.5 21c1.4-4 4.2-6 7.5-6s6.1 2 7.5 6"/>'),
  den: g('<rect x="3" y="5" width="16" height="16" rx="2"/><path d="M3 10h16M7.5 3v4M14.5 3v4"/>') + '<circle cx="11" cy="15.5" r="1.6" fill="#a24e33"/>',
  recepty: g('<path d="M4 5.5A2.5 2.5 0 0 1 6.5 3H17v15H6.5A2.5 2.5 0 0 0 4 20.5z"/><path d="M4 20.5A2.5 2.5 0 0 0 6.5 23H17v-5"/><path d="M8 7.5h5M8 11h5"/>'),
  oblibene: g('<path d="M11 20s-7.5-4.6-7.5-10A4.2 4.2 0 0 1 11 7.6 4.2 4.2 0 0 1 18.5 10c0 5.4-7.5 10-7.5 10z"/>'),
  vari: g('<path d="M3.5 11h15v5.5a4 4 0 0 1-4 4h-7a4 4 0 0 1-4-4z"/><path d="M1.5 11h2M18.5 11h2M8 7.5c-.6-1 .6-2 0-3M12 7.5c-.6-1 .6-2 0-3"/>'),
  snidane: g('<path d="M3 10h13v5a5 5 0 0 1-5 5H8a5 5 0 0 1-5-5z"/><path d="M16 11.5h1.5a2.5 2.5 0 0 1 0 5H15.6"/><path d="M7 7c-.5-1 .5-2 0-3M11 7c-.5-1 .5-2 0-3"/>'),
  vecere: g('<circle cx="11" cy="15" r="6.5"/><circle cx="11" cy="15" r="3"/>', false) + '<path d="M17.5 3.5a3.5 3.5 0 1 0 3 5.5 4 4 0 0 1-3-5.5z" fill="#bfa97f" stroke="#3d5233" stroke-width="1.7"/>',
  svacina: g('<path d="M11 8c-3-2-8-1-8 5s3 9 5 9c1.3 0 2-.6 3-.6s1.7.6 3 .6c2 0 5-3 5-9s-5-7-8-5z"/><path d="M11 8c0-2 .6-3.5 2-4.5"/>'),
  hledat: g('<circle cx="10" cy="11" r="6.5"/><path d="M15 16l5.5 5.5"/>'),
  filtr: g('<path d="M3 6h16M6 12h10M9 18h4"/>'),
  tyden: g('<rect x="3" y="5" width="16" height="16" rx="2"/><path d="M3 10h16M7.5 3v4M14.5 3v4"/>') + '<g fill="#5e7769"><circle cx="6.5" cy="13.5" r="1"/><circle cx="9.5" cy="13.5" r="1"/><circle cx="12.5" cy="13.5" r="1"/><circle cx="15.5" cy="13.5" r="1"/><circle cx="6.5" cy="17" r="1"/><circle cx="9.5" cy="17" r="1"/></g><circle cx="12.5" cy="17" r="1" fill="#a24e33"/>',
  stahnout: g('<path d="M5 3h8l4 4v14H5z"/><path d="M13 3v4h4"/><path d="M11 10v7M8 14l3 3 3-3"/>', false),
  vege: g('<path d="M5 19C5 10 10 5 19 4c0 9-5 15-14 15z"/><path d="M5 19 14 10"/>', false),
  bezlepku: g('<path d="M11 21V8"/><path d="M11 9c-2-1-3-3-3-5 2 0 3 1.5 3 3M11 9c2-1 3-3 3-5-2 0-3 1.5-3 3M11 14c-2-1-3-3-3-5 2 0 3 1.5 3 3M11 14c2-1 3-3 3-5-2 0-3 1.5-3 3"/>', false) + '<path d="M3 21 20 4" stroke="#a24e33" stroke-width="2" stroke-linecap="round"/>',
  trouba: g('<rect x="3" y="3" width="17" height="18" rx="2"/><path d="M3 8h17"/><rect x="6" y="11" width="11" height="7" rx="1"/>'),
  babicka: g('<path d="M5 15 15 5a2.5 2.5 0 0 1 3.5 3.5l-10 10A2.5 2.5 0 0 1 5 15z"/><path d="M3.5 20.5l2-2M18.5 5.5l2-2"/>', false),
  newsletter: g('<rect x="2.5" y="6" width="17" height="13" rx="2"/><path d="M2.5 8l8.5 6 8.5-6"/>'),
  kosik: g('<path d="M5 10c0-7 12-7 12 0"/><path d="M2.5 10h17l-2 10h-13z"/><path d="M8 13v4M11 13v4M14 13v4"/>', false),
  zvonek: g('<path d="M5 17V11a6 6 0 0 1 12 0v6l1.5 2h-15z"/><path d="M9 21a2 2 0 0 0 4 0"/>'),
  nastaveni: g('<circle cx="11" cy="12" r="3"/><path d="M11 3v2.5M11 18.5V21M3 12h2.5M16.5 12H19M5.3 6.3l1.8 1.8M14.9 15.9l1.8 1.8M5.3 17.7l1.8-1.8M14.9 8.1l1.8-1.8"/>', false),
};

export default function Icon({ name, size = 20, className = "" }) {
  const svg = ICONS[name];
  if (!svg) return null;
  return (
    <svg
      className={`icon ${className}`}
      width={size}
      height={size}
      viewBox="0 0 24 24"
      aria-hidden="true"
      focusable="false"
      dangerouslySetInnerHTML={{ __html: svg }}
    />
  );
}
