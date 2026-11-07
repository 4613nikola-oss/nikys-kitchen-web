-- ════════════════════════════════════════════════════════════════
--  Databáze Niky's Kitchen – DATA (recepty, články, alergeny)
--  Po úpravách v Admineru tento soubor obnovíš příkazem z README (záloha dat).
-- ════════════════════════════════════════════════════════════════

INSERT INTO alergeny (kod, cs, en) VALUES
  ('lepek', 'lepek', 'gluten'),
  ('korysi', 'korýši', 'crustaceans'),
  ('vejce', 'vejce', 'eggs'),
  ('ryby', 'ryby', 'fish'),
  ('arasidy', 'arašídy', 'peanuts'),
  ('soja', 'sója', 'soy'),
  ('mleko', 'mléko', 'milk'),
  ('orechy', 'ořechy', 'tree nuts'),
  ('celer', 'celer', 'celery'),
  ('horcice', 'hořčice', 'mustard'),
  ('sezam', 'sezam', 'sesame'),
  ('siricitany', 'oxid siřičitý a siřičitany', 'sulphites'),
  ('vlcibob', 'vlčí bob', 'lupin'),
  ('mekkysi', 'měkkýši', 'molluscs');

-- Koláč od Niky
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('kolac-od-niky', 'slane', 'niky', 60, 4, NULL, ARRAY['obed', 'vecere'], 'kolac-hotovy.webp', true, 'kolac', 1);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('kolac-od-niky', 'cs', 'Koláč od Niky', 'Rodinná receptura: jemná cuketa, poctivý bramborový základ, táhnoucí se mozzarella, čerstvý špenát a česnek. Bez smetany, a stejně vláčný.', '[{"text":"Troubu předehřej na 180 °C. Smíchej sůl, pepř a majoránku.","obrazek":"kolac-koreni.webp"},{"text":"Brambory nakrájej na tenké plátky a vyskládej jimi dno formy.","obrazek":"kolac-krok-2.webp"},{"text":"Na brambory rozlož mleté maso promíchané s česnekem a polovinou kořenící směsi.","obrazek":"kolac-krok-3.webp"},{"text":"Cuketu nastrouhej, lehce vymačkej a rozprostři na maso.","obrazek":"kolac-krok-4.webp"},{"text":"Přidej špenát a natrhanou mozzarellu.","obrazek":"kolac-krok-5.webp"},{"text":"Vejce rozšlehej se zbytkem koření, zalij jimi koláč a posyp piniovými oříšky.","obrazek":"kolac-krok-6.webp"},{"text":"Peč asi 45 minut, dokud vejce neztuhnou a povrch nezezlátne."}]'::jsonb, NULL, 'Koláč vydrží v lednici 3 dny, takže je skvělý na vaření dopředu. Piniové oříšky nepatří mezi 14 hlavních alergenů EU, ale při alergii na ořechy buď opatrná.');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 1, 400, 'g', 'brambor', 'brambory');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 2, 1, 'ks', 'cukety', 'cuketa');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 3, 500, 'g', 'kuřecího mletého masa', 'kuřecí maso');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 4, 200, 'g', 'mozzarelly', 'mozzarella');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 5, 125, 'g', 'čerstvého špenátu', 'špenát');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 6, 3, 'stroužky', 'česneku', 'česnek');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 7, 1, 'lžíce', 'majoránky', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 8, 4, 'ks', 'vajec', 'vejce');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 9, 30, 'g', 'piniových oříšků', 'piniové oříšky');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'cs', 10, NULL, NULL, 'sůl a pepř podle chuti', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('kolac-od-niky', 'en', 'Niky''s Pie', 'A family recipe: tender courgette, a hearty potato base, stretchy mozzarella, fresh spinach and garlic. No cream, and still moist.', '[{"text":"Preheat the oven to 180 °C. Mix salt, pepper and marjoram.","obrazek":"kolac-koreni.webp"},{"text":"Slice the potatoes thinly and line the bottom of the dish.","obrazek":"kolac-krok-2.webp"},{"text":"Spread the mince, mixed with garlic and half of the seasoning, over the potatoes.","obrazek":"kolac-krok-3.webp"},{"text":"Grate the courgette, squeeze it lightly and spread it over the meat.","obrazek":"kolac-krok-4.webp"},{"text":"Add the spinach and torn mozzarella.","obrazek":"kolac-krok-5.webp"},{"text":"Whisk the eggs with the rest of the seasoning, pour over and sprinkle with pine nuts.","obrazek":"kolac-krok-6.webp"},{"text":"Bake for about 45 minutes until the eggs set and the top turns golden."}]'::jsonb, NULL, 'Keeps in the fridge for 3 days, perfect for cooking ahead. Pine nuts are not one of the 14 main EU allergens, but take care if you have a nut allergy.');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 1, 400, 'g', 'potatoes', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 2, 1, 'pc', 'courgette', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 3, 500, 'g', 'minced chicken', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 4, 200, 'g', 'mozzarella', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 5, 125, 'g', 'fresh spinach', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 6, 3, 'cloves', 'garlic', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 7, 1, 'tbsp', 'marjoram', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 8, 4, 'pcs', 'eggs', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 9, 30, 'g', 'pine nuts', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kolac-od-niky', 'en', 10, NULL, NULL, 'salt and pepper to taste', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('kolac-od-niky', 'vejce');
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('kolac-od-niky', 'mleko');

