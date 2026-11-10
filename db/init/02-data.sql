--
-- PostgreSQL database dump
--

\restrict R6chT1zyU1GrgWItGb0ajtOzVz0Qk4imytAAcGdAZP3agaD0dHDUFBSLrdJUw6e

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: alergeny; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.alergeny (kod, cs, en) VALUES ('lepek', 'lepek', 'gluten');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('korysi', 'korýši', 'crustaceans');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('vejce', 'vejce', 'eggs');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('ryby', 'ryby', 'fish');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('arasidy', 'arašídy', 'peanuts');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('soja', 'sója', 'soy');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('mleko', 'mléko', 'milk');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('orechy', 'ořechy', 'tree nuts');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('celer', 'celer', 'celery');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('horcice', 'hořčice', 'mustard');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('sezam', 'sezam', 'sesame');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('siricitany', 'oxid siřičitý a siřičitany', 'sulphites');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('vlcibob', 'vlčí bob', 'lupin');
INSERT INTO public.alergeny (kod, cs, en) VALUES ('mekkysi', 'měkkýši', 'molluscs');


--
-- Data for Name: clanky; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.clanky (slug, cteni_min, cile, zdroje, poradi, zverejneno, vytvoreno, upraveno) VALUES ('jez-bez-vycitek', 3, '{vse}', '[{"url": "https://doi.org/10.1002/(sici)1098-108x(199907)26:1%3C53::aid-eat7%3E3.0.co;2-n", "nazev": "Westenhoefer a kol. 1999 – přísná a flexibilní kontrola jídla"}, {"url": "https://doi.org/10.1016/j.eatbeh.2017.02.002", "nazev": "Simpson a Mazzeo 2017 – počítání kalorií a starosti kolem jídla"}]', 1, true, '2026-11-07 14:57:43.670343+00', '2026-11-07 14:57:43.670343+00');
INSERT INTO public.clanky (slug, cteni_min, cile, zdroje, poradi, zverejneno, vytvoreno, upraveno) VALUES ('kolik-toho-snist', 5, '{vse}', '[{"url": "https://doi.org/10.1093/ajcn/51.2.241", "nazev": "Mifflin a kol. 1990 – rovnice pro výpočet bazálního metabolismu"}, {"url": "https://doi.org/10.1186/s12970-017-0177-8", "nazev": "ISSN 2017 – bílkoviny a pohyb"}]', 2, true, '2026-11-07 14:57:43.676448+00', '2026-11-07 14:57:43.676448+00');
INSERT INTO public.clanky (slug, cteni_min, cile, zdroje, poradi, zverejneno, vytvoreno, upraveno) VALUES ('kdyz-prijdes-domu-unavena', 2, '{vse}', '[]', 3, true, '2026-11-07 14:57:43.681667+00', '2026-11-07 14:57:43.681667+00');
INSERT INTO public.clanky (slug, cteni_min, cile, zdroje, poradi, zverejneno, vytvoreno, upraveno) VALUES ('proc-po-nekterem-jidle-hladovis', 2, '{hubnout,udrzet}', '[]', 4, true, '2026-11-07 14:57:43.685441+00', '2026-11-07 14:57:43.685441+00');
INSERT INTO public.clanky (slug, cteni_min, cile, zdroje, poradi, zverejneno, vytvoreno, upraveno) VALUES ('traveni-po-treninku', 1, '{udrzet,nabrat}', '[{"url": "https://doi.org/10.1186/s12970-017-0177-8", "nazev": "ISSN 2017 – bílkoviny a pohyb"}]', 5, true, '2026-11-07 14:57:43.689336+00', '2026-11-07 14:57:43.689336+00');
INSERT INTO public.clanky (slug, cteni_min, cile, zdroje, poradi, zverejneno, vytvoreno, upraveno) VALUES ('bylinky-a-ovoce-v-napojich', 2, '{vse}', '[]', 6, true, '2026-11-07 14:57:43.693598+00', '2026-11-07 14:57:43.693598+00');


