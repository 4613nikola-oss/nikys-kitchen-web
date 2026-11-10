// Startovací knížka (dárek za newsletter): 7 rychlých receptů z databáze → HTML (pak puppeteer → PDF)
// Spuštění: Get-Content scripts/startovaci-knizka.mjs | docker compose exec -T web node --input-type=module -
// HTML vznikne v .knizka/, PDF z něj udělá puppeteer (A5, s pozadím) → public/darky/startovaci-knizka-{cs,en}.pdf
import postgres from "/app/node_modules/postgres/src/index.js";
import { readFileSync, writeFileSync, mkdirSync } from "node:fs";

const sql = postgres(process.env.DATABASE_URL);
const RECEPTY = [
  "ovesna-kase-s-jablkem", "jogurtovy-ovocny-pohar", "zelene-smoothie", "tvarohova-pomazanka",
  "omeleta-se-zeleninou", "tvarohovy-dezert-s-jahodami", "datlove-kulicky",
];
const OUT = "/app/.knizka";
mkdirSync(OUT, { recursive: true });

const svg = (nazev) => "data:image/svg+xml;base64," + readFileSync(`/app/assets/maskot/${nazev}.svg`).toString("base64");
const logo = "data:image/svg+xml;base64," + readFileSync("/app/public/logo/logo-ikona-NK.svg").toString("base64");
const esc = (s) => String(s ?? "").replace(/&/g, "&amp;").replace(/</g, "&lt;");

