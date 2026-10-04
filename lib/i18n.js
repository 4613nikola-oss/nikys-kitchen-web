// Jazyky webu. Texty jsou ve slovnících dictionaries/cs.json a en.json, ne v kódu.
import { lang } from "next/root-params";
import { notFound } from "next/navigation";

export const locales = ["cs", "en"];
export const defaultLocale = "cs";

const dictionaries = {
  cs: () => import("@/dictionaries/cs.json").then((m) => m.default),
  en: () => import("@/dictionaries/en.json").then((m) => m.default),
};

export const hasLocale = (locale) => locale in dictionaries;

// Slovník pro aktuální jazyk stránky (jazyk zjistí sám z adresy /cs/... nebo /en/...)
export async function getDictionary() {
  const locale = await lang();
  if (!hasLocale(locale)) notFound();
  return dictionaries[locale]();
}

export async function getLang() {
  return lang();
}
