# Niky's Kitchen – nový web (Next.js)

Web, blog, appka a obchod v jednom projektu. Statický export → běží na GitHub Pages.
Všechno se spouští **jen v Dockeru**, nic se neinstaluje do Windows.

## Spuštění

```
docker compose up -d                          # vývoj → http://localhost:3000/cs/
docker compose logs -f web                    # co se děje (Ctrl+C ukončí výpis)
docker compose down                           # zastavit
docker compose exec web npm run lint          # kontrola kódu
docker compose exec web npx next build        # statický web do složky out/
```

Úvodní adresa `/` přesměruje na `/cs/` až ve hotovém buildu (soubor `public/index.html`).
Ve vývoji otevírej rovnou `/cs/` nebo `/en/`.

## Struktura

```
app/[lang]/        stránky pro každý jazyk (cs, en)
  layout.js        společný rámec: písma, hlavička, patička
  page.js          domovská stránka
  recepty/ clanky/ aplikace/ obchod/ o-mne/
components/        Header, NavMenu (mobilní menu + přepínač jazyka), Footer, PlaceholderPage
dictionaries/      cs.json, en.json – všechny texty webu (ne v kódu)
lib/i18n.js        jazyky a načítání slovníků
app/globals.css    barvy, písma, rozměry jako proměnné
assets/, public/logo/   logo NK
```

## Fáze

* **Fáze 0 (hotovo):** nastavení, Docker, struktura, jazyky, barvy a písma, prázdné stránky
* **Fáze 1:** kostra a design webu (podle moodboardu), ukázkový recept
* Později: appka uvnitř webu, obchod (FAPI), databáze a přihlášení