const T = {
  cs: {
    titul: "Startovací knížka", podtitul: "7 rychlých receptů a nákupní seznam",
    ahojH: "Ahoj!", ahoj: [
      "Tahle knížka je pro dny, kdy nemáš čas ani nápad, co uvařit. Sedm receptů, každý hotový do 15 minut, z věcí, které koupíš v každém obchodě.",
      "Nemusíš nic vážit ani počítat. Stačí si vybrat recept, podívat se na nákupní seznam na konci a jít na to.",
    ],
    obsah: "Co tu najdeš", talir: "Jak poskládat talíř, aby zasytil", nakup: "Nákupní seznam", tipy: "Tipy od Tečky",
    talirText: "Pomůcka pro hlavní jídla: nemusíš nic počítat, stačí se podívat na talíř.",
    talirCasti: [
      ["½", "Zelenina a ovoce", "čím barevnější, tím líp. Syrová, pečená, v polévce."],
      ["¼", "Bílkoviny", "vejce, tvaroh, jogurt, luštěniny, maso, ryba nebo tofu. Zasytí na delší dobu."],
      ["¼", "Příloha", "ovesné vločky, celozrnný chléb, brambory, rýže nebo quinoa. Dodá energii."],
      ["+", "Trocha tuku", "pár ořechů, lžíce olivového oleje nebo kousek sýra."],
    ],
    talirPozn: "Orientační pomůcka pro zdravé dospělé. Nejde o lékařskou radu.",
    cas: "Čas", porce: "Porce", kcal: "kcal na porci", min: "min", suroviny: "Suroviny", postup: "Postup",
    alergeny: "Alergeny", bezAlergenu: "bez hlavních alergenů", tip: "Tip od Tečky", poznamky: "Moje poznámky",
    nakupText: "Na všech 7 receptů v množství z knížky. Co už máš doma, škrtni.",
    skupiny: { zelenina: "Ovoce a zelenina", mlecne: "Mléčné výrobky a vejce", obiloviny: "Pečivo, vločky a ořechy", ostatni: "Ostatní" },
    tipySeznam: [
      "Připrav si něco dopředu. Večer nasyp vločky do misky a nakrájej zeleninu, ráno to máš za pět minut.",
      "Nech ovoce na očích. Co vidíš, to sníš, tak ať je to jablko, ne sušenky.",
      "Nepočítej každé sousto. Stačí, když talíř vypadá zhruba jako na obrázku v knížce.",
      "Sladká tečka k jídlu patří. Datlové kuličky nebo tvaroh s jahodami jsou dobrý začátek.",
      "Jeden horší den nic nezkazí. Další jídlo je nová šance, bez výčitek.",
    ],
    konecH: "Co dál?", konec: [
      "Další recepty a krátké články najdeš na webu Niky's Kitchen.",
      "V appce Jídlo od A–Z si spočítáš, kolik toho sníst, a necháš si navrhnout jídla na celý den.",
    ],
    pozn: "Recepty a tipy jsou pro zdravé dospělé a nejsou lékařskou radou. Pokud se léčíš, poraď se s lékařem nebo nutričním terapeutem. Kcal jsou orientační.",
  },
  en: {
    titul: "Starter booklet", podtitul: "7 quick recipes and a shopping list",
    ahojH: "Hi there!", ahoj: [
      "This booklet is for days when you have no time and no idea what to cook. Seven recipes, each ready in 15 minutes, made from things you can buy in any shop.",
      "No weighing, no counting. Pick a recipe, check the shopping list at the end and go.",
    ],
    obsah: "What's inside", talir: "How to build a plate that keeps you full", nakup: "Shopping list", tipy: "Tips from Tečka",
    talirText: "A guide for main meals: no counting, just look at your plate.",
    talirCasti: [
      ["½", "Vegetables and fruit", "the more colourful the better. Raw, roasted or in a soup."],
      ["¼", "Protein", "eggs, quark, yoghurt, pulses, meat, fish or tofu. Keeps you full for longer."],
      ["¼", "Carbs", "oats, wholegrain bread, potatoes, rice or quinoa. Gives you energy."],
      ["+", "A little fat", "a few nuts, a spoon of olive oil or a piece of cheese."],
    ],
    talirPozn: "A rough guide for healthy adults. Not medical advice.",
    cas: "Time", porce: "Servings", kcal: "kcal per serving", min: "min", suroviny: "Ingredients", postup: "Method",
    alergeny: "Allergens", bezAlergenu: "none of the main allergens", tip: "Tip from Tečka", poznamky: "My notes",
    nakupText: "For all 7 recipes in the amounts given. Cross off what you already have.",
    skupiny: { zelenina: "Fruit and vegetables", mlecne: "Dairy and eggs", obiloviny: "Bread, oats and nuts", ostatni: "Other" },
    tipySeznam: [
      "Prep ahead. Put the oats in a bowl and chop the veg in the evening, and breakfast takes five minutes.",
      "Keep fruit in sight. You eat what you see, so make it an apple, not biscuits.",
      "Don't count every bite. It's enough if your plate looks roughly like the one in this booklet.",
      "A sweet treat belongs in the plan. Date balls or quark with strawberries are a good start.",
      "One bad day changes nothing. The next meal is a fresh start, no guilt.",
    ],
    konecH: "What next?", konec: [
      "Find more recipes and short articles on the Niky's Kitchen website.",
      "In the Jídlo od A–Z app you can work out how much to eat and get meal ideas for the whole day.",
    ],
    pozn: "These recipes and tips are for healthy adults and are not medical advice. If you're being treated for something, talk to your doctor or a dietitian. Calories are approximate.",
  },
};

// zařazení suroviny do oddělení obchodu podle slova
const SKUPINY = [
  ["mlecne", /tvaroh|jogurt|mlék|mlek|milk|yog|quark|vej|egg|sýr|syr|chees|fet|mozz/i],
  ["obiloviny", /vlo|oat|chléb|chleb|bread|ořech|orech|mand|nut|almond|kokos|cocon|kakao|cocoa/i],
  ["zelenina", /jabl|appl|banán|banan|jahod|straw|borův|blueb|kiwi|datl|date|špenát|spenat|spinach|papri|pepper|rajč|rajc|tomat|cibul|onion|ředkv|redkv|radish|pažit|pazit|chive|mát|mat|mint|citron|lemon/i],
];
const skupina = (co) => (SKUPINY.find(([, re]) => re.test(co)) || ["ostatni"])[0];

