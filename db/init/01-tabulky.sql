-- ════════════════════════════════════════════════════════════════
--  Databáze Niky's Kitchen – STRUKTURA (tabulky, vazby, pravidla)
--  Spustí se sama při úplně prvním startu databáze v Dockeru.
--  Pořadí souborů: 01-tabulky.sql → 02-data.sql
-- ════════════════════════════════════════════════════════════════

-- Pomocná funkce: při každé úpravě řádku zapíše čas do sloupce „upraveno“
CREATE FUNCTION nastav_upraveno() RETURNS trigger AS $$
BEGIN
  NEW.upraveno := now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- ─────────────── OBSAH: RECEPTY ───────────────

-- Jeden řádek = jeden recept (údaje, které jsou stejné pro všechny jazyky)
CREATE TABLE recepty (
  slug        text PRIMARY KEY,                 -- adresa receptu, např. kolac-od-niky
  kategorie   text NOT NULL CHECK (kategorie IN ('slane', 'sladke', 'napoje')),
  stav        text NOT NULL DEFAULT 'ukazka' CHECK (stav IN ('niky', 'ukazka')),
  cas_min     integer NOT NULL CHECK (cas_min > 0),
  porce       integer NOT NULL DEFAULT 1 CHECK (porce > 0),
  kcal        integer CHECK (kcal > 0),         -- na 1 porci, orientačně; prázdné = doplní Niky
  jidla       text[] NOT NULL DEFAULT '{}',     -- kdy se hodí (pro appku): snidane, obed, vecere, svacina
  obrazek     text,                             -- soubor v public/images/recepty/
  obrazek_ai  boolean NOT NULL DEFAULT false,   -- fotka je zatím AI ilustrace
  obrazek_zdroj jsonb,                                  -- volná fotka: autor, licence, odkaz
  tecka       text,                             -- podoba maskota, když chybí fotka
  poradi      integer NOT NULL DEFAULT 0,       -- pořadí na webu
  zverejneno  boolean NOT NULL DEFAULT true,
  vytvoreno   timestamptz NOT NULL DEFAULT now(),
  upraveno    timestamptz NOT NULL DEFAULT now(),
  CHECK (jidla <@ ARRAY['snidane', 'obed', 'vecere', 'svacina'])
);
CREATE TRIGGER recepty_upraveno BEFORE UPDATE ON recepty
  FOR EACH ROW EXECUTE FUNCTION nastav_upraveno();

-- Texty receptu v každém jazyce (cs, en)
CREATE TABLE recepty_texty (
  recept    text NOT NULL REFERENCES recepty (slug) ON DELETE CASCADE ON UPDATE CASCADE,
  jazyk     text NOT NULL CHECK (jazyk IN ('cs', 'en')),
  nazev     text NOT NULL,
  uvod      text NOT NULL,
  postup    jsonb NOT NULL DEFAULT '[]',        -- [{ "text": "...", "obrazek": "..." }]
  varianty  jsonb,                              -- [{ "nazev": "A – sytá", "text": "..." }]
  tip       text,
  PRIMARY KEY (recept, jazyk)
);

-- Suroviny receptu – každá na vlastním řádku
CREATE TABLE suroviny (
  id        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  recept    text NOT NULL REFERENCES recepty (slug) ON DELETE CASCADE ON UPDATE CASCADE,
  jazyk     text NOT NULL CHECK (jazyk IN ('cs', 'en')),
  poradi    integer NOT NULL,
  mnozstvi  numeric CHECK (mnozstvi > 0),       -- prázdné = „podle chuti“
  jednotka  text,
  co        text NOT NULL,                      -- jak se to píše v receptu: „mozzarelly“
  zaklad    text,                               -- základní tvar pro Ledničku v appce: „mozzarella“
  UNIQUE (recept, jazyk, poradi)
);
CREATE INDEX suroviny_recept ON suroviny (recept);

-- 14 alergenů podle nařízení EU 1169/2011
CREATE TABLE alergeny (
  kod  text PRIMARY KEY,
  cs   text NOT NULL,
  en   text NOT NULL
);

CREATE TABLE recepty_alergeny (
  recept   text NOT NULL REFERENCES recepty (slug) ON DELETE CASCADE ON UPDATE CASCADE,
  alergen  text NOT NULL REFERENCES alergeny (kod),
  PRIMARY KEY (recept, alergen)
);


-- ─────────────── OBSAH: ČLÁNKY ───────────────

CREATE TABLE clanky (
  slug        text PRIMARY KEY,
  cteni_min   integer NOT NULL CHECK (cteni_min > 0),
  cile        text[] NOT NULL DEFAULT '{vse}',  -- komu ho appka doporučí: hubnout, udrzet, nabrat, vse
  zdroje      jsonb NOT NULL DEFAULT '[]',      -- [{ "nazev": "...", "url": "https://doi.org/..." }]
  poradi      integer NOT NULL DEFAULT 0,
  zverejneno  boolean NOT NULL DEFAULT true,
  vytvoreno   timestamptz NOT NULL DEFAULT now(),
  upraveno    timestamptz NOT NULL DEFAULT now(),
  CHECK (cile <@ ARRAY['hubnout', 'udrzet', 'nabrat', 'vse'])
);
CREATE TRIGGER clanky_upraveno BEFORE UPDATE ON clanky
  FOR EACH ROW EXECUTE FUNCTION nastav_upraveno();

