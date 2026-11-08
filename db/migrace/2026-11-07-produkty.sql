-- Úprava už existující databáze: nové sloupce pro produkty v obchodě.
-- Nová (prázdná) databáze to má rovnou v init/01-tabulky.sql, tohle je jen pro tu, co už běží.
-- Spuštění: docker compose exec -T db sh -c 'psql -U $POSTGRES_USER -d $POSTGRES_DB' < db/migrace/2026-11-07-produkty.sql

ALTER TABLE produkty DROP CONSTRAINT IF EXISTS produkty_typ_check;
ALTER TABLE produkty ADD CONSTRAINT produkty_typ_check CHECK (typ IN ('darek', 'plan', 'ebook', 'kurz', 'predplatne'));
ALTER TABLE produkty
  ADD COLUMN IF NOT EXISTS cena_puvodni numeric(10, 2) CHECK (cena_puvodni >= 0),
  ADD COLUMN IF NOT EXISTS za_mesic boolean NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS stav text NOT NULL DEFAULT 'pripravujeme' CHECK (stav IN ('pripravujeme', 'v_prodeji')),
  ADD COLUMN IF NOT EXISTS tecka text,
  ADD COLUMN IF NOT EXISTS barva text,
  ADD COLUMN IF NOT EXISTS ukazka jsonb,
  ADD COLUMN IF NOT EXISTS poradi integer NOT NULL DEFAULT 0;

ALTER TABLE produkty_texty
  ADD COLUMN IF NOT EXISTS pro_koho text,
  ADD COLUMN IF NOT EXISTS obsah jsonb NOT NULL DEFAULT '[]',
  ADD COLUMN IF NOT EXISTS format text;
