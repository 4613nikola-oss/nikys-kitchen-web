# Bezpečnostní rizika – nový web (niky-web)

## Formuláře (newsletter, „Mám zájem“) – od 2026-11-10
- Adresa webhooku v Make (`lib/site.js`, `FORM_URL`) je veřejná – prohlížeč ji musí znát. Kdokoli na ni může poslat data.
- Ochrana: skryté pole proti robotům, povinný souhlas. Make má limit operací zdarma (1 000/měsíc) – při spamu se může vyčerpat.
- Když přijde spam: v Make vytvořit nový webhook, adresu vyměnit v `lib/site.js`, starý smazat.
- E-maily jsou osobní údaje: Google tabulka jen pro Niky, nesdílet odkazem. Odhlášení vyřídit smazáním řádku.

## Balíčky npm
- `npm audit` hlásí 10 zranitelností (1 kritická, 1 vysoká). Web je statický (běží jen HTML na GitHub Pages), takže riziko je hlavně při vývoji. Prověřit a aktualizovat (`npm audit` v Dockeru).