CREATE TABLE clanky_texty (
  clanek    text NOT NULL REFERENCES clanky (slug) ON DELETE CASCADE ON UPDATE CASCADE,
  jazyk     text NOT NULL CHECK (jazyk IN ('cs', 'en')),
  nazev     text NOT NULL,
  perex     text NOT NULL,
  v_kostce  jsonb NOT NULL DEFAULT '[]',        -- 3 body „V kostce“
  telo      jsonb NOT NULL DEFAULT '[]',        -- bloky: { "h": nadpis } | { "p": odstavec } | { "ul": [body] }
  PRIMARY KEY (clanek, jazyk)
);

-- Propojení receptů a článků (oběma směry)
CREATE TABLE recepty_clanky (
  recept  text NOT NULL REFERENCES recepty (slug) ON DELETE CASCADE ON UPDATE CASCADE,
  clanek  text NOT NULL REFERENCES clanky (slug) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (recept, clanek)
);
CREATE INDEX recepty_clanky_clanek ON recepty_clanky (clanek);


-- ─────────────── NEWSLETTER ───────────────

CREATE TABLE newsletter (
  id           integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email        text NOT NULL UNIQUE CHECK (email ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
  jazyk        text NOT NULL DEFAULT 'cs' CHECK (jazyk IN ('cs', 'en')),
  souhlas      boolean NOT NULL CHECK (souhlas),   -- bez souhlasu (GDPR) se e-mail uložit nedá
  souhlas_kdy  timestamptz NOT NULL DEFAULT now(),
  zdroj        text,                                -- kde se přihlásil: paticka, recept…
  odhlaseno    timestamptz                          -- vyplněné = už nechce dostávat
);


-- ─────────────── OBCHOD (připraveno, zatím prázdné) ───────────────

CREATE TABLE produkty (
  slug         text PRIMARY KEY,
  typ          text NOT NULL CHECK (typ IN ('darek', 'plan', 'ebook', 'kurz', 'predplatne')),
  cena_kc      numeric(10, 2) NOT NULL CHECK (cena_kc >= 0),   -- 0 = zdarma (za e-mail)
  cena_puvodni numeric(10, 2) CHECK (cena_puvodni >= 0),       -- přeškrtnutá cena (zaváděcí sleva)
  za_mesic     boolean NOT NULL DEFAULT false,                 -- předplatné: cena je za měsíc
  stav         text NOT NULL DEFAULT 'pripravujeme' CHECK (stav IN ('pripravujeme', 'v_prodeji')),
  tecka        text,                                -- podoba maskota na obálce
  barva        text,                                -- barva obálky (sage, honey, terra, primary)
  obrazek      text,                                -- ilustrace místo obálky (kurz-online, kurz-nazivo)
  ukazka       jsonb,                               -- ukázka zdarma, např. jeden den plánu
  soubor       text,                                -- PDF ke stažení po zaplacení
  aktivni      boolean NOT NULL DEFAULT false,      -- false = zatím se neprodává
  poradi       integer NOT NULL DEFAULT 0,
  vytvoreno    timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE produkty_texty (
  produkt   text NOT NULL REFERENCES produkty (slug) ON DELETE CASCADE ON UPDATE CASCADE,
  jazyk     text NOT NULL CHECK (jazyk IN ('cs', 'en')),
  nazev     text NOT NULL,
  popis     text NOT NULL,                          -- jedna věta na kartu
  pro_koho  text,
  obsah     jsonb NOT NULL DEFAULT '[]',            -- co v něm najdeš (body)
  format    text,                                   -- PDF, počet stran, online…
  PRIMARY KEY (produkt, jazyk)
);

CREATE TABLE slevove_kody (
  kod            text PRIMARY KEY,                -- např. VITEJ10
  sleva_procent  integer NOT NULL CHECK (sleva_procent BETWEEN 1 AND 100),
  plati_od       date,
  plati_do       date,
  max_pouziti    integer CHECK (max_pouziti > 0), -- prázdné = bez omezení
  aktivni        boolean NOT NULL DEFAULT true
);

CREATE TABLE objednavky (
  id          integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email       text NOT NULL,
  jazyk       text NOT NULL DEFAULT 'cs' CHECK (jazyk IN ('cs', 'en')),
  stav        text NOT NULL DEFAULT 'nova' CHECK (stav IN ('nova', 'zaplacena', 'zrusena', 'vracena')),
  sleva_kod   text REFERENCES slevove_kody (kod),
  celkem_kc   numeric(10, 2) NOT NULL CHECK (celkem_kc >= 0),
  vytvoreno   timestamptz NOT NULL DEFAULT now(),
  zaplaceno   timestamptz
);

CREATE TABLE objednavky_polozky (
  objednavka  integer NOT NULL REFERENCES objednavky (id) ON DELETE CASCADE,
  produkt     text NOT NULL REFERENCES produkty (slug),
  cena_kc     numeric(10, 2) NOT NULL CHECK (cena_kc >= 0),  -- cena v době nákupu
  PRIMARY KEY (objednavka, produkt)
);


-- ─────────────── POHLED PRO APPKU ───────────────
-- Pohled (view) = uložený dotaz. Appka dostane recepty přesně v podobě, jakou potřebuje.
CREATE VIEW appka_recepty AS
SELECT
  r.slug                       AS id,
  t.nazev,
  r.kategorie,
  r.jidla                      AS jidlo,
  r.kcal,
  r.cas_min                    AS cas,
  ARRAY(
    SELECT DISTINCT s.zaklad FROM suroviny s
    WHERE s.recept = r.slug AND s.jazyk = 'cs' AND s.zaklad IS NOT NULL
    ORDER BY s.zaklad
  )                            AS suroviny,
  'cs/recepty/' || r.slug || '/' AS odkaz,
  r.poradi
FROM recepty r
JOIN recepty_texty t ON t.recept = r.slug AND t.jazyk = 'cs'
WHERE r.zverejneno;
