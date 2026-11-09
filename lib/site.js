// Adresa webu na internetu (pro mapu webu, náhledy při sdílení a data pro Google)
export const SITE_URL = (process.env.NEXT_PUBLIC_SITE_URL || "https://4613nikola-oss.github.io/nikys-kitchen-web").replace(/\/$/, "");

// Odkazy na stejnou stránku v češtině i angličtině (Google pak ví, že jde o překlad)
// cesta bez jazyka, např. "recepty/kolac-od-niky/"
export function alternates(lang, cesta = "") {
  return {
    canonical: `${SITE_URL}/${lang}/${cesta}`,
    languages: {
      cs: `${SITE_URL}/cs/${cesta}`,
      en: `${SITE_URL}/en/${cesta}`,
      "x-default": `${SITE_URL}/cs/${cesta}`,
    },
  };
}