--
-- Data for Name: clanky_texty; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('jez-bez-vycitek', 'cs', 'Jez s radostí, ne s výčitkami', 'Proč nemusíš zapisovat každé sousto a proč si sladkou tečku klidně dát.', '["Lidé, kteří se hlídají flexibilně, mají podle výzkumu lepší výsledky než ti, kdo si všechno zakazují.", "Zapisování každého sousta může u části lidí přidat starosti kolem jídla.", "Plánuj dopředu, odškrtej, co jsi snědla, a sladkou tečku ber jako součást plánu."]', '[{"h": "Zákazy nefungují"}, {"p": "Velká studie s více než 54 tisíci lidmi rozlišila dva přístupy. Přísná kontrola („nikdy žádnou čokoládu“) souvisela s častějším přejídáním. Flexibilní kontrola („klidně si dám, jen míň“) souvisela s nižší váhou a úspěšnějším hubnutím."}, {"h": "Zapisování není pro každého"}, {"p": "Studie u vysokoškoláků zjistila, že lidé, kteří si počítají kalorie v appce, mají víc starostí kolem jídla. Neznamená to, že appka škodí každému. Jen že to jde i jinak."}, {"h": "Jak na to v praxi"}, {"ul": ["Naplánuj si den nebo týden dopředu.", "Místo zapisování jen odškrtni, co jsi snědla.", "Sladkou tečku si dej, ideálně do zhruba 10 % denního příjmu (doporučení WHO pro přidaný cukr)."]}, {"p": "Nejde o lékařskou radu. Pokud tě jídlo trápí víc, než bys chtěla, obrať se na odborníka."}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('jez-bez-vycitek', 'en', 'Eat with joy, not with guilt', 'Why you don''t need to log every bite and why a sweet treat is fine.', '["Research suggests flexible eaters do better than people who ban foods completely.", "Logging every bite can add food-related worries for some people.", "Plan ahead, tick off what you ate, and treat dessert as part of the plan."]', '[{"h": "Bans don''t work"}, {"p": "A large study of more than 54,000 people compared two approaches. Rigid control (\"never any chocolate\") was linked to more overeating. Flexible control (\"I''ll have some, just less\") was linked to lower weight and more successful weight loss."}, {"h": "Logging isn''t for everyone"}, {"p": "A study of university students found that people who count calories in apps report more food-related worries. It doesn''t mean apps harm everyone, just that there is another way."}, {"h": "In practice"}, {"ul": ["Plan your day or week ahead.", "Instead of logging, just tick off what you ate.", "Have your sweet treat, ideally within about 10% of your daily intake (WHO advice on added sugar)."]}, {"p": "This is not medical advice. If food worries you more than you''d like, talk to a professional."}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('kolik-toho-snist', 'cs', 'Kolik toho vlastně sníst?', 'Co znamená BMR a TDEE a jak čísla z kalkulačky převést do běžného dne.', '["BMR je energie pro tělo v klidu. Pod ni by příjem dlouhodobě klesat neměl.", "TDEE je celodenní výdej včetně práce a sportu. Když jíš zhruba tolik, váha se drží.", "Při hubnutí stačí mírný deficit, při nabírání mírný přebytek a dost bílkovin."]', '[{"h": "Spočítej si to"}, {"p": "Kalkulačka v naší appce počítá podle Mifflin-St Jeorovy rovnice, která se běžně používá jako dobrý odhad pro dospělé. Je to orientační výpočet, ne lékařská rada."}, {"h": "BMR – bazální metabolismus"}, {"p": "Energie, kterou tělo spotřebuje v klidu na dýchání, srdce a mozek. Ber ji jako spodní hranici: ani při hubnutí by příjem dlouhodobě neměl klesnout pod BMR."}, {"h": "TDEE – celkový denní výdej"}, {"p": "BMR plus všechen pohyb. Kdo je celý den na nohou a večer ještě sportuje, má výdej výrazně vyšší než člověk v kanceláři."}, {"h": "Jak s čísly pracovat"}, {"ul": ["Hubnutí: jez o něco méně než TDEE, nikdy ne pod BMR.", "Udržení: jez zhruba tolik, kolik je TDEE.", "Nabírání: mírný přebytek a bílkoviny. Pro aktivní lidi se doporučuje 1,4 až 2,0 g bílkovin na kg váhy denně.", "Sacharidy nejsou nepřítel: po náročném dni a tréninku doplňují energii."]}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('kolik-toho-snist', 'en', 'How much should I actually eat?', 'What BMR and TDEE mean and how to turn calculator numbers into a normal day.', '["BMR is the energy your body uses at rest. Your intake shouldn''t stay below it for long.", "TDEE is your whole-day energy use including work and sport. Eat about that much and your weight stays steady.", "To lose weight, a mild deficit is enough. To build muscle, a mild surplus and enough protein."]', '[{"h": "Work it out"}, {"p": "The calculator in our app uses the Mifflin-St Jeor equation, a common estimate for adults. It''s a guide, not medical advice."}, {"h": "BMR – basal metabolic rate"}, {"p": "The energy your body uses at rest for breathing, heart and brain. Treat it as a floor: even when losing weight, your intake shouldn''t stay below BMR for long."}, {"h": "TDEE – total daily energy expenditure"}, {"p": "BMR plus all your movement. Someone on their feet all day who also trains in the evening burns much more than an office worker."}, {"h": "Using the numbers"}, {"ul": ["Losing weight: eat a bit less than TDEE, never below BMR.", "Maintaining: eat about your TDEE.", "Building muscle: a mild surplus plus protein. For active people, 1.4 to 2.0 g of protein per kg of body weight per day is recommended.", "Carbs aren''t the enemy: they refuel you after a hard day and training."]}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('kdyz-prijdes-domu-unavena', 'cs', 'Když přijdeš domů unavená', 'Záchranná lednice: jak mít doma základ, ze kterého do 15 minut uvaříš večeři.', '["Měj v lednici tři stavební kameny: rychlé bílkoviny, zeleninu a sacharidy, dochucení.", "Z nich složíš pět různých večeří podle nálady.", "Pomůže i jeden základ uvařený dopředu na víc dní."]', '[{"p": "Když dorazíš domů po celém dni na nohou, poslední, na co máš chuť, je vymýšlet složité recepty. Tajemství klidného večera je chytře zásobená „záchranná lednice“."}, {"h": "Tři stavební kameny"}, {"ul": ["Rychlé bílkoviny: mleté maso, vejce, sýr. Hotové za chvilku.", "Zelenina a sacharidy: cuketa, předvařené brambory, luštěniny. Dodají objem a vlákninu.", "Dochucení: piniové oříšky, bylinky, oblíbené koření. I obyčejné jídlo rázem oživí."]}, {"h": "Vyzkoušej to"}, {"p": "Koláč od Niky je přesně takový záchranný recept: z mletého masa, cukety a brambor, a vydrží 3 dny."}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('kdyz-prijdes-domu-unavena', 'en', 'When you come home tired', 'The rescue fridge: how to keep a base at home for a 15-minute dinner.', '["Keep three building blocks: quick protein, vegetables and carbs, and flavour.", "Combine them into five different dinners depending on your mood.", "One base cooked ahead for several days helps too."]', '[{"p": "When you get home after a whole day on your feet, the last thing you want is a complicated recipe. The secret to a calm evening is a well-stocked \"rescue fridge\"."}, {"h": "Three building blocks"}, {"ul": ["Quick protein: mince, eggs, cheese. Ready in no time.", "Vegetables and carbs: courgette, pre-cooked potatoes, pulses. They add volume and fibre.", "Flavour: pine nuts, herbs, your favourite spices. They liven up even a simple meal."]}, {"h": "Try it"}, {"p": "Niky''s Pie is exactly that kind of rescue recipe: mince, courgette and potatoes, and it keeps for 3 days."}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('proc-po-nekterem-jidle-hladovis', 'cs', 'Proč po některém jídle hned hladovíš', 'Dvě jídla se stejnými kaloriemi tě můžou zasytit úplně jinak.', '["Nejde jen o kalorie, ale i o to, jak dlouho jídlo zasytí.", "Pomáhají bílkoviny, vláknina a trocha tuku.", "Po sladké svačině máš za hodinu hlad, po poctivém jídle vydržíš."]', '[{"p": "Většina lidí řeší jen kalorie. Ale dvě jídla se stejným počtem kalorií tě můžou zasytit úplně jinak."}, {"h": "Trojkombinace, která drží"}, {"ul": ["Bílkoviny: tráví se déle a zasytí.", "Vláknina, třeba ze zeleniny a luštěnin: zvětší objem jídla bez zbytečných kalorií.", "Trocha tuku: zpomalí trávení, takže sytost vydrží déle."]}, {"p": "Výsledek? Žádný vlčí hlad v půlce směny, ale rovnoměrná energie."}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('proc-po-nekterem-jidle-hladovis', 'en', 'Why some meals leave you hungry straight away', 'Two meals with the same calories can fill you up very differently.', '["It''s not just calories, it''s how long a meal keeps you full.", "Protein, fibre and a little fat help.", "After a sugary snack you''re hungry in an hour; a proper meal lasts."]', '[{"p": "Most people only think about calories. But two meals with the same calories can fill you up very differently."}, {"h": "A combination that lasts"}, {"ul": ["Protein: digests slowly and fills you up.", "Fibre, e.g. from vegetables and pulses: adds volume without extra calories.", "A little fat: slows digestion so you stay full longer."]}, {"p": "The result? No ravenous hunger halfway through your shift, just steady energy."}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('traveni-po-treninku', 'cs', 'Jídlo po tréninku', 'Co sníst po sportu, aby se tělo dobře zotavilo a žaludek netrpěl.', '["Hned po tréninku nezatěžuj žaludek těžkým jídlem.", "Dej si lehce stravitelné bílkoviny a sacharidy.", "Na jedno jídlo se doporučuje zhruba 20 až 40 g bílkovin."]', '[{"h": "Dej tělu chvíli klid"}, {"p": "Po tréninku nebo plavání je krev v pracujících svalech. Začni lehce: tekutiny, vývar, šetrné sacharidy."}, {"h": "Kvalitní bílkoviny"}, {"p": "Pro regeneraci sáhni po lehce stravitelných zdrojích: drůbež, vejce, mléčné výrobky. Odborná společnost pro sportovní výživu doporučuje na jedno jídlo zhruba 20 až 40 g bílkovin."}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('traveni-po-treninku', 'en', 'Eating after training', 'What to eat after sport so your body recovers well and your stomach stays happy.', '["Don''t load your stomach with a heavy meal right after training.", "Go for easily digestible protein and carbs.", "About 20 to 40 g of protein per meal is recommended."]', '[{"h": "Give your body a moment"}, {"p": "After training or swimming, blood is in your working muscles. Start light: fluids, broth, gentle carbs."}, {"h": "Quality protein"}, {"p": "For recovery, choose easily digestible sources: poultry, eggs, dairy. The International Society of Sports Nutrition recommends about 20 to 40 g of protein per meal."}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('bylinky-a-ovoce-v-napojich', 'cs', 'Ovoce a bylinky v domácích nápojích', 'Domácí limonády bez kupovaných sirupů. Sladkost i chuť máš ve svých rukou.', '["Doma víš, co do nápoje dáváš, a sladíš jen tolik, kolik chceš.", "Bylinky před přidáním promni, uvolní vůni.", "Kombinuj citrusy s mátou, bazalkou nebo rozmarýnem."]', '[{"p": "Kupované limonády bývají plné cukru. Doma si nápoj osladíš přesně podle sebe, třeba lžičkou medu."}, {"h": "Tipy pro dokonalou chuť"}, {"ul": ["Bylinky před přidáním lehce promni v prstech, uvolní se vůně.", "Citrusy se skvěle hodí k mátě, bazalce i rozmarýnu.", "Po sportu stačí voda s citronem a špetkou soli."]}]');
INSERT INTO public.clanky_texty (clanek, jazyk, nazev, perex, v_kostce, telo) VALUES ('bylinky-a-ovoce-v-napojich', 'en', 'Fruit and herbs in homemade drinks', 'Homemade lemonades without bought syrups. Sweetness and flavour are up to you.', '["At home you know what goes in, and you sweeten only as much as you like.", "Rub herbs before adding them to release the aroma.", "Pair citrus with mint, basil or rosemary."]', '[{"p": "Shop-bought lemonades are often full of sugar. At home you sweeten your drink to taste, for example with a teaspoon of honey."}, {"h": "Tips for great flavour"}, {"ul": ["Rub herbs lightly between your fingers before adding them to release the aroma.", "Citrus goes well with mint, basil and rosemary.", "After sport, water with lemon and a pinch of salt is enough."]}]');


--
-- Data for Name: newsletter; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: slevove_kody; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: objednavky; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: produkty; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.produkty (slug, typ, cena_kc, soubor, aktivni, vytvoreno, cena_puvodni, za_mesic, stav, tecka, barva, ukazka, poradi) VALUES ('startovaci-knizka', 'darek', 0.00, NULL, false, '2026-11-07 17:49:41.244586+00', NULL, false, 'pripravujeme', 'radost', 'honey', '{"recepty": ["ovesna-kase-s-jablkem", "tvarohova-pomazanka", "datlove-kulicky"]}', 1);
INSERT INTO public.produkty (slug, typ, cena_kc, soubor, aktivni, vytvoreno, cena_puvodni, za_mesic, stav, tecka, barva, ukazka, poradi) VALUES ('jeden-zaklad-tri-varianty', 'ebook', 249.00, NULL, false, '2026-11-07 17:49:41.244586+00', NULL, false, 'pripravujeme', 'kolac', 'terra', '{"zaklad": "pecena-zelenina-s-quinoou"}', 3);
INSERT INTO public.produkty (slug, typ, cena_kc, soubor, aktivni, vytvoreno, cena_puvodni, za_mesic, stav, tecka, barva, ukazka, poradi, obrazek) VALUES ('kurz-vareni-dopredu', 'kurz', 690.00, NULL, false, '2026-11-07 17:49:41.244586+00', 990.00, false, 'pripravujeme', 'vari', 'primary', NULL, 4, 'kurz-online');
INSERT INTO public.produkty (slug, typ, cena_kc, soubor, aktivni, vytvoreno, cena_puvodni, za_mesic, stav, tecka, barva, ukazka, poradi, obrazek) VALUES ('kurz-vareni-nazivo', 'kurz', 1290.00, NULL, false, '2026-11-10 09:00:00+00', NULL, false, 'pripravujeme', 'vari', 'terra', NULL, 4, 'kurz-nazivo');
INSERT INTO public.produkty (slug, typ, cena_kc, soubor, aktivni, vytvoreno, cena_puvodni, za_mesic, stav, tecka, barva, ukazka, poradi) VALUES ('online-kucharka', 'predplatne', 129.00, NULL, false, '2026-11-07 17:49:41.244586+00', NULL, true, 'pripravujeme', 'premysli', 'sage', NULL, 5);
INSERT INTO public.produkty (slug, typ, cena_kc, soubor, aktivni, vytvoreno, cena_puvodni, za_mesic, stav, tecka, barva, ukazka, poradi) VALUES ('ebook-pro-starsi', 'ebook', 249.00, NULL, false, '2026-11-07 17:49:41.244586+00', NULL, false, 'pripravujeme', 'ahoj', 'honey', NULL, 6);
INSERT INTO public.produkty (slug, typ, cena_kc, soubor, aktivni, vytvoreno, cena_puvodni, za_mesic, stav, tecka, barva, ukazka, poradi) VALUES ('tydenni-plan', 'plan', 99.00, NULL, false, '2026-11-07 17:49:41.244586+00', NULL, false, 'pripravujeme', 'talir', 'sage', '{"den": [{"jidlo": "snidane", "recept": "ovesna-kase-s-jablkem"}, {"jidlo": "obed", "recept": "pecena-zelenina-s-quinoou"}, {"jidlo": "svacina", "recept": "tvarohovy-dezert-s-jahodami"}, {"jidlo": "vecere", "recept": "omeleta-se-zeleninou"}], "pdf": {"cs": "tydenni-plan-ukazka-cs.pdf", "en": "tydenni-plan-ukazka-en.pdf"}}', 2);


--
-- Data for Name: objednavky_polozky; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: produkty_texty; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('startovaci-knizka', 'cs', 'Startovací knížka', '7 rychlých receptů a nákupní seznam. Dárek za přihlášení k newsletteru.', 'Pro každého, kdo chce začít jíst líp a neví čím.', '["7 receptů do 20 minut z běžných surovin", "Nákupní seznam na všech 7 jídel", "Jak poskládat talíř, aby zasytil", "Tipy od Tečky, jak u toho vydržet"]', 'PDF, asi 15 stran, do mobilu i k tisku');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('startovaci-knizka', 'en', 'Starter booklet', '7 quick recipes and a shopping list. A gift for joining the newsletter.', 'For anyone who wants to start eating better and doesn''t know where to begin.', '["7 recipes ready in 20 minutes from everyday ingredients", "A shopping list for all 7 meals", "How to build a plate that keeps you full", "Tips from Tečka to help you stick with it"]', 'PDF, about 15 pages, for your phone or to print');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('tydenni-plan', 'cs', 'Týdenní jídelní plán', 'Co jíst každý den v týdnu, se seznamem na nákup. Už nemusíš vymýšlet.', 'Pro ty, kdo nechtějí každý den řešit, co uvařit.', '["7 dní snídaní, obědů, svačin a večeří", "Každé jídlo ve 3 variantách: zhubnout, udržet, nabrat", "Vaříš 2–3× týdně, zbytek jen ohřeješ nebo dochutíš", "Nákupní seznam rozdělený podle oddělení v obchodě", "Sladká tečka na každý den"]', 'PDF, asi 20 stran');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('tydenni-plan', 'en', 'Weekly meal plan', 'What to eat every day of the week, with a shopping list. No more guessing.', 'For anyone who doesn''t want to figure out what to cook every day.', '["7 days of breakfasts, lunches, snacks and dinners", "Every meal in 3 versions: lose, maintain, gain", "Cook 2–3 times a week, just reheat or season the rest", "A shopping list sorted by store section", "A sweet treat for every day"]', 'PDF, about 20 pages');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('jeden-zaklad-tri-varianty', 'cs', 'Jeden základ, tři varianty', 'E-book: uvaříš jednou a sníš třikrát jinak. Méně vaření, nic se nevyhodí.', 'Pro rodiny a páry, kde každý chce něco jiného, a pro všechny, kdo vaří dopředu.', '["10 základů (plech zeleniny, kaše, polévka…) a ke každému 3 varianty", "Kolik toho sníst podle tvého cíle, bez počítání", "Jak vařit dopředu na 3 dny", "Alergeny a tipy na náhrady u každého receptu"]', 'PDF, asi 60 stran');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('jeden-zaklad-tri-varianty', 'en', 'One base, three ways', 'E-book: cook once, eat three different meals. Less cooking, no waste.', 'For families and couples who all want something different, and for anyone who cooks ahead.', '["10 bases (tray bake, porridge, soup…) with 3 versions each", "How much to eat for your goal, without counting", "How to cook ahead for 3 days", "Allergens and swaps for every recipe"]', 'PDF, about 60 pages');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('kurz-vareni-dopredu', 'cs', 'Kurz vaření dopředu', '4 týdny se živými online setkáními. Naučíš se za 2 hodiny v neděli navařit na celý týden.', 'Pro ty, kdo nemají čas vařit každý den, ale nechtějí jíst z krabiček z obchodu.', '["4 týdny, každý týden jedno živé online setkání (60 min)", "Nákupní seznam a plán vaření na každou neděli", "Videa krok za krokem, ke kterým se můžeš vrátit", "Skupina, kde se ptáš a sdílíš, co ti jde"]', 'Online, 4 týdny. Zaváděcí cena pro první zájemce.');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('kurz-vareni-dopredu', 'en', 'Cook-ahead course', '4 weeks with live online sessions. Learn to cook for the whole week in 2 hours on Sunday.', 'For anyone without time to cook every day who still doesn''t want store-bought meal boxes.', '["4 weeks, one live online session each week (60 min)", "A shopping list and cooking plan for every Sunday", "Step-by-step videos you can come back to", "A group to ask questions and share your wins"]', 'Online, 4 weeks. Launch price for the first sign-ups.');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('kurz-vareni-nazivo', 'cs', 'Kurz vaření naživo', 'Jedno odpoledne v kuchyni s lektorkou. Vaříte spolu v malé skupině a domů si odneseš jídlo na několik dní.', 'Pro ty, kdo se nejlíp naučí u plotny, s lidmi kolem sebe, a chtějí si všechno hned vyzkoušet.', '["3 hodiny vaření v malé skupině (nejvýš 8 lidí)", "Lektorka ukáže každý krok a ty ho hned zkoušíš", "Uvaříte 3 základy a ke každému varianty: zhubnout, udržet, nabrat", "Suroviny a zástěra v ceně, jídlo si odneseš domů", "Recepty a nákupní seznam v PDF"]', 'Naživo v kuchyňském studiu, 3 hodiny. Cena je za 1 osobu. Místo a termíny pošleme e-mailem.');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('kurz-vareni-nazivo', 'en', 'Live cooking class', 'An afternoon in the kitchen with an instructor. You cook together in a small group and take home food for several days.', 'For anyone who learns best at the stove, with people around, and wants to try everything right away.', '["3 hours of cooking in a small group (8 people max)", "The instructor shows every step and you try it straight away", "Cook 3 bases, each with versions to lose, maintain or gain", "Ingredients and apron included, take the food home", "Recipes and a shopping list as a PDF"]', 'In person in a kitchen studio, 3 hours. Price per person. Place and dates sent by email.');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('online-kucharka', 'cs', 'Online kuchařka', 'Plány a recepty na míru tvému příjmu, přímo v appce Jídlo od A–Z.', 'Pro ty, kdo chtějí plán přesně pro sebe a nové recepty každý měsíc.', '["Jídelní plány podle tvého profilu v appce", "Nové recepty každý měsíc", "Nákupní seznam jedním klikem", "Zrušíš kdykoli"]', 'V appce Jídlo od A–Z, s přihlášením');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('online-kucharka', 'en', 'Online cookbook', 'Plans and recipes tailored to your intake, right in the Jídlo od A–Z app.', 'For anyone who wants a plan made for them and new recipes every month.', '["Meal plans based on your profile in the app", "New recipes every month", "Shopping list in one click", "Cancel anytime"]', 'In the Jídlo od A–Z app, with sign-in');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('ebook-pro-starsi', 'cs', 'Jídlo, které drží v kondici', 'E-book pro starší a jejich blízké. Jednoduchá jídla, která sytí a dobře se jedí. Dá se darovat.', 'Pro starší lidi, kteří nepoužívají appky, a pro jejich děti a vnoučata, kteří jim chtějí pomoct.', '["Proč se s věkem mění chuť k jídlu a co s tím", "Jednoduchá jídla, která se snadno kousají a dobře sytí", "Jak jíst, když člověk vaří jen pro sebe", "Pitný režim a bílkoviny bez složitostí"]', 'PDF, tištěná verze později. Zdravotní část zkontroluje odborník.');
INSERT INTO public.produkty_texty (produkt, jazyk, nazev, popis, pro_koho, obsah, format) VALUES ('ebook-pro-starsi', 'en', 'Food that keeps you going', 'An e-book for older people and their families. Simple meals that fill you up and are easy to eat. Makes a nice gift.', 'For older people who don''t use apps, and for their children and grandchildren who want to help.', '["Why appetite changes with age and what to do about it", "Simple meals that are easy to chew and keep you full", "How to eat well when cooking just for yourself", "Drinking enough and getting protein, made simple"]', 'PDF, print version later. The health section will be reviewed by an expert.');


--
-- Data for Name: recepty; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('pecena-zelenina-s-quinoou', 'slane', 'ukazka', 40, 3, 390, '{obed,vecere}', NULL, false, 'talir', 2, true, '2026-11-07 14:57:43.406909+00', '2026-11-07 14:57:43.406909+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('kureci-salat-s-quinoou', 'slane', 'ukazka', 25, 2, 480, '{obed}', NULL, false, 'talir', 3, true, '2026-11-07 14:57:43.423004+00', '2026-11-07 14:57:43.423004+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('cockovy-salat-s-fetou', 'slane', 'ukazka', 30, 2, 450, '{obed,vecere}', NULL, false, 'talir', 4, true, '2026-11-07 14:57:43.443591+00', '2026-11-07 14:57:43.443591+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('omeleta-se-zeleninou', 'slane', 'ukazka', 15, 1, 300, '{snidane,vecere}', NULL, false, 'talir', 5, true, '2026-11-07 14:57:43.463669+00', '2026-11-07 14:57:43.463669+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('tvarohova-pomazanka', 'slane', 'ukazka', 10, 2, 320, '{snidane,vecere}', NULL, false, 'talir', 6, true, '2026-11-07 14:57:43.481354+00', '2026-11-07 14:57:43.481354+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('ovesna-kase-s-jablkem', 'sladke', 'ukazka', 10, 1, 350, '{snidane}', NULL, false, 'buchta', 7, true, '2026-11-07 14:57:43.496287+00', '2026-11-07 14:57:43.496287+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('bananovy-chlebicek', 'sladke', 'ukazka', 50, 10, 210, '{snidane,svacina}', NULL, false, 'buchta', 8, true, '2026-11-07 14:57:43.513787+00', '2026-11-07 14:57:43.513787+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('tvarohovy-dezert-s-jahodami', 'sladke', 'ukazka', 10, 2, 190, '{svacina}', NULL, false, 'zakusek', 9, true, '2026-11-07 14:57:43.535055+00', '2026-11-07 14:57:43.535055+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('datlove-kulicky', 'sladke', 'ukazka', 15, 4, 180, '{svacina}', NULL, false, 'zakusek', 10, true, '2026-11-07 14:57:43.549698+00', '2026-11-07 14:57:43.549698+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('jogurtovy-ovocny-pohar', 'sladke', 'ukazka', 10, 2, 230, '{snidane,svacina}', NULL, false, 'pohar', 11, true, '2026-11-07 14:57:43.563766+00', '2026-11-07 14:57:43.563766+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('zelene-smoothie', 'napoje', 'ukazka', 5, 1, 150, '{snidane,svacina}', NULL, false, 'sklenice', 15, true, '2026-11-07 14:57:43.622524+00', '2026-11-07 14:57:43.622524+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('ledovy-caj-s-matou', 'napoje', 'ukazka', 10, 4, 40, '{svacina}', NULL, false, 'sklenice', 16, true, '2026-11-07 14:57:43.638074+00', '2026-11-07 14:57:43.638074+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('latte-s-ovesnym-mlekem', 'napoje', 'ukazka', 5, 1, 120, '{snidane,svacina}', NULL, false, 'sklenice', 17, true, '2026-11-07 14:57:43.655094+00', '2026-11-07 14:57:43.655094+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('kolac-od-niky', 'slane', 'niky', 60, 4, 520, '{obed,vecere}', 'kolac-hotovy.webp', true, 'kolac', 1, true, '2026-11-07 14:57:43.376064+00', '2026-11-08 12:27:18.581205+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('ledova-kava-s-vanilkou', 'napoje', 'niky', 5, 1, 100, '{svacina}', NULL, false, 'sklenice', 12, true, '2026-11-07 14:57:43.582509+00', '2026-11-08 12:27:18.581205+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('okurkova-limonada', 'napoje', 'niky', 10, 4, 30, '{svacina}', NULL, false, 'sklenice', 13, true, '2026-11-07 14:57:43.5966+00', '2026-11-08 12:27:18.581205+00');
INSERT INTO public.recepty (slug, kategorie, stav, cas_min, porce, kcal, jidla, obrazek, obrazek_ai, tecka, poradi, zverejneno, vytvoreno, upraveno) VALUES ('ginger-shot', 'napoje', 'niky', 10, 4, 40, '{svacina}', NULL, false, 'sklenice', 14, true, '2026-11-07 14:57:43.607913+00', '2026-11-08 12:27:18.581205+00');


--
-- Data for Name: recepty_alergeny; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('kolac-od-niky', 'vejce');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('kolac-od-niky', 'mleko');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('cockovy-salat-s-fetou', 'mleko');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('omeleta-se-zeleninou', 'vejce');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('omeleta-se-zeleninou', 'mleko');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('tvarohova-pomazanka', 'mleko');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('tvarohova-pomazanka', 'lepek');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('ovesna-kase-s-jablkem', 'lepek');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('ovesna-kase-s-jablkem', 'mleko');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('ovesna-kase-s-jablkem', 'orechy');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('bananovy-chlebicek', 'vejce');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('bananovy-chlebicek', 'lepek');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('bananovy-chlebicek', 'orechy');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('tvarohovy-dezert-s-jahodami', 'mleko');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('datlove-kulicky', 'orechy');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('jogurtovy-ovocny-pohar', 'mleko');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('jogurtovy-ovocny-pohar', 'lepek');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('zelene-smoothie', 'mleko');
INSERT INTO public.recepty_alergeny (recept, alergen) VALUES ('latte-s-ovesnym-mlekem', 'lepek');


--
-- Data for Name: recepty_clanky; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('bananovy-chlebicek', 'jez-bez-vycitek');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('cockovy-salat-s-fetou', 'proc-po-nekterem-jidle-hladovis');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('datlove-kulicky', 'jez-bez-vycitek');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('ginger-shot', 'bylinky-a-ovoce-v-napojich');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('jogurtovy-ovocny-pohar', 'bylinky-a-ovoce-v-napojich');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('jogurtovy-ovocny-pohar', 'jez-bez-vycitek');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('kolac-od-niky', 'kdyz-prijdes-domu-unavena');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('kolac-od-niky', 'kolik-toho-snist');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('kureci-salat-s-quinoou', 'kolik-toho-snist');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('kureci-salat-s-quinoou', 'traveni-po-treninku');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('ledova-kava-s-vanilkou', 'bylinky-a-ovoce-v-napojich');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('ledovy-caj-s-matou', 'bylinky-a-ovoce-v-napojich');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('okurkova-limonada', 'bylinky-a-ovoce-v-napojich');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('omeleta-se-zeleninou', 'kdyz-prijdes-domu-unavena');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('ovesna-kase-s-jablkem', 'proc-po-nekterem-jidle-hladovis');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('pecena-zelenina-s-quinoou', 'jez-bez-vycitek');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('pecena-zelenina-s-quinoou', 'kdyz-prijdes-domu-unavena');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('pecena-zelenina-s-quinoou', 'kolik-toho-snist');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('pecena-zelenina-s-quinoou', 'proc-po-nekterem-jidle-hladovis');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('tvarohova-pomazanka', 'proc-po-nekterem-jidle-hladovis');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('tvarohovy-dezert-s-jahodami', 'jez-bez-vycitek');
INSERT INTO public.recepty_clanky (recept, clanek) VALUES ('zelene-smoothie', 'traveni-po-treninku');


--
-- Data for Name: recepty_texty; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('kolac-od-niky', 'cs', 'Koláč od Niky', 'Rodinná receptura: jemná cuketa, poctivý bramborový základ, táhnoucí se mozzarella, čerstvý špenát a česnek. Bez smetany, a stejně vláčný.', '[{"text": "Troubu předehřej na 180 °C. Smíchej sůl, pepř a majoránku.", "obrazek": "kolac-koreni.webp"}, {"text": "Brambory nakrájej na tenké plátky a vyskládej jimi dno formy.", "obrazek": "kolac-krok-2.webp"}, {"text": "Na brambory rozlož mleté maso promíchané s česnekem a polovinou kořenící směsi.", "obrazek": "kolac-krok-3.webp"}, {"text": "Cuketu nastrouhej, lehce vymačkej a rozprostři na maso.", "obrazek": "kolac-krok-4.webp"}, {"text": "Přidej špenát a natrhanou mozzarellu.", "obrazek": "kolac-krok-5.webp"}, {"text": "Vejce rozšlehej se zbytkem koření, zalij jimi koláč a posyp piniovými oříšky.", "obrazek": "kolac-krok-6.webp"}, {"text": "Peč asi 45 minut, dokud vejce neztuhnou a povrch nezezlátne."}]', NULL, 'Koláč vydrží v lednici 3 dny, takže je skvělý na vaření dopředu. Piniové oříšky nepatří mezi 14 hlavních alergenů EU, ale při alergii na ořechy buď opatrná.');
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('kolac-od-niky', 'en', 'Niky''s Pie', 'A family recipe: tender courgette, a hearty potato base, stretchy mozzarella, fresh spinach and garlic. No cream, and still moist.', '[{"text": "Preheat the oven to 180 °C. Mix salt, pepper and marjoram.", "obrazek": "kolac-koreni.webp"}, {"text": "Slice the potatoes thinly and line the bottom of the dish.", "obrazek": "kolac-krok-2.webp"}, {"text": "Spread the mince, mixed with garlic and half of the seasoning, over the potatoes.", "obrazek": "kolac-krok-3.webp"}, {"text": "Grate the courgette, squeeze it lightly and spread it over the meat.", "obrazek": "kolac-krok-4.webp"}, {"text": "Add the spinach and torn mozzarella.", "obrazek": "kolac-krok-5.webp"}, {"text": "Whisk the eggs with the rest of the seasoning, pour over and sprinkle with pine nuts.", "obrazek": "kolac-krok-6.webp"}, {"text": "Bake for about 45 minutes until the eggs set and the top turns golden."}]', NULL, 'Keeps in the fridge for 3 days, perfect for cooking ahead. Pine nuts are not one of the 14 main EU allergens, but take care if you have a nut allergy.');
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('pecena-zelenina-s-quinoou', 'cs', 'Pečená zelenina s quinoou – základ na 3 dny', 'Jeden plech, tři různé večeře. V neděli upeč základ a každý den ho dochuť jinak.', '[{"text": "Troubu předehřej na 200 °C. Zeleninu nakrájej na kousky, promíchej s olejem a kořením."}, {"text": "Peč na plechu asi 25 minut, v polovině promíchej."}, {"text": "Mezitím uvař quinou podle návodu na obalu."}, {"text": "Smíchej zeleninu s quinoou a rozděl do 3 krabiček. V lednici vydrží 3 dny."}]', '[{"text": "Přidej grilované kuřecí maso. Víc bílkovin, hodí se při nabírání.", "nazev": "A – sytá"}, {"text": "Přidej cizrnu a lžíci tahini. Bez masa. Pozor: tahini obsahuje sezam.", "nazev": "B – rostlinná"}, {"text": "Přidej fetu a vejce natvrdo. Hotové za 5 minut. Obsahuje mléko a vejce.", "nazev": "C – rychlá"}]', NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('pecena-zelenina-s-quinoou', 'en', 'Roasted vegetables with quinoa – a 3-day base', 'One tray, three different dinners. Roast the base on Sunday and give it a new twist every day.', '[{"text": "Preheat the oven to 200 °C. Chop the vegetables and toss with oil and spices."}, {"text": "Roast for about 25 minutes, stirring halfway."}, {"text": "Meanwhile cook the quinoa according to the packet."}, {"text": "Mix vegetables with quinoa and divide into 3 boxes. Keeps for 3 days in the fridge."}]', '[{"text": "Add grilled chicken. More protein, good for building muscle.", "nazev": "A – hearty"}, {"text": "Add chickpeas and a spoon of tahini. No meat. Note: tahini contains sesame.", "nazev": "B – plant-based"}, {"text": "Add feta and a hard-boiled egg. Ready in 5 minutes. Contains milk and egg.", "nazev": "C – quick"}]', NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('kureci-salat-s-quinoou', 'cs', 'Kuřecí salát s quinoou', 'Sytý salát do krabičky, který tě podrží celé odpoledne.', '[{"text": "Quinou uvař a nech vychladnout."}, {"text": "Kuřecí prsa osol, opepři a opeč na pánvi dozlatova, pak nakrájej."}, {"text": "Rajčata a okurku nakrájej na kostičky."}, {"text": "Vše smíchej s olejem, citronem a petrželkou."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('kureci-salat-s-quinoou', 'en', 'Chicken salad with quinoa', 'A filling lunchbox salad that keeps you going all afternoon.', '[{"text": "Cook the quinoa and let it cool."}, {"text": "Season the chicken and pan-fry until golden, then slice."}, {"text": "Dice the tomatoes and cucumber."}, {"text": "Mix everything with oil, lemon juice and parsley."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('cockovy-salat-s-fetou', 'cs', 'Čočkový salát s fetou', 'Levný, rychlý a plný vlákniny. Druhý den chutná ještě líp.', '[{"text": "Čočku uvař doměkka (asi 20 minut) a sceď."}, {"text": "Cibuli nakrájej najemno, rajčata na kostičky."}, {"text": "Smíchej s čočkou, olejem a citronem, navrch rozdrob fetu."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('cockovy-salat-s-fetou', 'en', 'Lentil salad with feta', 'Cheap, quick and full of fibre. Tastes even better the next day.', '[{"text": "Cook the lentils until soft (about 20 minutes) and drain."}, {"text": "Finely chop the onion, dice the tomatoes."}, {"text": "Mix with lentils, oil and lemon, crumble feta on top."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('omeleta-se-zeleninou', 'cs', 'Omeleta se zeleninou a sýrem', 'Záchranná večeře za 15 minut z toho, co máš v lednici.', '[{"text": "Zeleninu nakrájej a krátce opeč na oleji."}, {"text": "Vejce rozšlehej se solí a pepřem a zalij jimi zeleninu."}, {"text": "Posyp sýrem, přiklop a nech 3 minuty dojít na mírném ohni."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('omeleta-se-zeleninou', 'en', 'Vegetable and cheese omelette', 'A rescue dinner in 15 minutes from whatever is in your fridge.', '[{"text": "Chop the vegetables and fry briefly in oil."}, {"text": "Whisk the eggs with salt and pepper and pour over."}, {"text": "Sprinkle with cheese, cover and cook gently for 3 minutes."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('tvarohova-pomazanka', 'cs', 'Tvarohová pomazánka na kváskovém chlebu', 'Snídaně nebo lehká večeře plná bílkovin, hotová za 10 minut.', '[{"text": "Tvaroh rozmíchej s jogurtem, solí a pepřem."}, {"text": "Přidej nasekanou pažitku a nakrájené ředkvičky."}, {"text": "Namaž na chléb."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('tvarohova-pomazanka', 'en', 'Quark spread on sourdough bread', 'A protein-rich breakfast or light dinner, ready in 10 minutes.', '[{"text": "Mix the quark with yoghurt, salt and pepper."}, {"text": "Add chopped chives and sliced radishes."}, {"text": "Spread on the bread."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ovesna-kase-s-jablkem', 'cs', 'Ovesná kaše s jablkem a skořicí', 'Teplá snídaně, která zasytí do oběda.', '[{"text": "Vločky vař v mléce asi 5 minut za stálého míchání."}, {"text": "Jablko nastrouhej nebo nakrájej a přimíchej se skořicí."}, {"text": "Posyp ořechy, podle chuti přidej med."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ovesna-kase-s-jablkem', 'en', 'Porridge with apple and cinnamon', 'A warm breakfast that keeps you full until lunch.', '[{"text": "Simmer the oats in milk for about 5 minutes, stirring."}, {"text": "Grate or chop the apple and stir in with cinnamon."}, {"text": "Top with walnuts and add honey to taste."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('bananovy-chlebicek', 'cs', 'Banánový chlebíček bez přidaného cukru', 'Sladkost dodají zralé banány. Ideální sladká tečka ke kávě.', '[{"text": "Troubu předehřej na 180 °C a formu vyskládej papírem."}, {"text": "Banány rozmačkej, přidej vejce a promíchej."}, {"text": "Vmíchej vločky, prášek do pečiva, skořici a ořechy."}, {"text": "Peč asi 40 minut, nech vychladnout a nakrájej na 10 plátků."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('bananovy-chlebicek', 'en', 'Banana bread with no added sugar', 'Ripe bananas bring the sweetness. A perfect sweet treat with coffee.', '[{"text": "Preheat the oven to 180 °C and line a loaf tin."}, {"text": "Mash the bananas, add the eggs and mix."}, {"text": "Stir in oats, baking powder, cinnamon and walnuts."}, {"text": "Bake for about 40 minutes, cool and cut into 10 slices."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('tvarohovy-dezert-s-jahodami', 'cs', 'Tvarohový dezert s jahodami', 'Sladká tečka plná bílkovin, hotová za 10 minut.', '[{"text": "Tvaroh vyšlehej s jogurtem, medem a vanilkou."}, {"text": "Jahody nakrájej."}, {"text": "Vrstvi do skleniček krém a jahody."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('tvarohovy-dezert-s-jahodami', 'en', 'Quark dessert with strawberries', 'A protein-rich sweet treat, ready in 10 minutes.', '[{"text": "Whip the quark with yoghurt, honey and vanilla."}, {"text": "Slice the strawberries."}, {"text": "Layer cream and strawberries in glasses."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('datlove-kulicky', 'cs', 'Čokoládové kuličky z datlí', 'Tři kuličky jako sladká tečka po obědě. Bez pečení.', '[{"text": "Ořechy rozmixuj najemno."}, {"text": "Přidej datle, kakao a sůl a mixuj, dokud se hmota nespojí."}, {"text": "Tvaruj 12 kuliček a obal v kokosu. Uchovej v lednici."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('datlove-kulicky', 'en', 'Chocolate date balls', 'Three balls as a sweet treat after lunch. No baking.', '[{"text": "Blend the nuts finely."}, {"text": "Add dates, cocoa and salt and blend until it sticks together."}, {"text": "Roll 12 balls and coat in coconut. Keep in the fridge."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('jogurtovy-ovocny-pohar', 'cs', 'Jogurtový ovocný pohár', 'Vrstvy jogurtu, ovoce a křupavých vloček. Vypadá jako z cukrárny.', '[{"text": "Vločky opraž nasucho na pánvi dozlatova."}, {"text": "Jogurt promíchej s medem, kiwi nakrájej."}, {"text": "Vrstvi do pohárů jogurt, ovoce a vločky, ozdob mátou."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('jogurtovy-ovocny-pohar', 'en', 'Yoghurt fruit parfait', 'Layers of yoghurt, fruit and crunchy oats. Looks like it came from a patisserie.', '[{"text": "Toast the oats in a dry pan until golden."}, {"text": "Stir honey into the yoghurt, slice the kiwi."}, {"text": "Layer yoghurt, fruit and oats in glasses, garnish with mint."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ledova-kava-s-vanilkou', 'cs', 'Domácí ledová káva s vanilkou', 'Osvěžující kávový drink s kapkou vanilky a rostlinným mlékem pro horké dny.', '[{"text": "Uvař kávu a nech ji vychladnout."}, {"text": "Do vysoké sklenice nasyp led a zalij ho mlékem s kapkou vanilky."}, {"text": "Opatrně přilij kávu, vznikne mramorový efekt. Před pitím promíchej."}]', NULL, 'Mandlové mléko obsahuje ořechy, ovesné může obsahovat lepek. Vyber podle sebe.');
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ledova-kava-s-vanilkou', 'en', 'Homemade iced coffee with vanilla', 'A refreshing coffee drink with a drop of vanilla and plant milk for hot days.', '[{"text": "Brew the coffee and let it cool."}, {"text": "Fill a tall glass with ice and pour in the milk with a drop of vanilla."}, {"text": "Gently pour in the coffee for a marbled look. Stir before drinking."}]', NULL, 'Almond milk contains nuts, oat milk may contain gluten. Choose what suits you.');
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('okurkova-limonada', 'cs', 'Okurková limonáda s limetkou a mátou', 'Svěží domácí limonáda z čerstvé okurky, limetky a máty.', '[{"text": "Okurku rozmixuj s trochou vody na hladké pyré."}, {"text": "Pyré sceď přes jemné sítko."}, {"text": "Smíchej s limetkovou šťávou, medem a podrcenou mátou."}, {"text": "Zalij perlivou vodou, přidej led a plátky okurky."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('okurkova-limonada', 'en', 'Cucumber lemonade with lime and mint', 'A fresh homemade lemonade with cucumber, lime and mint.', '[{"text": "Blend the cucumber with a little water until smooth."}, {"text": "Strain through a fine sieve."}, {"text": "Mix with lime juice, honey and crushed mint."}, {"text": "Top with sparkling water, add ice and cucumber slices."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ginger-shot', 'cs', 'Domácí ginger shot', 'Malá sklenička, která tě ráno probudí. Doma ho máš za pár minut a bez zbytečného cukru.', '[{"text": "Zázvor omyj a nakrájej na kousky (loupat nemusíš)."}, {"text": "Rozmixuj s vodou a citronovou šťávou."}, {"text": "Sceď, vmíchej med a rozlij do 4 malých skleniček. V lednici vydrží 3 dny."}]', NULL, 'Je pořádně ostrý. Začni s polovinou panáku.');
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ginger-shot', 'en', 'Homemade ginger shot', 'A tiny glass that wakes you up in the morning. Made at home in minutes, with no unnecessary sugar.', '[{"text": "Wash the ginger and cut into pieces (no need to peel)."}, {"text": "Blend with water and lemon juice."}, {"text": "Strain, stir in honey and pour into 4 small glasses. Keeps for 3 days in the fridge."}]', NULL, 'It is really spicy. Start with half a shot.');
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('zelene-smoothie', 'cs', 'Zelené smoothie', 'Rychlá snídaně do ruky. Špenát nebude cítit, slibuju.', '[{"text": "Vše dej do mixéru."}, {"text": "Mixuj do hladka, podle potřeby přidej vodu."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('zelene-smoothie', 'en', 'Green smoothie', 'A quick breakfast on the go. You won''t taste the spinach, promise.', '[{"text": "Put everything in a blender."}, {"text": "Blend until smooth, adding water as needed."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ledovy-caj-s-matou', 'cs', 'Ledový čaj s mátou a citronem', 'Domácí ledový čaj bez kupovaného sirupu. Sladkost si určíš sama.', '[{"text": "Čaj zalij horkou vodou a nech 4 minuty louhovat."}, {"text": "Vyndej sáčky, vmíchej med a nech vychladnout."}, {"text": "Přidej citron, mátu a led."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('ledovy-caj-s-matou', 'en', 'Iced tea with mint and lemon', 'Homemade iced tea without bought syrup. You decide how sweet it is.', '[{"text": "Pour hot water over the tea and steep for 4 minutes."}, {"text": "Remove the bags, stir in honey and let it cool."}, {"text": "Add lemon, mint and ice."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('latte-s-ovesnym-mlekem', 'cs', 'Latte s ovesným mlékem', 'Kavárenské latte doma za 5 minut.', '[{"text": "Připrav espresso."}, {"text": "Mléko ohřej a napěň (stačí uzavřená sklenice a pořádné protřepání)."}, {"text": "Nalij mléko do kávy a posyp skořicí."}]', NULL, NULL);
INSERT INTO public.recepty_texty (recept, jazyk, nazev, uvod, postup, varianty, tip) VALUES ('latte-s-ovesnym-mlekem', 'en', 'Oat milk latte', 'A café-style latte at home in 5 minutes.', '[{"text": "Make the espresso."}, {"text": "Warm and froth the milk (a closed jar and a good shake will do)."}, {"text": "Pour the milk into the coffee and sprinkle with cinnamon."}]', NULL, NULL);


--
-- Data for Name: suroviny; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (1, 'kolac-od-niky', 'cs', 1, 400, 'g', 'brambor', 'brambory');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (2, 'kolac-od-niky', 'cs', 2, 1, 'ks', 'cukety', 'cuketa');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (3, 'kolac-od-niky', 'cs', 3, 500, 'g', 'kuřecího mletého masa', 'kuřecí maso');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (4, 'kolac-od-niky', 'cs', 4, 200, 'g', 'mozzarelly', 'mozzarella');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (5, 'kolac-od-niky', 'cs', 5, 125, 'g', 'čerstvého špenátu', 'špenát');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (6, 'kolac-od-niky', 'cs', 6, 3, 'stroužky', 'česneku', 'česnek');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (7, 'kolac-od-niky', 'cs', 7, 1, 'lžíce', 'majoránky', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (8, 'kolac-od-niky', 'cs', 8, 4, 'ks', 'vajec', 'vejce');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (9, 'kolac-od-niky', 'cs', 9, 30, 'g', 'piniových oříšků', 'piniové oříšky');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (10, 'kolac-od-niky', 'cs', 10, NULL, NULL, 'sůl a pepř podle chuti', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (11, 'kolac-od-niky', 'en', 1, 400, 'g', 'potatoes', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (12, 'kolac-od-niky', 'en', 2, 1, 'pc', 'courgette', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (13, 'kolac-od-niky', 'en', 3, 500, 'g', 'minced chicken', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (14, 'kolac-od-niky', 'en', 4, 200, 'g', 'mozzarella', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (15, 'kolac-od-niky', 'en', 5, 125, 'g', 'fresh spinach', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (16, 'kolac-od-niky', 'en', 6, 3, 'cloves', 'garlic', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (17, 'kolac-od-niky', 'en', 7, 1, 'tbsp', 'marjoram', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (18, 'kolac-od-niky', 'en', 8, 4, 'pcs', 'eggs', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (19, 'kolac-od-niky', 'en', 9, 30, 'g', 'pine nuts', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (20, 'kolac-od-niky', 'en', 10, NULL, NULL, 'salt and pepper to taste', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (21, 'pecena-zelenina-s-quinoou', 'cs', 1, 150, 'g', 'quinoy', 'quinoa');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (22, 'pecena-zelenina-s-quinoou', 'cs', 2, 2, 'ks', 'cukety', 'cuketa');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (23, 'pecena-zelenina-s-quinoou', 'cs', 3, 2, 'ks', 'paprik', 'paprika');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (24, 'pecena-zelenina-s-quinoou', 'cs', 4, 1, 'ks', 'červené cibule', 'cibule');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (25, 'pecena-zelenina-s-quinoou', 'cs', 5, 2, 'lžíce', 'olivového oleje', 'olivový olej');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (26, 'pecena-zelenina-s-quinoou', 'cs', 6, NULL, NULL, 'sůl, pepř, uzená paprika', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (27, 'pecena-zelenina-s-quinoou', 'en', 1, 150, 'g', 'quinoa', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (28, 'pecena-zelenina-s-quinoou', 'en', 2, 2, 'pcs', 'courgettes', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (29, 'pecena-zelenina-s-quinoou', 'en', 3, 2, 'pcs', 'peppers', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (30, 'pecena-zelenina-s-quinoou', 'en', 4, 1, 'pc', 'red onion', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (31, 'pecena-zelenina-s-quinoou', 'en', 5, 2, 'tbsp', 'olive oil', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (32, 'pecena-zelenina-s-quinoou', 'en', 6, NULL, NULL, 'salt, pepper, smoked paprika', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (33, 'kureci-salat-s-quinoou', 'cs', 1, 250, 'g', 'kuřecích prsou', 'kuřecí maso');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (34, 'kureci-salat-s-quinoou', 'cs', 2, 120, 'g', 'quinoy', 'quinoa');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (35, 'kureci-salat-s-quinoou', 'cs', 3, 2, 'ks', 'rajčat', 'rajčata');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (36, 'kureci-salat-s-quinoou', 'cs', 4, 1, 'ks', 'okurky', 'okurka');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (37, 'kureci-salat-s-quinoou', 'cs', 5, 2, 'lžíce', 'olivového oleje', 'olivový olej');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (38, 'kureci-salat-s-quinoou', 'cs', 6, 0.5, 'ks', 'citronu (šťáva)', 'citron');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (39, 'kureci-salat-s-quinoou', 'cs', 7, NULL, NULL, 'sůl, pepř, petrželka', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (40, 'kureci-salat-s-quinoou', 'en', 1, 250, 'g', 'chicken breast', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (41, 'kureci-salat-s-quinoou', 'en', 2, 120, 'g', 'quinoa', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (42, 'kureci-salat-s-quinoou', 'en', 3, 2, 'pcs', 'tomatoes', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (43, 'kureci-salat-s-quinoou', 'en', 4, 1, 'pc', 'cucumber', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (44, 'kureci-salat-s-quinoou', 'en', 5, 2, 'tbsp', 'olive oil', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (45, 'kureci-salat-s-quinoou', 'en', 6, 0.5, 'pc', 'lemon (juice)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (46, 'kureci-salat-s-quinoou', 'en', 7, NULL, NULL, 'salt, pepper, parsley', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (47, 'cockovy-salat-s-fetou', 'cs', 1, 150, 'g', 'hnědé nebo zelené čočky', 'čočka');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (48, 'cockovy-salat-s-fetou', 'cs', 2, 1, 'ks', 'červené cibule', 'cibule');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (49, 'cockovy-salat-s-fetou', 'cs', 3, 2, 'ks', 'rajčat', 'rajčata');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (50, 'cockovy-salat-s-fetou', 'cs', 4, 80, 'g', 'fety', 'feta');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (51, 'cockovy-salat-s-fetou', 'cs', 5, 2, 'lžíce', 'olivového oleje', 'olivový olej');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (52, 'cockovy-salat-s-fetou', 'cs', 6, NULL, NULL, 'šťáva z ½ citronu, sůl, pepř, petrželka', 'citron');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (53, 'cockovy-salat-s-fetou', 'en', 1, 150, 'g', 'brown or green lentils', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (54, 'cockovy-salat-s-fetou', 'en', 2, 1, 'pc', 'red onion', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (55, 'cockovy-salat-s-fetou', 'en', 3, 2, 'pcs', 'tomatoes', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (56, 'cockovy-salat-s-fetou', 'en', 4, 80, 'g', 'feta', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (57, 'cockovy-salat-s-fetou', 'en', 5, 2, 'tbsp', 'olive oil', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (58, 'cockovy-salat-s-fetou', 'en', 6, NULL, NULL, 'juice of ½ lemon, salt, pepper, parsley', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (59, 'omeleta-se-zeleninou', 'cs', 1, 3, 'ks', 'vajec', 'vejce');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (60, 'omeleta-se-zeleninou', 'cs', 2, 0.5, 'ks', 'papriky', 'paprika');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (61, 'omeleta-se-zeleninou', 'cs', 3, 1, 'ks', 'rajčete', 'rajčata');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (62, 'omeleta-se-zeleninou', 'cs', 4, 0.25, 'ks', 'cibule', 'cibule');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (63, 'omeleta-se-zeleninou', 'cs', 5, 30, 'g', 'sýra', 'sýr');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (64, 'omeleta-se-zeleninou', 'cs', 6, 1, 'lžička', 'oleje', 'olej');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (65, 'omeleta-se-zeleninou', 'en', 1, 3, 'pcs', 'eggs', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (66, 'omeleta-se-zeleninou', 'en', 2, 0.5, 'pc', 'pepper', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (67, 'omeleta-se-zeleninou', 'en', 3, 1, 'pc', 'tomato', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (68, 'omeleta-se-zeleninou', 'en', 4, 0.25, 'pc', 'onion', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (69, 'omeleta-se-zeleninou', 'en', 5, 30, 'g', 'cheese', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (70, 'omeleta-se-zeleninou', 'en', 6, 1, 'tsp', 'oil', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (71, 'tvarohova-pomazanka', 'cs', 1, 250, 'g', 'tvarohu', 'tvaroh');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (72, 'tvarohova-pomazanka', 'cs', 2, 2, 'lžíce', 'bílého jogurtu', 'jogurt');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (73, 'tvarohova-pomazanka', 'cs', 3, 4, 'ks', 'ředkviček', 'ředkvičky');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (74, 'tvarohova-pomazanka', 'cs', 4, 4, 'krajíce', 'kváskového chleba', 'kváskový chléb');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (75, 'tvarohova-pomazanka', 'cs', 5, NULL, NULL, 'pažitka, sůl, pepř', 'pažitka');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (76, 'tvarohova-pomazanka', 'en', 1, 250, 'g', 'quark (tvaroh)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (77, 'tvarohova-pomazanka', 'en', 2, 2, 'tbsp', 'plain yoghurt', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (78, 'tvarohova-pomazanka', 'en', 3, 4, 'pcs', 'radishes', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (79, 'tvarohova-pomazanka', 'en', 4, 4, 'slices', 'sourdough bread', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (80, 'tvarohova-pomazanka', 'en', 5, NULL, NULL, 'chives, salt, pepper', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (81, 'ovesna-kase-s-jablkem', 'cs', 1, 50, 'g', 'ovesných vloček', 'ovesné vločky');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (82, 'ovesna-kase-s-jablkem', 'cs', 2, 250, 'ml', 'mléka (i rostlinného)', 'mléko');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (83, 'ovesna-kase-s-jablkem', 'cs', 3, 1, 'ks', 'jablka', 'jablko');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (84, 'ovesna-kase-s-jablkem', 'cs', 4, 15, 'g', 'vlašských ořechů', 'ořechy');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (85, 'ovesna-kase-s-jablkem', 'cs', 5, NULL, NULL, 'skořice, lžička medu (nepovinně)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (86, 'ovesna-kase-s-jablkem', 'en', 1, 50, 'g', 'rolled oats', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (87, 'ovesna-kase-s-jablkem', 'en', 2, 250, 'ml', 'milk (or plant-based)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (88, 'ovesna-kase-s-jablkem', 'en', 3, 1, 'pc', 'apple', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (89, 'ovesna-kase-s-jablkem', 'en', 4, 15, 'g', 'walnuts', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (90, 'ovesna-kase-s-jablkem', 'en', 5, NULL, NULL, 'cinnamon, a teaspoon of honey (optional)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (91, 'bananovy-chlebicek', 'cs', 1, 3, 'ks', 'zralých banánů', 'banán');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (92, 'bananovy-chlebicek', 'cs', 2, 2, 'ks', 'vajec', 'vejce');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (93, 'bananovy-chlebicek', 'cs', 3, 200, 'g', 'ovesných vloček (rozmixovaných)', 'ovesné vločky');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (94, 'bananovy-chlebicek', 'cs', 4, 1, 'lžička', 'prášku do pečiva', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (95, 'bananovy-chlebicek', 'cs', 5, 40, 'g', 'vlašských ořechů', 'ořechy');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (96, 'bananovy-chlebicek', 'cs', 6, NULL, NULL, 'skořice', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (97, 'bananovy-chlebicek', 'en', 1, 3, 'pcs', 'ripe bananas', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (98, 'bananovy-chlebicek', 'en', 2, 2, 'pcs', 'eggs', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (99, 'bananovy-chlebicek', 'en', 3, 200, 'g', 'oats (blended)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (100, 'bananovy-chlebicek', 'en', 4, 1, 'tsp', 'baking powder', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (101, 'bananovy-chlebicek', 'en', 5, 40, 'g', 'walnuts', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (102, 'bananovy-chlebicek', 'en', 6, NULL, NULL, 'cinnamon', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (103, 'tvarohovy-dezert-s-jahodami', 'cs', 1, 250, 'g', 'tvarohu', 'tvaroh');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (104, 'tvarohovy-dezert-s-jahodami', 'cs', 2, 150, 'g', 'bílého jogurtu', 'jogurt');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (105, 'tvarohovy-dezert-s-jahodami', 'cs', 3, 200, 'g', 'jahod', 'jahody');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (106, 'tvarohovy-dezert-s-jahodami', 'cs', 4, 2, 'lžičky', 'medu', 'med');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (107, 'tvarohovy-dezert-s-jahodami', 'cs', 5, NULL, NULL, 'vanilka', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (108, 'tvarohovy-dezert-s-jahodami', 'en', 1, 250, 'g', 'quark (tvaroh)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (109, 'tvarohovy-dezert-s-jahodami', 'en', 2, 150, 'g', 'plain yoghurt', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (110, 'tvarohovy-dezert-s-jahodami', 'en', 3, 200, 'g', 'strawberries', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (111, 'tvarohovy-dezert-s-jahodami', 'en', 4, 2, 'tsp', 'honey', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (112, 'tvarohovy-dezert-s-jahodami', 'en', 5, NULL, NULL, 'vanilla', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (113, 'datlove-kulicky', 'cs', 1, 150, 'g', 'datlí bez pecek', 'datle');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (114, 'datlove-kulicky', 'cs', 2, 100, 'g', 'mandlí nebo vlašských ořechů', 'ořechy');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (115, 'datlove-kulicky', 'cs', 3, 2, 'lžíce', 'kakaa', 'kakao');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (116, 'datlove-kulicky', 'cs', 4, NULL, NULL, 'špetka soli, kokos na obalení (nepovinně)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (117, 'datlove-kulicky', 'en', 1, 150, 'g', 'pitted dates', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (118, 'datlove-kulicky', 'en', 2, 100, 'g', 'almonds or walnuts', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (119, 'datlove-kulicky', 'en', 3, 2, 'tbsp', 'cocoa', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (120, 'datlove-kulicky', 'en', 4, NULL, NULL, 'a pinch of salt, coconut for rolling (optional)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (121, 'jogurtovy-ovocny-pohar', 'cs', 1, 300, 'g', 'bílého jogurtu', 'jogurt');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (122, 'jogurtovy-ovocny-pohar', 'cs', 2, 150, 'g', 'borůvek', 'borůvky');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (123, 'jogurtovy-ovocny-pohar', 'cs', 3, 1, 'ks', 'kiwi', 'kiwi');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (124, 'jogurtovy-ovocny-pohar', 'cs', 4, 2, 'lžíce', 'ovesných vloček', 'ovesné vločky');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (125, 'jogurtovy-ovocny-pohar', 'cs', 5, 1, 'lžička', 'medu', 'med');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (126, 'jogurtovy-ovocny-pohar', 'cs', 6, NULL, NULL, 'lístky máty', 'máta');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (127, 'jogurtovy-ovocny-pohar', 'en', 1, 300, 'g', 'plain yoghurt', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (128, 'jogurtovy-ovocny-pohar', 'en', 2, 150, 'g', 'blueberries', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (129, 'jogurtovy-ovocny-pohar', 'en', 3, 1, 'pc', 'kiwi', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (130, 'jogurtovy-ovocny-pohar', 'en', 4, 2, 'tbsp', 'rolled oats', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (131, 'jogurtovy-ovocny-pohar', 'en', 5, 1, 'tsp', 'honey', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (132, 'jogurtovy-ovocny-pohar', 'en', 6, NULL, NULL, 'mint leaves', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (133, 'ledova-kava-s-vanilkou', 'cs', 1, 1, 'dvojité', 'espresso (nebo silná překapávaná káva)', 'káva');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (134, 'ledova-kava-s-vanilkou', 'cs', 2, 200, 'ml', 'mandlového nebo ovesného mléka', 'rostlinné mléko');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (135, 'ledova-kava-s-vanilkou', 'cs', 3, NULL, NULL, 'pár kapek vanilkového extraktu', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (136, 'ledova-kava-s-vanilkou', 'cs', 4, NULL, NULL, 'lžička javorového sirupu (nepovinně)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (137, 'ledova-kava-s-vanilkou', 'cs', 5, NULL, NULL, 'hodně ledu', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (138, 'ledova-kava-s-vanilkou', 'en', 1, 1, 'double', 'espresso (or strong filter coffee)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (139, 'ledova-kava-s-vanilkou', 'en', 2, 200, 'ml', 'almond or oat milk', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (140, 'ledova-kava-s-vanilkou', 'en', 3, NULL, NULL, 'a few drops of vanilla extract', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (141, 'ledova-kava-s-vanilkou', 'en', 4, NULL, NULL, 'a teaspoon of maple syrup (optional)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (142, 'ledova-kava-s-vanilkou', 'en', 5, NULL, NULL, 'plenty of ice', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (143, 'okurkova-limonada', 'cs', 1, 1.5, 'ks', 'salátové okurky', 'okurka');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (144, 'okurkova-limonada', 'cs', 2, 2, 'ks', 'limetek (šťáva)', 'limetka');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (145, 'okurkova-limonada', 'cs', 3, 1, 'lžíce', 'medu', 'med');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (146, 'okurkova-limonada', 'cs', 4, NULL, NULL, 'hrst čerstvé máty, perlivá voda, led', 'máta');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (147, 'okurkova-limonada', 'en', 1, 1.5, 'pcs', 'cucumbers', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (148, 'okurkova-limonada', 'en', 2, 2, 'pcs', 'limes (juice)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (149, 'okurkova-limonada', 'en', 3, 1, 'tbsp', 'honey', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (150, 'okurkova-limonada', 'en', 4, NULL, NULL, 'a handful of fresh mint, sparkling water, ice', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (151, 'ginger-shot', 'cs', 1, 100, 'g', 'čerstvého zázvoru', 'zázvor');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (152, 'ginger-shot', 'cs', 2, 2, 'ks', 'citronů (šťáva)', 'citron');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (153, 'ginger-shot', 'cs', 3, 1, 'lžíce', 'medu', 'med');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (154, 'ginger-shot', 'cs', 4, 100, 'ml', 'vody', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (155, 'ginger-shot', 'cs', 5, NULL, NULL, 'špetka kurkumy a pepře (nepovinně)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (156, 'ginger-shot', 'en', 1, 100, 'g', 'fresh ginger', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (157, 'ginger-shot', 'en', 2, 2, 'pcs', 'lemons (juice)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (158, 'ginger-shot', 'en', 3, 1, 'tbsp', 'honey', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (159, 'ginger-shot', 'en', 4, 100, 'ml', 'water', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (160, 'ginger-shot', 'en', 5, NULL, NULL, 'a pinch of turmeric and pepper (optional)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (161, 'zelene-smoothie', 'cs', 1, NULL, NULL, 'hrst baby špenátu', 'špenát');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (162, 'zelene-smoothie', 'cs', 2, 1, 'ks', 'banánu', 'banán');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (163, 'zelene-smoothie', 'cs', 3, 0.5, 'ks', 'jablka', 'jablko');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (164, 'zelene-smoothie', 'cs', 4, 150, 'g', 'bílého jogurtu', 'jogurt');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (165, 'zelene-smoothie', 'cs', 5, NULL, NULL, 'trochu vody', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (166, 'zelene-smoothie', 'en', 1, NULL, NULL, 'a handful of baby spinach', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (167, 'zelene-smoothie', 'en', 2, 1, 'pc', 'banana', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (168, 'zelene-smoothie', 'en', 3, 0.5, 'pc', 'apple', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (169, 'zelene-smoothie', 'en', 4, 150, 'g', 'plain yoghurt', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (170, 'zelene-smoothie', 'en', 5, NULL, NULL, 'a little water', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (171, 'ledovy-caj-s-matou', 'cs', 1, 1, 'l', 'vody', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (172, 'ledovy-caj-s-matou', 'cs', 2, 3, 'sáčky', 'zeleného nebo černého čaje', 'čaj');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (173, 'ledovy-caj-s-matou', 'cs', 3, 1, 'ks', 'citronu', 'citron');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (174, 'ledovy-caj-s-matou', 'cs', 4, 1, 'lžíce', 'medu', 'med');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (175, 'ledovy-caj-s-matou', 'cs', 5, NULL, NULL, 'hrst máty, led', 'máta');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (176, 'ledovy-caj-s-matou', 'en', 1, 1, 'l', 'water', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (177, 'ledovy-caj-s-matou', 'en', 2, 3, 'bags', 'green or black tea', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (178, 'ledovy-caj-s-matou', 'en', 3, 1, 'pc', 'lemon', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (179, 'ledovy-caj-s-matou', 'en', 4, 1, 'tbsp', 'honey', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (180, 'ledovy-caj-s-matou', 'en', 5, NULL, NULL, 'a handful of mint, ice', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (181, 'latte-s-ovesnym-mlekem', 'cs', 1, 1, 'dvojité', 'espresso', 'káva');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (182, 'latte-s-ovesnym-mlekem', 'cs', 2, 200, 'ml', 'ovesného mléka', 'rostlinné mléko');
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (183, 'latte-s-ovesnym-mlekem', 'cs', 3, NULL, NULL, 'skořice (nepovinně)', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (184, 'latte-s-ovesnym-mlekem', 'en', 1, 1, 'double', 'espresso', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (185, 'latte-s-ovesnym-mlekem', 'en', 2, 200, 'ml', 'oat milk', NULL);
INSERT INTO public.suroviny (id, recept, jazyk, poradi, mnozstvi, jednotka, co, zaklad) OVERRIDING SYSTEM VALUE VALUES (186, 'latte-s-ovesnym-mlekem', 'en', 3, NULL, NULL, 'cinnamon (optional)', NULL);


--
-- Name: newsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.newsletter_id_seq', 1, false);


--
-- Name: objednavky_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.objednavky_id_seq', 1, false);


--
-- Name: suroviny_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.suroviny_id_seq', 186, true);


--
-- PostgreSQL database dump complete
--

\unrestrict R6chT1zyU1GrgWItGb0ajtOzVz0Qk4imytAAcGdAZP3agaD0dHDUFBSLrdJUw6e

