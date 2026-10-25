# Niky's Kitchen – web s blogem (Next.js)

Nový web značky **Niky's Kitchen**: recepty (slané, sladké, nápoje) a krátké články o výživě, česky i anglicky. Časem tu bude i appka a obchod – všechno v jednom projektu.

## Jaký problém to řeší

Hodně lidí chce jíst zdravě, ale v praxi narazí na tohle:

- **Neví, kolik toho sníst.** Kalkulačka jim dá číslo v kcal, ale už neřekne, co si z toho dát k obědu.
- **Nemají čas.** Po práci nebo tréninku nechtějí složité recepty ani extra nákup.
- **Zapisování jídel je otravné.** Počítat a zapisovat každé sousto zabere čas a často vede k výčitkám, proto s tím hodně lidí brzy skončí.
- **Rady jsou roztroušené** po webech, appkách a sociálních sítích a často si odporují.

**Na co to je:** dát jednu jasnou odpověď na otázku *„co mám dnes jíst a kolik“*, a to bez zapisování a bez výčitek.

**Pro koho:** ženy i muži 18+, kteří berou zdravé jídlo jako investici do budoucna, ale nemají moc času. Chtějí zhubnout, udržet formu nebo nabrat svaly, často sportují nebo pracují na nohou.

**Čím je to jiné:**
- žádné zapisování jídel ani denní počítání, stačí jednou zadat profil,
- jeden základ receptu a tři varianty (zhubnout / udržet / nabrat), takže se pro celou rodinu vaří jednou,
- vaří se z toho, co je doma v ledničce, a nákupní seznam se sestaví sám,
- v plánu je i „sladká tečka“, protože zdravé jídlo nemá být trest,
- krátké texty s možností rozkliknout víc, čeština a angličtina, důraz na přístupnost (i pro lidi se zrakovým postižením),
- informace jen z ověřených zdrojů, bez zdravotních slibů.

## Proč se kouknout na web

- **Recepty pro lidi, kteří nemají čas.** Krátké postupy, jasné suroviny, přepočet porcí jedním klikem.
- **Jeden recept, tři varianty.** Stejný základ upravíš podle toho, jestli chceš zhubnout, udržet formu nebo nabrat, takže se nevaří zvlášť pro každého.
- **Články, které se dají přečíst za pár minut.** Nejdřív to hlavní „v kostce“, víc až po rozkliknutí, vždy s ověřenými zdroji.
- **Bez výčitek a bez zákazů.** Zdravé jídlo může být i sladké, a proto má každý plán svou „sladkou tečku“.
- **Pro co nejvíc lidí.** Čeština i angličtina, alergeny u každého receptu, přizpůsobené mobilu, s ohledem na čtečky obrazovky.
- **Navazuje na appku.** Z receptu se dostaneš rovnou do appky Jídlo od A–Z, kde si spočítáš, kolik toho sníst.
## Niky's Kitchen – jak to spolu souvisí

Niky's Kitchen má tři části. Cíl je pořád stejný: ulehčit lidem zdravé stravování bez složitého počítání a bez výčitek.

| Část | Co to je | Stav |
|------|----------|------|
| 🌐 **Web s blogem** (tento projekt) | recepty a články, každý recept má základ a varianty (zhubnout / udržet / nabrat) | ve vývoji, zatím neveřejný |
| 📱 **Appka Jídlo od A–Z** | kalkulačka příjmu, plán jídel, recepty z ledničky, nákupní seznam | online: https://4613nikola-oss.github.io/jidlo-od-a-z/ |
| 🛒 **Obchod** | digitální produkty: e-booky, online kuchařka, jídelní plány, kurzy | připravujeme |

**Jak na sebe navazují:** web přivede čtenáře (recept, článek, sociální sítě) → appka mu pomůže v praxi (co a kolik jíst, z čeho uvařit) → obchod nabídne placené plány a e-booky pro ty, kdo chtějí víc.

Na webu: odkazy z receptů a článků vedou do appky (stránka Aplikace) a do obchodu (stránka Obchod). Recepty a články jsou propojené mezi sebou.

## Co na webu je

- **Recepty** – 17 receptů ve třech kategoriích, přepočet porcí, alergeny (14 podle EU), varianty, tip od maskota Tečky
- **Články** – krátce „v kostce“, víc po rozkliknutí, se zdroji
- **Aplikace, Obchod, O mně** – představení dalších částí
- Čeština a angličtina (`/cs/`, `/en/`), responzivní, přístupnost (WCAG), maskot Tečka

## Spuštění

Všechno se spouští **jen v Dockeru**, nic se neinstaluje do Windows.

```
docker compose up -d                          # vývoj → http://localhost:3000/cs/
docker compose logs -f web                    # co se děje (Ctrl+C ukončí výpis)
docker compose restart web                    # když server nevidí nový soubor
docker compose down                           # zastavit
docker compose exec web npm run lint          # kontrola kódu
docker compose exec web npx next build        # statický web do složky out/
```

Úvodní adresa `/` přesměruje na `/cs/` až v hotovém buildu. Ve vývoji otevírej rovnou `/cs/` nebo `/en/`.

## Struktura

```
app/[lang]/        stránky pro každý jazyk (cs, en)
  layout.js        společný rámec: písma, hlavička, patička
  page.js          domovská stránka
  recepty/ clanky/ aplikace/ obchod/ o-mne/
data/              recipes.js, articles.js – obsah webu (cs + en)
components/        Header, NavMenu, Footer, Tecka, RecipeCard, ArticleCard, PortionCalculator
dictionaries/      cs.json, en.json – texty webu (ne v kódu)
lib/               i18n.js, content.js, asset.js
app/globals.css    barvy, písma, rozměry jako proměnné
assets/            logo NK, maskot Tečka
public/            favicon, obrázky receptů
```

## Větve

- `dev` – rozpracované změny
- `main` – hotové a schválené

## Fáze

* **Fáze 0 (hotovo):** nastavení, Docker, struktura, jazyky, barvy a písma
* **Fáze 1 (hotovo, první verze):** recepty, články, design, maskot
* **Dál:** doladění podle Figmy, SEO, ochrana soukromí a přístupnost, zveřejnění webu
* **Později:** appka uvnitř webu, obchod, databáze a přihlášení
