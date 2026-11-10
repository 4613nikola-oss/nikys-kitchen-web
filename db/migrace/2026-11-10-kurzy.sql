-- Úprava existující databáze: ilustrace u kurzů a nový kurz vaření naživo
-- Spuštění: docker compose exec -T db psql -U niky -d nikys_kitchen < db/migrace/2026-11-10-kurzy.sql
ALTER TABLE produkty ADD COLUMN IF NOT EXISTS obrazek text;

UPDATE produkty SET obrazek = 'kurz-online' WHERE slug = 'kurz-vareni-dopredu';

INSERT INTO produkty (slug, typ, cena_kc, aktivni, za_mesic, stav, tecka, barva, poradi, obrazek)
VALUES ('kurz-vareni-nazivo', 'kurz', 1290.00, false, false, 'pripravujeme', 'vari', 'terra', 4, 'kurz-nazivo')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES
('kurz-vareni-nazivo', 'cs', 'Kurz vaření naživo', 'Jedno odpoledne v kuchyni s lektorkou. Vaříte spolu v malé skupině a domů si odneseš jídlo na několik dní.', 'Pro ty, kdo se nejlíp naučí u plotny, s lidmi kolem sebe, a chtějí si všechno hned vyzkoušet.', '["3 hodiny vaření v malé skupině (nejvýš 8 lidí)", "Lektorka ukáže každý krok a ty ho hned zkoušíš", "Uvaříte 3 základy a ke každému varianty: zhubnout, udržet, nabrat", "Suroviny a zástěra v ceně, jídlo si odneseš domů", "Recepty a nákupní seznam v PDF"]', 'Naživo v kuchyňském studiu, 3 hodiny. Cena je za 1 osobu. Místo a termíny pošleme e-mailem.'),
('kurz-vareni-nazivo', 'en', 'Live cooking class', 'An afternoon in the kitchen with an instructor. You cook together in a small group and take home food for several days.', 'For anyone who learns best at the stove, with people around, and wants to try everything right away.', '["3 hours of cooking in a small group (8 people max)", "The instructor shows every step and you try it straight away", "Cook 3 bases, each with versions to lose, maintain or gain", "Ingredients and apron included, take the food home", "Recipes and a shopping list as a PDF"]', 'In person in a kitchen studio, 3 hours. Price per person. Place and dates sent by email.')
ON CONFLICT DO NOTHING;