function cislo(n, lang) {
  const r = n >= 10 ? Math.round(n) : Math.round(n * 10) / 10;
  return r.toLocaleString(lang === "cs" ? "cs-CZ" : "en-GB");
}

const BASE = "https://4613nikola-oss.github.io";

for (const lang of ["cs", "en"]) {
  const t = T[lang];
  const recepty = [];
  for (const slug of RECEPTY) {
    const [r] = await sql`SELECT r.*, x.nazev, x.uvod, x.postup, x.tip FROM recepty r JOIN recepty_texty x ON x.recept = r.slug AND x.jazyk = ${lang} WHERE r.slug = ${slug}`;
    const sur = await sql`SELECT mnozstvi, jednotka, co FROM suroviny WHERE recept = ${slug} AND jazyk = ${lang} ORDER BY poradi`;
    const al = await sql`SELECT a.${sql(lang)} AS nazev FROM recepty_alergeny ra JOIN alergeny a ON a.kod = ra.alergen WHERE ra.recept = ${slug} ORDER BY 1`;
    recepty.push({ ...r, suroviny: sur, alergeny: al.map((a) => a.nazev) });
  }

  // nákupní seznam: sečíst stejné suroviny se stejnou jednotkou
  const nakup = new Map();
  for (const r of recepty) for (const s of r.suroviny) {
    const k = `${s.co}|${s.jednotka || ""}`;
    const v = nakup.get(k) || { co: s.co, jednotka: s.jednotka, mnozstvi: 0, bez: false };
    if (s.mnozstvi == null) v.bez = true; else v.mnozstvi += Number(s.mnozstvi);
    nakup.set(k, v);
  }
  const podleSkupin = {};
  for (const v of nakup.values()) (podleSkupin[skupina(v.co)] ||= []).push(v);

  const tecky = ["vari", "radost", "slavi", "talir", "pohar", "zakusek", "ahoj"];
  const stranky = [];

  // obálka
  stranky.push(`<section class="page cover">
    <img class="logo" src="${logo}" alt="">
    <p class="brand">Niky's Kitchen</p>
    <h1>${t.titul}</h1>
    <p class="sub">${t.podtitul}</p>
    <img class="tecka-big" src="${svg("radost")}" alt="">
  </section>`);

  // úvod a obsah
  stranky.push(`<section class="page">
    <div class="intro"><img src="${svg("ahoj")}" alt=""><div><h2>${t.ahojH}</h2>${t.ahoj.map((p) => `<p>${esc(p)}</p>`).join("")}</div></div>
    <h3>${t.obsah}</h3>
    <ol class="toc">${recepty.map((r) => `<li><span>${esc(r.nazev)}</span><span class="muted">${r.cas_min} ${t.min} · ~${r.kcal} kcal</span></li>`).join("")}
      <li><span>${t.talir}</span></li><li><span>${t.nakup}</span></li><li><span>${t.tipy}</span></li></ol>
  </section>`);

  // talíř
  stranky.push(`<section class="page">
    <h2>${t.talir}</h2>
    <p>${t.talirText}</p>
    <svg class="plate" viewBox="0 0 220 220" aria-hidden="true">
      <circle cx="110" cy="110" r="104" fill="#fff" stroke="#e3ded5" stroke-width="4"/>
      <path d="M110 110 L110 14 A96 96 0 0 0 110 206 Z" fill="#9db58a"/>
      <path d="M110 110 L110 14 A96 96 0 0 1 206 110 Z" fill="#e8b48a"/>
      <path d="M110 110 L206 110 A96 96 0 0 1 110 206 Z" fill="#e6cf8f"/>
      <text x="62" y="116" text-anchor="middle">½</text><text x="148" y="78" text-anchor="middle">¼</text><text x="148" y="152" text-anchor="middle">¼</text>
    </svg>
    <ul class="plate-legend">${t.talirCasti.map(([d, h, p], i) => `<li><span class="dot d${i}">${d}</span><div><strong>${h}</strong> – ${p}</div></li>`).join("")}</ul>
    <p class="note">${t.talirPozn}</p>
  </section>`);

  // recepty
  recepty.forEach((r, i) => {
    stranky.push(`<section class="page recipe">
      <div class="r-head"><div><p class="eyebrow">${i + 1} / 7</p><h2>${esc(r.nazev)}</h2></div><img src="${svg(r.tecka || tecky[i])}" alt=""></div>
      <p>${esc(r.uvod)}</p>
      <dl class="facts"><div><dt>${t.cas}</dt><dd>${r.cas_min} ${t.min}</dd></div><div><dt>${t.porce}</dt><dd>${r.porce}</dd></div><div><dt>${t.kcal}</dt><dd>~${r.kcal}</dd></div></dl>
      <p class="allergens"><strong>${t.alergeny}:</strong> ${r.alergeny.length ? r.alergeny.join(", ") : t.bezAlergenu}</p>
      <div class="cols">
        <div><h3>${t.suroviny}</h3><ul class="ing">${r.suroviny.map((s) => `<li>${s.mnozstvi != null ? `<strong>${cislo(Number(s.mnozstvi), lang)} ${esc(s.jednotka || "")}</strong> ` : ""}${esc(s.co)}</li>`).join("")}</ul></div>
        <div><h3>${t.postup}</h3><ol class="steps">${(r.postup || []).map((k) => `<li>${esc(k.text)}</li>`).join("")}</ol></div>
      </div>
      ${r.tip ? `<p class="tip"><strong>${t.tip}:</strong> ${esc(r.tip)}</p>` : ""}
      <div class="notes"><p>${t.poznamky}</p>${"<span></span>".repeat(5)}</div>
    </section>`);
  });

  // nákupní seznam
  stranky.push(`<section class="page">
    <h2>${t.nakup}</h2><p>${t.nakupText}</p>
    <div class="shop">${["zelenina", "mlecne", "obiloviny", "ostatni"].filter((g) => podleSkupin[g]).map((g) => `<div><h3>${t.skupiny[g]}</h3><ul>${podleSkupin[g].map((v) => `<li><span class="box"></span>${v.mnozstvi ? `<strong>${cislo(v.mnozstvi, lang)} ${esc(v.jednotka || "")}</strong> ` : ""}${esc(v.co)}</li>`).join("")}</ul></div>`).join("")}</div>
  </section>`);

  // tipy a konec
  stranky.push(`<section class="page">
    <div class="intro"><img src="${svg("slavi")}" alt=""><h2>${t.tipy}</h2></div>
    <ol class="tips">${t.tipySeznam.map((x) => `<li>${esc(x)}</li>`).join("")}</ol>
    <div class="end"><h3>${t.konecH}</h3>
      <p>${t.konec[0]}<br><strong>${BASE}/nikys-kitchen-web/${lang}/</strong></p>
      <p>${t.konec[1]}<br><strong>${BASE}/jidlo-od-a-z/</strong></p></div>
    <p class="note">${t.pozn}</p>
    <p class="note">© 2026 Niky's Kitchen</p>
  </section>`);

  const html = `<!doctype html><html lang="${lang}"><head><meta charset="utf-8"><title>${t.titul} – Niky's Kitchen</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
<style>
@page { size: A5; margin: 0; }
* { box-sizing: border-box; }
body { margin: 0; font-family: "Plus Jakarta Sans", sans-serif; color: #2c2c2c; font-size: 10.5pt; line-height: 1.5; }
.page { width: 148mm; height: 210mm; padding: 14mm 13mm; background: #f7f5f0; page-break-after: always; overflow: hidden; position: relative; }
h1, h2, h3 { font-family: "Playfair Display", serif; color: #3d5233; line-height: 1.15; margin: 0 0 3mm; }
h1 { font-size: 30pt; } h2 { font-size: 18pt; } h3 { font-size: 12.5pt; margin-top: 5mm; }
p { margin: 0 0 3mm; }
.muted, .note { color: #6b6b6b; } .note { font-size: 8.5pt; font-style: italic; }
.cover { background: #3d5233; color: #fff; text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; }
.cover h1 { color: #fff; } .cover .sub { font-size: 13pt; opacity: 0.9; } .cover .brand { letter-spacing: 0.15em; text-transform: uppercase; font-weight: 700; font-size: 9pt; }
.cover .logo { width: 22mm; margin-bottom: 4mm; background: #f7f5f0; border-radius: 50%; padding: 2mm; }
.tecka-big { width: 62mm; margin-top: 8mm; background: #f7f5f0; border-radius: 50%; padding: 6mm; }
.intro { display: flex; gap: 5mm; align-items: center; margin-bottom: 4mm; } .intro img { width: 30mm; flex: none; }
.toc { padding-left: 5mm; } .toc li { margin: 1.6mm 0; } .toc li span.muted { display: block; font-size: 9pt; }
.plate { width: 70mm; display: block; margin: 4mm auto; } .plate text { font: 700 22px "Plus Jakarta Sans"; fill: #2c2c2c; }
.plate-legend { list-style: none; padding: 0; } .plate-legend li { display: flex; gap: 3mm; margin: 2.5mm 0; align-items: flex-start; }
.dot { flex: none; width: 8mm; height: 8mm; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 700; }
.d0 { background: #9db58a; } .d1 { background: #e8b48a; } .d2 { background: #e6cf8f; } .d3 { background: #fff; border: 1.5px solid #e3ded5; }
.r-head { display: flex; justify-content: space-between; align-items: flex-start; gap: 4mm; } .r-head img { width: 24mm; flex: none; }
.eyebrow { color: #a34d32; font-weight: 700; font-size: 8.5pt; letter-spacing: 0.1em; margin-bottom: 1mm; }
.facts { display: flex; gap: 2.5mm; margin: 2mm 0 3mm; } .facts div { background: #fff; border: 1px solid #e3ded5; border-radius: 3mm; padding: 1.5mm 3mm; }
.facts dt { font-size: 7.5pt; color: #6b6b6b; } .facts dd { margin: 0; font-weight: 700; }
.allergens { background: #fdf3d8; border: 1.5px solid #f59e0b; border-radius: 3mm; padding: 1.5mm 3mm; font-size: 9.5pt; }
.cols { display: grid; grid-template-columns: 1fr 1.25fr; gap: 6mm; } .ing, .steps { padding-left: 4.5mm; margin: 0; } .ing li, .steps li { margin: 1.2mm 0; }
.tip { margin-top: 4mm; background: #eef2ef; border-radius: 3mm; padding: 2.5mm 3.5mm; }
.shop { columns: 2; column-gap: 7mm; } .shop > div { break-inside: avoid; } .shop ul { list-style: none; padding: 0; margin: 0 0 3mm; }
.shop li { display: flex; gap: 2mm; align-items: baseline; margin: 1.3mm 0; font-size: 9.5pt; }
.box { flex: none; width: 3.2mm; height: 3.2mm; border: 1.3px solid #3d5233; border-radius: 0.8mm; transform: translateY(0.4mm); }
.shop strong { white-space: nowrap; }
.notes { position: absolute; left: 13mm; right: 13mm; bottom: 12mm; }
.notes p { font-family: "Playfair Display", serif; color: #3d5233; font-weight: 600; margin-bottom: 1mm; }
.notes span { display: block; height: 8mm; border-bottom: 1px solid #d9d2c5; }
.tips { padding-left: 5mm; } .tips li { margin: 2.5mm 0; }
.end { background: #fff; border: 1px solid #e3ded5; border-radius: 4mm; padding: 3mm 5mm; margin: 4mm 0; } .end h3 { margin-top: 1mm; } .end strong { color: #3d5233; font-size: 9pt; }
</style></head><body>${stranky.join("\n")}</body></html>`;
  writeFileSync(`${OUT}/startovaci-knizka-${lang}.html`, html);
  console.log("ok", lang, recepty.length, "receptů,", nakup.size, "položek v nákupu");
}
await sql.end();