-- Pečená zelenina s quinoou – základ na 3 dny
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('pecena-zelenina-s-quinoou', 'slane', 'ukazka', 40, 3, 390, ARRAY['obed', 'vecere'], NULL, false, 'talir', 2);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('pecena-zelenina-s-quinoou', 'cs', 'Pečená zelenina s quinoou – základ na 3 dny', 'Jeden plech, tři různé večeře. V neděli upeč základ a každý den ho dochuť jinak.', '[{"text":"Troubu předehřej na 200 °C. Zeleninu nakrájej na kousky, promíchej s olejem a kořením."},{"text":"Peč na plechu asi 25 minut, v polovině promíchej."},{"text":"Mezitím uvař quinou podle návodu na obalu."},{"text":"Smíchej zeleninu s quinoou a rozděl do 3 krabiček. V lednici vydrží 3 dny."}]'::jsonb, '[{"nazev":"A – sytá","text":"Přidej grilované kuřecí maso. Víc bílkovin, hodí se při nabírání."},{"nazev":"B – rostlinná","text":"Přidej cizrnu a lžíci tahini. Bez masa. Pozor: tahini obsahuje sezam."},{"nazev":"C – rychlá","text":"Přidej fetu a vejce natvrdo. Hotové za 5 minut. Obsahuje mléko a vejce."}]'::jsonb, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'cs', 1, 150, 'g', 'quinoy', 'quinoa');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'cs', 2, 2, 'ks', 'cukety', 'cuketa');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'cs', 3, 2, 'ks', 'paprik', 'paprika');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'cs', 4, 1, 'ks', 'červené cibule', 'cibule');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'cs', 5, 2, 'lžíce', 'olivového oleje', 'olivový olej');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'cs', 6, NULL, NULL, 'sůl, pepř, uzená paprika', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('pecena-zelenina-s-quinoou', 'en', 'Roasted vegetables with quinoa – a 3-day base', 'One tray, three different dinners. Roast the base on Sunday and give it a new twist every day.', '[{"text":"Preheat the oven to 200 °C. Chop the vegetables and toss with oil and spices."},{"text":"Roast for about 25 minutes, stirring halfway."},{"text":"Meanwhile cook the quinoa according to the packet."},{"text":"Mix vegetables with quinoa and divide into 3 boxes. Keeps for 3 days in the fridge."}]'::jsonb, '[{"nazev":"A – hearty","text":"Add grilled chicken. More protein, good for building muscle."},{"nazev":"B – plant-based","text":"Add chickpeas and a spoon of tahini. No meat. Note: tahini contains sesame."},{"nazev":"C – quick","text":"Add feta and a hard-boiled egg. Ready in 5 minutes. Contains milk and egg."}]'::jsonb, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'en', 1, 150, 'g', 'quinoa', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'en', 2, 2, 'pcs', 'courgettes', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'en', 3, 2, 'pcs', 'peppers', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'en', 4, 1, 'pc', 'red onion', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'en', 5, 2, 'tbsp', 'olive oil', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('pecena-zelenina-s-quinoou', 'en', 6, NULL, NULL, 'salt, pepper, smoked paprika', NULL);

-- Kuřecí salát s quinoou
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('kureci-salat-s-quinoou', 'slane', 'ukazka', 25, 2, 480, ARRAY['obed'], NULL, false, 'talir', 3);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('kureci-salat-s-quinoou', 'cs', 'Kuřecí salát s quinoou', 'Sytý salát do krabičky, který tě podrží celé odpoledne.', '[{"text":"Quinou uvař a nech vychladnout."},{"text":"Kuřecí prsa osol, opepři a opeč na pánvi dozlatova, pak nakrájej."},{"text":"Rajčata a okurku nakrájej na kostičky."},{"text":"Vše smíchej s olejem, citronem a petrželkou."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'cs', 1, 250, 'g', 'kuřecích prsou', 'kuřecí maso');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'cs', 2, 120, 'g', 'quinoy', 'quinoa');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'cs', 3, 2, 'ks', 'rajčat', 'rajčata');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'cs', 4, 1, 'ks', 'okurky', 'okurka');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'cs', 5, 2, 'lžíce', 'olivového oleje', 'olivový olej');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'cs', 6, 0.5, 'ks', 'citronu (šťáva)', 'citron');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'cs', 7, NULL, NULL, 'sůl, pepř, petrželka', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('kureci-salat-s-quinoou', 'en', 'Chicken salad with quinoa', 'A filling lunchbox salad that keeps you going all afternoon.', '[{"text":"Cook the quinoa and let it cool."},{"text":"Season the chicken and pan-fry until golden, then slice."},{"text":"Dice the tomatoes and cucumber."},{"text":"Mix everything with oil, lemon juice and parsley."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'en', 1, 250, 'g', 'chicken breast', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'en', 2, 120, 'g', 'quinoa', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'en', 3, 2, 'pcs', 'tomatoes', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'en', 4, 1, 'pc', 'cucumber', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'en', 5, 2, 'tbsp', 'olive oil', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'en', 6, 0.5, 'pc', 'lemon (juice)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('kureci-salat-s-quinoou', 'en', 7, NULL, NULL, 'salt, pepper, parsley', NULL);

-- Čočkový salát s fetou
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('cockovy-salat-s-fetou', 'slane', 'ukazka', 30, 2, 450, ARRAY['obed', 'vecere'], NULL, false, 'talir', 4);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('cockovy-salat-s-fetou', 'cs', 'Čočkový salát s fetou', 'Levný, rychlý a plný vlákniny. Druhý den chutná ještě líp.', '[{"text":"Čočku uvař doměkka (asi 20 minut) a sceď."},{"text":"Cibuli nakrájej najemno, rajčata na kostičky."},{"text":"Smíchej s čočkou, olejem a citronem, navrch rozdrob fetu."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'cs', 1, 150, 'g', 'hnědé nebo zelené čočky', 'čočka');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'cs', 2, 1, 'ks', 'červené cibule', 'cibule');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'cs', 3, 2, 'ks', 'rajčat', 'rajčata');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'cs', 4, 80, 'g', 'fety', 'feta');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'cs', 5, 2, 'lžíce', 'olivového oleje', 'olivový olej');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'cs', 6, NULL, NULL, 'šťáva z ½ citronu, sůl, pepř, petrželka', 'citron');
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('cockovy-salat-s-fetou', 'en', 'Lentil salad with feta', 'Cheap, quick and full of fibre. Tastes even better the next day.', '[{"text":"Cook the lentils until soft (about 20 minutes) and drain."},{"text":"Finely chop the onion, dice the tomatoes."},{"text":"Mix with lentils, oil and lemon, crumble feta on top."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'en', 1, 150, 'g', 'brown or green lentils', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'en', 2, 1, 'pc', 'red onion', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'en', 3, 2, 'pcs', 'tomatoes', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'en', 4, 80, 'g', 'feta', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'en', 5, 2, 'tbsp', 'olive oil', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('cockovy-salat-s-fetou', 'en', 6, NULL, NULL, 'juice of ½ lemon, salt, pepper, parsley', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('cockovy-salat-s-fetou', 'mleko');

-- Omeleta se zeleninou a sýrem
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('omeleta-se-zeleninou', 'slane', 'ukazka', 15, 1, 300, ARRAY['snidane', 'vecere'], NULL, false, 'talir', 5);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('omeleta-se-zeleninou', 'cs', 'Omeleta se zeleninou a sýrem', 'Záchranná večeře za 15 minut z toho, co máš v lednici.', '[{"text":"Zeleninu nakrájej a krátce opeč na oleji."},{"text":"Vejce rozšlehej se solí a pepřem a zalij jimi zeleninu."},{"text":"Posyp sýrem, přiklop a nech 3 minuty dojít na mírném ohni."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'cs', 1, 3, 'ks', 'vajec', 'vejce');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'cs', 2, 0.5, 'ks', 'papriky', 'paprika');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'cs', 3, 1, 'ks', 'rajčete', 'rajčata');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'cs', 4, 0.25, 'ks', 'cibule', 'cibule');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'cs', 5, 30, 'g', 'sýra', 'sýr');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'cs', 6, 1, 'lžička', 'oleje', 'olej');
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('omeleta-se-zeleninou', 'en', 'Vegetable and cheese omelette', 'A rescue dinner in 15 minutes from whatever is in your fridge.', '[{"text":"Chop the vegetables and fry briefly in oil."},{"text":"Whisk the eggs with salt and pepper and pour over."},{"text":"Sprinkle with cheese, cover and cook gently for 3 minutes."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'en', 1, 3, 'pcs', 'eggs', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'en', 2, 0.5, 'pc', 'pepper', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'en', 3, 1, 'pc', 'tomato', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'en', 4, 0.25, 'pc', 'onion', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'en', 5, 30, 'g', 'cheese', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('omeleta-se-zeleninou', 'en', 6, 1, 'tsp', 'oil', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('omeleta-se-zeleninou', 'vejce');
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('omeleta-se-zeleninou', 'mleko');

-- Tvarohová pomazánka na kváskovém chlebu
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('tvarohova-pomazanka', 'slane', 'ukazka', 10, 2, 320, ARRAY['snidane', 'vecere'], NULL, false, 'talir', 6);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('tvarohova-pomazanka', 'cs', 'Tvarohová pomazánka na kváskovém chlebu', 'Snídaně nebo lehká večeře plná bílkovin, hotová za 10 minut.', '[{"text":"Tvaroh rozmíchej s jogurtem, solí a pepřem."},{"text":"Přidej nasekanou pažitku a nakrájené ředkvičky."},{"text":"Namaž na chléb."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'cs', 1, 250, 'g', 'tvarohu', 'tvaroh');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'cs', 2, 2, 'lžíce', 'bílého jogurtu', 'jogurt');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'cs', 3, 4, 'ks', 'ředkviček', 'ředkvičky');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'cs', 4, 4, 'krajíce', 'kváskového chleba', 'kváskový chléb');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'cs', 5, NULL, NULL, 'pažitka, sůl, pepř', 'pažitka');
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('tvarohova-pomazanka', 'en', 'Quark spread on sourdough bread', 'A protein-rich breakfast or light dinner, ready in 10 minutes.', '[{"text":"Mix the quark with yoghurt, salt and pepper."},{"text":"Add chopped chives and sliced radishes."},{"text":"Spread on the bread."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'en', 1, 250, 'g', 'quark (tvaroh)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'en', 2, 2, 'tbsp', 'plain yoghurt', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'en', 3, 4, 'pcs', 'radishes', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'en', 4, 4, 'slices', 'sourdough bread', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohova-pomazanka', 'en', 5, NULL, NULL, 'chives, salt, pepper', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('tvarohova-pomazanka', 'mleko');
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('tvarohova-pomazanka', 'lepek');

-- Ovesná kaše s jablkem a skořicí
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('ovesna-kase-s-jablkem', 'sladke', 'ukazka', 10, 1, 350, ARRAY['snidane'], NULL, false, 'buchta', 7);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ovesna-kase-s-jablkem', 'cs', 'Ovesná kaše s jablkem a skořicí', 'Teplá snídaně, která zasytí do oběda.', '[{"text":"Vločky vař v mléce asi 5 minut za stálého míchání."},{"text":"Jablko nastrouhej nebo nakrájej a přimíchej se skořicí."},{"text":"Posyp ořechy, podle chuti přidej med."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'cs', 1, 50, 'g', 'ovesných vloček', 'ovesné vločky');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'cs', 2, 250, 'ml', 'mléka (i rostlinného)', 'mléko');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'cs', 3, 1, 'ks', 'jablka', 'jablko');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'cs', 4, 15, 'g', 'vlašských ořechů', 'ořechy');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'cs', 5, NULL, NULL, 'skořice, lžička medu (nepovinně)', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ovesna-kase-s-jablkem', 'en', 'Porridge with apple and cinnamon', 'A warm breakfast that keeps you full until lunch.', '[{"text":"Simmer the oats in milk for about 5 minutes, stirring."},{"text":"Grate or chop the apple and stir in with cinnamon."},{"text":"Top with walnuts and add honey to taste."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'en', 1, 50, 'g', 'rolled oats', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'en', 2, 250, 'ml', 'milk (or plant-based)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'en', 3, 1, 'pc', 'apple', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'en', 4, 15, 'g', 'walnuts', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ovesna-kase-s-jablkem', 'en', 5, NULL, NULL, 'cinnamon, a teaspoon of honey (optional)', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('ovesna-kase-s-jablkem', 'lepek');
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('ovesna-kase-s-jablkem', 'mleko');
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('ovesna-kase-s-jablkem', 'orechy');

-- Banánový chlebíček bez přidaného cukru
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('bananovy-chlebicek', 'sladke', 'ukazka', 50, 10, 210, ARRAY['snidane', 'svacina'], NULL, false, 'buchta', 8);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('bananovy-chlebicek', 'cs', 'Banánový chlebíček bez přidaného cukru', 'Sladkost dodají zralé banány. Ideální sladká tečka ke kávě.', '[{"text":"Troubu předehřej na 180 °C a formu vyskládej papírem."},{"text":"Banány rozmačkej, přidej vejce a promíchej."},{"text":"Vmíchej vločky, prášek do pečiva, skořici a ořechy."},{"text":"Peč asi 40 minut, nech vychladnout a nakrájej na 10 plátků."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'cs', 1, 3, 'ks', 'zralých banánů', 'banán');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'cs', 2, 2, 'ks', 'vajec', 'vejce');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'cs', 3, 200, 'g', 'ovesných vloček (rozmixovaných)', 'ovesné vločky');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'cs', 4, 1, 'lžička', 'prášku do pečiva', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'cs', 5, 40, 'g', 'vlašských ořechů', 'ořechy');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'cs', 6, NULL, NULL, 'skořice', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('bananovy-chlebicek', 'en', 'Banana bread with no added sugar', 'Ripe bananas bring the sweetness. A perfect sweet treat with coffee.', '[{"text":"Preheat the oven to 180 °C and line a loaf tin."},{"text":"Mash the bananas, add the eggs and mix."},{"text":"Stir in oats, baking powder, cinnamon and walnuts."},{"text":"Bake for about 40 minutes, cool and cut into 10 slices."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'en', 1, 3, 'pcs', 'ripe bananas', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'en', 2, 2, 'pcs', 'eggs', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'en', 3, 200, 'g', 'oats (blended)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'en', 4, 1, 'tsp', 'baking powder', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'en', 5, 40, 'g', 'walnuts', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('bananovy-chlebicek', 'en', 6, NULL, NULL, 'cinnamon', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('bananovy-chlebicek', 'vejce');
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('bananovy-chlebicek', 'lepek');
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('bananovy-chlebicek', 'orechy');

-- Tvarohový dezert s jahodami
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('tvarohovy-dezert-s-jahodami', 'sladke', 'ukazka', 10, 2, 190, ARRAY['svacina'], NULL, false, 'zakusek', 9);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('tvarohovy-dezert-s-jahodami', 'cs', 'Tvarohový dezert s jahodami', 'Sladká tečka plná bílkovin, hotová za 10 minut.', '[{"text":"Tvaroh vyšlehej s jogurtem, medem a vanilkou."},{"text":"Jahody nakrájej."},{"text":"Vrstvi do skleniček krém a jahody."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'cs', 1, 250, 'g', 'tvarohu', 'tvaroh');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'cs', 2, 150, 'g', 'bílého jogurtu', 'jogurt');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'cs', 3, 200, 'g', 'jahod', 'jahody');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'cs', 4, 2, 'lžičky', 'medu', 'med');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'cs', 5, NULL, NULL, 'vanilka', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('tvarohovy-dezert-s-jahodami', 'en', 'Quark dessert with strawberries', 'A protein-rich sweet treat, ready in 10 minutes.', '[{"text":"Whip the quark with yoghurt, honey and vanilla."},{"text":"Slice the strawberries."},{"text":"Layer cream and strawberries in glasses."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'en', 1, 250, 'g', 'quark (tvaroh)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'en', 2, 150, 'g', 'plain yoghurt', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'en', 3, 200, 'g', 'strawberries', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'en', 4, 2, 'tsp', 'honey', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('tvarohovy-dezert-s-jahodami', 'en', 5, NULL, NULL, 'vanilla', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('tvarohovy-dezert-s-jahodami', 'mleko');

-- Čokoládové kuličky z datlí
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('datlove-kulicky', 'sladke', 'ukazka', 15, 4, 180, ARRAY['svacina'], NULL, false, 'zakusek', 10);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('datlove-kulicky', 'cs', 'Čokoládové kuličky z datlí', 'Tři kuličky jako sladká tečka po obědě. Bez pečení.', '[{"text":"Ořechy rozmixuj najemno."},{"text":"Přidej datle, kakao a sůl a mixuj, dokud se hmota nespojí."},{"text":"Tvaruj 12 kuliček a obal v kokosu. Uchovej v lednici."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('datlove-kulicky', 'cs', 1, 150, 'g', 'datlí bez pecek', 'datle');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('datlove-kulicky', 'cs', 2, 100, 'g', 'mandlí nebo vlašských ořechů', 'ořechy');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('datlove-kulicky', 'cs', 3, 2, 'lžíce', 'kakaa', 'kakao');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('datlove-kulicky', 'cs', 4, NULL, NULL, 'špetka soli, kokos na obalení (nepovinně)', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('datlove-kulicky', 'en', 'Chocolate date balls', 'Three balls as a sweet treat after lunch. No baking.', '[{"text":"Blend the nuts finely."},{"text":"Add dates, cocoa and salt and blend until it sticks together."},{"text":"Roll 12 balls and coat in coconut. Keep in the fridge."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('datlove-kulicky', 'en', 1, 150, 'g', 'pitted dates', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('datlove-kulicky', 'en', 2, 100, 'g', 'almonds or walnuts', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('datlove-kulicky', 'en', 3, 2, 'tbsp', 'cocoa', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('datlove-kulicky', 'en', 4, NULL, NULL, 'a pinch of salt, coconut for rolling (optional)', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('datlove-kulicky', 'orechy');

-- Jogurtový ovocný pohár
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('jogurtovy-ovocny-pohar', 'sladke', 'ukazka', 10, 2, 230, ARRAY['snidane', 'svacina'], NULL, false, 'pohar', 11);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('jogurtovy-ovocny-pohar', 'cs', 'Jogurtový ovocný pohár', 'Vrstvy jogurtu, ovoce a křupavých vloček. Vypadá jako z cukrárny.', '[{"text":"Vločky opraž nasucho na pánvi dozlatova."},{"text":"Jogurt promíchej s medem, kiwi nakrájej."},{"text":"Vrstvi do pohárů jogurt, ovoce a vločky, ozdob mátou."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'cs', 1, 300, 'g', 'bílého jogurtu', 'jogurt');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'cs', 2, 150, 'g', 'borůvek', 'borůvky');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'cs', 3, 1, 'ks', 'kiwi', 'kiwi');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'cs', 4, 2, 'lžíce', 'ovesných vloček', 'ovesné vločky');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'cs', 5, 1, 'lžička', 'medu', 'med');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'cs', 6, NULL, NULL, 'lístky máty', 'máta');
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('jogurtovy-ovocny-pohar', 'en', 'Yoghurt fruit parfait', 'Layers of yoghurt, fruit and crunchy oats. Looks like it came from a patisserie.', '[{"text":"Toast the oats in a dry pan until golden."},{"text":"Stir honey into the yoghurt, slice the kiwi."},{"text":"Layer yoghurt, fruit and oats in glasses, garnish with mint."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'en', 1, 300, 'g', 'plain yoghurt', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'en', 2, 150, 'g', 'blueberries', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'en', 3, 1, 'pc', 'kiwi', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'en', 4, 2, 'tbsp', 'rolled oats', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'en', 5, 1, 'tsp', 'honey', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('jogurtovy-ovocny-pohar', 'en', 6, NULL, NULL, 'mint leaves', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('jogurtovy-ovocny-pohar', 'mleko');
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('jogurtovy-ovocny-pohar', 'lepek');

-- Domácí ledová káva s vanilkou
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('ledova-kava-s-vanilkou', 'napoje', 'niky', 5, 1, NULL, ARRAY['svacina'], NULL, false, 'sklenice', 12);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ledova-kava-s-vanilkou', 'cs', 'Domácí ledová káva s vanilkou', 'Osvěžující kávový drink s kapkou vanilky a rostlinným mlékem pro horké dny.', '[{"text":"Uvař kávu a nech ji vychladnout."},{"text":"Do vysoké sklenice nasyp led a zalij ho mlékem s kapkou vanilky."},{"text":"Opatrně přilij kávu, vznikne mramorový efekt. Před pitím promíchej."}]'::jsonb, NULL, 'Mandlové mléko obsahuje ořechy, ovesné může obsahovat lepek. Vyber podle sebe.');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'cs', 1, 1, 'dvojité', 'espresso (nebo silná překapávaná káva)', 'káva');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'cs', 2, 200, 'ml', 'mandlového nebo ovesného mléka', 'rostlinné mléko');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'cs', 3, NULL, NULL, 'pár kapek vanilkového extraktu', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'cs', 4, NULL, NULL, 'lžička javorového sirupu (nepovinně)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'cs', 5, NULL, NULL, 'hodně ledu', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ledova-kava-s-vanilkou', 'en', 'Homemade iced coffee with vanilla', 'A refreshing coffee drink with a drop of vanilla and plant milk for hot days.', '[{"text":"Brew the coffee and let it cool."},{"text":"Fill a tall glass with ice and pour in the milk with a drop of vanilla."},{"text":"Gently pour in the coffee for a marbled look. Stir before drinking."}]'::jsonb, NULL, 'Almond milk contains nuts, oat milk may contain gluten. Choose what suits you.');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'en', 1, 1, 'double', 'espresso (or strong filter coffee)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'en', 2, 200, 'ml', 'almond or oat milk', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'en', 3, NULL, NULL, 'a few drops of vanilla extract', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'en', 4, NULL, NULL, 'a teaspoon of maple syrup (optional)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledova-kava-s-vanilkou', 'en', 5, NULL, NULL, 'plenty of ice', NULL);

-- Okurková limonáda s limetkou a mátou
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('okurkova-limonada', 'napoje', 'niky', 10, 4, NULL, ARRAY['svacina'], NULL, false, 'sklenice', 13);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('okurkova-limonada', 'cs', 'Okurková limonáda s limetkou a mátou', 'Svěží domácí limonáda z čerstvé okurky, limetky a máty.', '[{"text":"Okurku rozmixuj s trochou vody na hladké pyré."},{"text":"Pyré sceď přes jemné sítko."},{"text":"Smíchej s limetkovou šťávou, medem a podrcenou mátou."},{"text":"Zalij perlivou vodou, přidej led a plátky okurky."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('okurkova-limonada', 'cs', 1, 1.5, 'ks', 'salátové okurky', 'okurka');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('okurkova-limonada', 'cs', 2, 2, 'ks', 'limetek (šťáva)', 'limetka');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('okurkova-limonada', 'cs', 3, 1, 'lžíce', 'medu', 'med');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('okurkova-limonada', 'cs', 4, NULL, NULL, 'hrst čerstvé máty, perlivá voda, led', 'máta');
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('okurkova-limonada', 'en', 'Cucumber lemonade with lime and mint', 'A fresh homemade lemonade with cucumber, lime and mint.', '[{"text":"Blend the cucumber with a little water until smooth."},{"text":"Strain through a fine sieve."},{"text":"Mix with lime juice, honey and crushed mint."},{"text":"Top with sparkling water, add ice and cucumber slices."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('okurkova-limonada', 'en', 1, 1.5, 'pcs', 'cucumbers', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('okurkova-limonada', 'en', 2, 2, 'pcs', 'limes (juice)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('okurkova-limonada', 'en', 3, 1, 'tbsp', 'honey', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('okurkova-limonada', 'en', 4, NULL, NULL, 'a handful of fresh mint, sparkling water, ice', NULL);

-- Domácí ginger shot
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('ginger-shot', 'napoje', 'niky', 10, 4, NULL, ARRAY['svacina'], NULL, false, 'sklenice', 14);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ginger-shot', 'cs', 'Domácí ginger shot', 'Malá sklenička, která tě ráno probudí. Doma ho máš za pár minut a bez zbytečného cukru.', '[{"text":"Zázvor omyj a nakrájej na kousky (loupat nemusíš)."},{"text":"Rozmixuj s vodou a citronovou šťávou."},{"text":"Sceď, vmíchej med a rozlij do 4 malých skleniček. V lednici vydrží 3 dny."}]'::jsonb, NULL, 'Je pořádně ostrý. Začni s polovinou panáku.');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'cs', 1, 100, 'g', 'čerstvého zázvoru', 'zázvor');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'cs', 2, 2, 'ks', 'citronů (šťáva)', 'citron');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'cs', 3, 1, 'lžíce', 'medu', 'med');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'cs', 4, 100, 'ml', 'vody', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'cs', 5, NULL, NULL, 'špetka kurkumy a pepře (nepovinně)', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ginger-shot', 'en', 'Homemade ginger shot', 'A tiny glass that wakes you up in the morning. Made at home in minutes, with no unnecessary sugar.', '[{"text":"Wash the ginger and cut into pieces (no need to peel)."},{"text":"Blend with water and lemon juice."},{"text":"Strain, stir in honey and pour into 4 small glasses. Keeps for 3 days in the fridge."}]'::jsonb, NULL, 'It is really spicy. Start with half a shot.');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'en', 1, 100, 'g', 'fresh ginger', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'en', 2, 2, 'pcs', 'lemons (juice)', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'en', 3, 1, 'tbsp', 'honey', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'en', 4, 100, 'ml', 'water', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ginger-shot', 'en', 5, NULL, NULL, 'a pinch of turmeric and pepper (optional)', NULL);

-- Zelené smoothie
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('zelene-smoothie', 'napoje', 'ukazka', 5, 1, 150, ARRAY['snidane', 'svacina'], NULL, false, 'sklenice', 15);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('zelene-smoothie', 'cs', 'Zelené smoothie', 'Rychlá snídaně do ruky. Špenát nebude cítit, slibuju.', '[{"text":"Vše dej do mixéru."},{"text":"Mixuj do hladka, podle potřeby přidej vodu."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'cs', 1, NULL, NULL, 'hrst baby špenátu', 'špenát');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'cs', 2, 1, 'ks', 'banánu', 'banán');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'cs', 3, 0.5, 'ks', 'jablka', 'jablko');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'cs', 4, 150, 'g', 'bílého jogurtu', 'jogurt');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'cs', 5, NULL, NULL, 'trochu vody', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('zelene-smoothie', 'en', 'Green smoothie', 'A quick breakfast on the go. You won''t taste the spinach, promise.', '[{"text":"Put everything in a blender."},{"text":"Blend until smooth, adding water as needed."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'en', 1, NULL, NULL, 'a handful of baby spinach', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'en', 2, 1, 'pc', 'banana', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'en', 3, 0.5, 'pc', 'apple', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'en', 4, 150, 'g', 'plain yoghurt', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('zelene-smoothie', 'en', 5, NULL, NULL, 'a little water', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('zelene-smoothie', 'mleko');

-- Ledový čaj s mátou a citronem
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('ledovy-caj-s-matou', 'napoje', 'ukazka', 10, 4, 40, ARRAY['svacina'], NULL, false, 'sklenice', 16);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ledovy-caj-s-matou', 'cs', 'Ledový čaj s mátou a citronem', 'Domácí ledový čaj bez kupovaného sirupu. Sladkost si určíš sama.', '[{"text":"Čaj zalij horkou vodou a nech 4 minuty louhovat."},{"text":"Vyndej sáčky, vmíchej med a nech vychladnout."},{"text":"Přidej citron, mátu a led."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'cs', 1, 1, 'l', 'vody', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'cs', 2, 3, 'sáčky', 'zeleného nebo černého čaje', 'čaj');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'cs', 3, 1, 'ks', 'citronu', 'citron');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'cs', 4, 1, 'lžíce', 'medu', 'med');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'cs', 5, NULL, NULL, 'hrst máty, led', 'máta');
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ledovy-caj-s-matou', 'en', 'Iced tea with mint and lemon', 'Homemade iced tea without bought syrup. You decide how sweet it is.', '[{"text":"Pour hot water over the tea and steep for 4 minutes."},{"text":"Remove the bags, stir in honey and let it cool."},{"text":"Add lemon, mint and ice."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'en', 1, 1, 'l', 'water', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'en', 2, 3, 'bags', 'green or black tea', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'en', 3, 1, 'pc', 'lemon', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'en', 4, 1, 'tbsp', 'honey', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('ledovy-caj-s-matou', 'en', 5, NULL, NULL, 'a handful of mint, ice', NULL);

-- Latte s ovesným mlékem
INSERT INTO recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi) VALUES ('latte-s-ovesnym-mlekem', 'napoje', 'ukazka', 5, 1, 120, ARRAY['snidane', 'svacina'], NULL, false, 'sklenice', 17);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('latte-s-ovesnym-mlekem', 'cs', 'Latte s ovesným mlékem', 'Kavárenské latte doma za 5 minut.', '[{"text":"Připrav espresso."},{"text":"Mléko ohřej a napěň (stačí uzavřená sklenice a pořádné protřepání)."},{"text":"Nalij mléko do kávy a posyp skořicí."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('latte-s-ovesnym-mlekem', 'cs', 1, 1, 'dvojité', 'espresso', 'káva');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('latte-s-ovesnym-mlekem', 'cs', 2, 200, 'ml', 'ovesného mléka', 'rostlinné mléko');
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('latte-s-ovesnym-mlekem', 'cs', 3, NULL, NULL, 'skořice (nepovinně)', NULL);
INSERT INTO recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('latte-s-ovesnym-mlekem', 'en', 'Oat milk latte', 'A café-style latte at home in 5 minutes.', '[{"text":"Make the espresso."},{"text":"Warm and froth the milk (a closed jar and a good shake will do)."},{"text":"Pour the milk into the coffee and sprinkle with cinnamon."}]'::jsonb, NULL, NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('latte-s-ovesnym-mlekem', 'en', 1, 1, 'double', 'espresso', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('latte-s-ovesnym-mlekem', 'en', 2, 200, 'ml', 'oat milk', NULL);
INSERT INTO suroviny (recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) VALUES ('latte-s-ovesnym-mlekem', 'en', 3, NULL, NULL, 'cinnamon (optional)', NULL);
INSERT INTO recepty_alergeny (recept, alergen) VALUES ('latte-s-ovesnym-mlekem', 'lepek');

-- Jez s radostí, ne s výčitkami
INSERT INTO clanky (slug, cteni_min, cile, zdroje, poradi) VALUES ('jez-bez-vycitek', 3, ARRAY['vse'], '[{"nazev":"Westenhoefer a kol. 1999 – přísná a flexibilní kontrola jídla","url":"https://doi.org/10.1002/(sici)1098-108x(199907)26:1%3C53::aid-eat7%3E3.0.co;2-n"},{"nazev":"Simpson a Mazzeo 2017 – počítání kalorií a starosti kolem jídla","url":"https://doi.org/10.1016/j.eatbeh.2017.02.002"}]'::jsonb, 1);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('jez-bez-vycitek', 'cs', 'Jez s radostí, ne s výčitkami', 'Proč nemusíš zapisovat každé sousto a proč si sladkou tečku klidně dát.', '["Lidé, kteří se hlídají flexibilně, mají podle výzkumu lepší výsledky než ti, kdo si všechno zakazují.","Zapisování každého sousta může u části lidí přidat starosti kolem jídla.","Plánuj dopředu, odškrtej, co jsi snědla, a sladkou tečku ber jako součást plánu."]'::jsonb, '[{"h":"Zákazy nefungují"},{"p":"Velká studie s více než 54 tisíci lidmi rozlišila dva přístupy. Přísná kontrola („nikdy žádnou čokoládu“) souvisela s častějším přejídáním. Flexibilní kontrola („klidně si dám, jen míň“) souvisela s nižší váhou a úspěšnějším hubnutím."},{"h":"Zapisování není pro každého"},{"p":"Studie u vysokoškoláků zjistila, že lidé, kteří si počítají kalorie v appce, mají víc starostí kolem jídla. Neznamená to, že appka škodí každému. Jen že to jde i jinak."},{"h":"Jak na to v praxi"},{"ul":["Naplánuj si den nebo týden dopředu.","Místo zapisování jen odškrtni, co jsi snědla.","Sladkou tečku si dej, ideálně do zhruba 10 % denního příjmu (doporučení WHO pro přidaný cukr)."]},{"p":"Nejde o lékařskou radu. Pokud tě jídlo trápí víc, než bys chtěla, obrať se na odborníka."}]'::jsonb);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('jez-bez-vycitek', 'en', 'Eat with joy, not with guilt', 'Why you don''t need to log every bite and why a sweet treat is fine.', '["Research suggests flexible eaters do better than people who ban foods completely.","Logging every bite can add food-related worries for some people.","Plan ahead, tick off what you ate, and treat dessert as part of the plan."]'::jsonb, '[{"h":"Bans don''t work"},{"p":"A large study of more than 54,000 people compared two approaches. Rigid control (\"never any chocolate\") was linked to more overeating. Flexible control (\"I''ll have some, just less\") was linked to lower weight and more successful weight loss."},{"h":"Logging isn''t for everyone"},{"p":"A study of university students found that people who count calories in apps report more food-related worries. It doesn''t mean apps harm everyone, just that there is another way."},{"h":"In practice"},{"ul":["Plan your day or week ahead.","Instead of logging, just tick off what you ate.","Have your sweet treat, ideally within about 10% of your daily intake (WHO advice on added sugar)."]},{"p":"This is not medical advice. If food worries you more than you''d like, talk to a professional."}]'::jsonb);

-- Kolik toho vlastně sníst?
INSERT INTO clanky (slug, cteni_min, cile, zdroje, poradi) VALUES ('kolik-toho-snist', 5, ARRAY['vse'], '[{"nazev":"Mifflin a kol. 1990 – rovnice pro výpočet bazálního metabolismu","url":"https://doi.org/10.1093/ajcn/51.2.241"},{"nazev":"ISSN 2017 – bílkoviny a pohyb","url":"https://doi.org/10.1186/s12970-017-0177-8"}]'::jsonb, 2);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('kolik-toho-snist', 'cs', 'Kolik toho vlastně sníst?', 'Co znamená BMR a TDEE a jak čísla z kalkulačky převést do běžného dne.', '["BMR je energie pro tělo v klidu. Pod ni by příjem dlouhodobě klesat neměl.","TDEE je celodenní výdej včetně práce a sportu. Když jíš zhruba tolik, váha se drží.","Při hubnutí stačí mírný deficit, při nabírání mírný přebytek a dost bílkovin."]'::jsonb, '[{"h":"Spočítej si to"},{"p":"Kalkulačka v naší appce počítá podle Mifflin-St Jeorovy rovnice, která se běžně používá jako dobrý odhad pro dospělé. Je to orientační výpočet, ne lékařská rada."},{"h":"BMR – bazální metabolismus"},{"p":"Energie, kterou tělo spotřebuje v klidu na dýchání, srdce a mozek. Ber ji jako spodní hranici: ani při hubnutí by příjem dlouhodobě neměl klesnout pod BMR."},{"h":"TDEE – celkový denní výdej"},{"p":"BMR plus všechen pohyb. Kdo je celý den na nohou a večer ještě sportuje, má výdej výrazně vyšší než člověk v kanceláři."},{"h":"Jak s čísly pracovat"},{"ul":["Hubnutí: jez o něco méně než TDEE, nikdy ne pod BMR.","Udržení: jez zhruba tolik, kolik je TDEE.","Nabírání: mírný přebytek a bílkoviny. Pro aktivní lidi se doporučuje 1,4 až 2,0 g bílkovin na kg váhy denně.","Sacharidy nejsou nepřítel: po náročném dni a tréninku doplňují energii."]}]'::jsonb);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('kolik-toho-snist', 'en', 'How much should I actually eat?', 'What BMR and TDEE mean and how to turn calculator numbers into a normal day.', '["BMR is the energy your body uses at rest. Your intake shouldn''t stay below it for long.","TDEE is your whole-day energy use including work and sport. Eat about that much and your weight stays steady.","To lose weight, a mild deficit is enough. To build muscle, a mild surplus and enough protein."]'::jsonb, '[{"h":"Work it out"},{"p":"The calculator in our app uses the Mifflin-St Jeor equation, a common estimate for adults. It''s a guide, not medical advice."},{"h":"BMR – basal metabolic rate"},{"p":"The energy your body uses at rest for breathing, heart and brain. Treat it as a floor: even when losing weight, your intake shouldn''t stay below BMR for long."},{"h":"TDEE – total daily energy expenditure"},{"p":"BMR plus all your movement. Someone on their feet all day who also trains in the evening burns much more than an office worker."},{"h":"Using the numbers"},{"ul":["Losing weight: eat a bit less than TDEE, never below BMR.","Maintaining: eat about your TDEE.","Building muscle: a mild surplus plus protein. For active people, 1.4 to 2.0 g of protein per kg of body weight per day is recommended.","Carbs aren''t the enemy: they refuel you after a hard day and training."]}]'::jsonb);

-- Když přijdeš domů unavená
INSERT INTO clanky (slug, cteni_min, cile, zdroje, poradi) VALUES ('kdyz-prijdes-domu-unavena', 2, ARRAY['vse'], '[]'::jsonb, 3);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('kdyz-prijdes-domu-unavena', 'cs', 'Když přijdeš domů unavená', 'Záchranná lednice: jak mít doma základ, ze kterého do 15 minut uvaříš večeři.', '["Měj v lednici tři stavební kameny: rychlé bílkoviny, zeleninu a sacharidy, dochucení.","Z nich složíš pět různých večeří podle nálady.","Pomůže i jeden základ uvařený dopředu na víc dní."]'::jsonb, '[{"p":"Když dorazíš domů po celém dni na nohou, poslední, na co máš chuť, je vymýšlet složité recepty. Tajemství klidného večera je chytře zásobená „záchranná lednice“."},{"h":"Tři stavební kameny"},{"ul":["Rychlé bílkoviny: mleté maso, vejce, sýr. Hotové za chvilku.","Zelenina a sacharidy: cuketa, předvařené brambory, luštěniny. Dodají objem a vlákninu.","Dochucení: piniové oříšky, bylinky, oblíbené koření. I obyčejné jídlo rázem oživí."]},{"h":"Vyzkoušej to"},{"p":"Koláč od Niky je přesně takový záchranný recept: z mletého masa, cukety a brambor, a vydrží 3 dny."}]'::jsonb);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('kdyz-prijdes-domu-unavena', 'en', 'When you come home tired', 'The rescue fridge: how to keep a base at home for a 15-minute dinner.', '["Keep three building blocks: quick protein, vegetables and carbs, and flavour.","Combine them into five different dinners depending on your mood.","One base cooked ahead for several days helps too."]'::jsonb, '[{"p":"When you get home after a whole day on your feet, the last thing you want is a complicated recipe. The secret to a calm evening is a well-stocked \"rescue fridge\"."},{"h":"Three building blocks"},{"ul":["Quick protein: mince, eggs, cheese. Ready in no time.","Vegetables and carbs: courgette, pre-cooked potatoes, pulses. They add volume and fibre.","Flavour: pine nuts, herbs, your favourite spices. They liven up even a simple meal."]},{"h":"Try it"},{"p":"Niky''s Pie is exactly that kind of rescue recipe: mince, courgette and potatoes, and it keeps for 3 days."}]'::jsonb);

-- Proč po některém jídle hned hladovíš
INSERT INTO clanky (slug, cteni_min, cile, zdroje, poradi) VALUES ('proc-po-nekterem-jidle-hladovis', 2, ARRAY['hubnout', 'udrzet'], '[]'::jsonb, 4);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('proc-po-nekterem-jidle-hladovis', 'cs', 'Proč po některém jídle hned hladovíš', 'Dvě jídla se stejnými kaloriemi tě můžou zasytit úplně jinak.', '["Nejde jen o kalorie, ale i o to, jak dlouho jídlo zasytí.","Pomáhají bílkoviny, vláknina a trocha tuku.","Po sladké svačině máš za hodinu hlad, po poctivém jídle vydržíš."]'::jsonb, '[{"p":"Většina lidí řeší jen kalorie. Ale dvě jídla se stejným počtem kalorií tě můžou zasytit úplně jinak."},{"h":"Trojkombinace, která drží"},{"ul":["Bílkoviny: tráví se déle a zasytí.","Vláknina, třeba ze zeleniny a luštěnin: zvětší objem jídla bez zbytečných kalorií.","Trocha tuku: zpomalí trávení, takže sytost vydrží déle."]},{"p":"Výsledek? Žádný vlčí hlad v půlce směny, ale rovnoměrná energie."}]'::jsonb);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('proc-po-nekterem-jidle-hladovis', 'en', 'Why some meals leave you hungry straight away', 'Two meals with the same calories can fill you up very differently.', '["It''s not just calories, it''s how long a meal keeps you full.","Protein, fibre and a little fat help.","After a sugary snack you''re hungry in an hour; a proper meal lasts."]'::jsonb, '[{"p":"Most people only think about calories. But two meals with the same calories can fill you up very differently."},{"h":"A combination that lasts"},{"ul":["Protein: digests slowly and fills you up.","Fibre, e.g. from vegetables and pulses: adds volume without extra calories.","A little fat: slows digestion so you stay full longer."]},{"p":"The result? No ravenous hunger halfway through your shift, just steady energy."}]'::jsonb);

-- Jídlo po tréninku
INSERT INTO clanky (slug, cteni_min, cile, zdroje, poradi) VALUES ('traveni-po-treninku', 1, ARRAY['udrzet', 'nabrat'], '[{"nazev":"ISSN 2017 – bílkoviny a pohyb","url":"https://doi.org/10.1186/s12970-017-0177-8"}]'::jsonb, 5);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('traveni-po-treninku', 'cs', 'Jídlo po tréninku', 'Co sníst po sportu, aby se tělo dobře zotavilo a žaludek netrpěl.', '["Hned po tréninku nezatěžuj žaludek těžkým jídlem.","Dej si lehce stravitelné bílkoviny a sacharidy.","Na jedno jídlo se doporučuje zhruba 20 až 40 g bílkovin."]'::jsonb, '[{"h":"Dej tělu chvíli klid"},{"p":"Po tréninku nebo plavání je krev v pracujících svalech. Začni lehce: tekutiny, vývar, šetrné sacharidy."},{"h":"Kvalitní bílkoviny"},{"p":"Pro regeneraci sáhni po lehce stravitelných zdrojích: drůbež, vejce, mléčné výrobky. Odborná společnost pro sportovní výživu doporučuje na jedno jídlo zhruba 20 až 40 g bílkovin."}]'::jsonb);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('traveni-po-treninku', 'en', 'Eating after training', 'What to eat after sport so your body recovers well and your stomach stays happy.', '["Don''t load your stomach with a heavy meal right after training.","Go for easily digestible protein and carbs.","About 20 to 40 g of protein per meal is recommended."]'::jsonb, '[{"h":"Give your body a moment"},{"p":"After training or swimming, blood is in your working muscles. Start light: fluids, broth, gentle carbs."},{"h":"Quality protein"},{"p":"For recovery, choose easily digestible sources: poultry, eggs, dairy. The International Society of Sports Nutrition recommends about 20 to 40 g of protein per meal."}]'::jsonb);

-- Ovoce a bylinky v domácích nápojích
INSERT INTO clanky (slug, cteni_min, cile, zdroje, poradi) VALUES ('bylinky-a-ovoce-v-napojich', 2, ARRAY['vse'], '[]'::jsonb, 6);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('bylinky-a-ovoce-v-napojich', 'cs', 'Ovoce a bylinky v domácích nápojích', 'Domácí limonády bez kupovaných sirupů. Sladkost i chuť máš ve svých rukou.', '["Doma víš, co do nápoje dáváš, a sladíš jen tolik, kolik chceš.","Bylinky před přidáním promni, uvolní vůni.","Kombinuj citrusy s mátou, bazalkou nebo rozmarýnem."]'::jsonb, '[{"p":"Kupované limonády bývají plné cukru. Doma si nápoj osladíš přesně podle sebe, třeba lžičkou medu."},{"h":"Tipy pro dokonalou chuť"},{"ul":["Bylinky před přidáním lehce promni v prstech, uvolní se vůně.","Citrusy se skvěle hodí k mátě, bazalce i rozmarýnu.","Po sportu stačí voda s citronem a špetkou soli."]}]'::jsonb);
INSERT INTO clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('bylinky-a-ovoce-v-napojich', 'en', 'Fruit and herbs in homemade drinks', 'Homemade lemonades without bought syrups. Sweetness and flavour are up to you.', '["At home you know what goes in, and you sweeten only as much as you like.","Rub herbs before adding them to release the aroma.","Pair citrus with mint, basil or rosemary."]'::jsonb, '[{"p":"Shop-bought lemonades are often full of sugar. At home you sweeten your drink to taste, for example with a teaspoon of honey."},{"h":"Tips for great flavour"},{"ul":["Rub herbs lightly between your fingers before adding them to release the aroma.","Citrus goes well with mint, basil and rosemary.","After sport, water with lemon and a pinch of salt is enough."]}]'::jsonb);

-- Propojení receptů a článků
INSERT INTO recepty_clanky (recept, clanek) VALUES
  ('bananovy-chlebicek', 'jez-bez-vycitek'),
  ('cockovy-salat-s-fetou', 'proc-po-nekterem-jidle-hladovis'),
  ('datlove-kulicky', 'jez-bez-vycitek'),
  ('ginger-shot', 'bylinky-a-ovoce-v-napojich'),
  ('jogurtovy-ovocny-pohar', 'bylinky-a-ovoce-v-napojich'),
  ('jogurtovy-ovocny-pohar', 'jez-bez-vycitek'),
  ('kolac-od-niky', 'kdyz-prijdes-domu-unavena'),
  ('kolac-od-niky', 'kolik-toho-snist'),
  ('kureci-salat-s-quinoou', 'kolik-toho-snist'),
  ('kureci-salat-s-quinoou', 'traveni-po-treninku'),
  ('ledova-kava-s-vanilkou', 'bylinky-a-ovoce-v-napojich'),
  ('ledovy-caj-s-matou', 'bylinky-a-ovoce-v-napojich'),
  ('okurkova-limonada', 'bylinky-a-ovoce-v-napojich'),
  ('omeleta-se-zeleninou', 'kdyz-prijdes-domu-unavena'),
  ('ovesna-kase-s-jablkem', 'proc-po-nekterem-jidle-hladovis'),
  ('pecena-zelenina-s-quinoou', 'jez-bez-vycitek'),
  ('pecena-zelenina-s-quinoou', 'kdyz-prijdes-domu-unavena'),
  ('pecena-zelenina-s-quinoou', 'kolik-toho-snist'),
  ('pecena-zelenina-s-quinoou', 'proc-po-nekterem-jidle-hladovis'),
  ('tvarohova-pomazanka', 'proc-po-nekterem-jidle-hladovis'),
  ('tvarohovy-dezert-s-jahodami', 'jez-bez-vycitek'),
  ('zelene-smoothie', 'traveni-po-treninku');
