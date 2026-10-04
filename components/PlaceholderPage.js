import { getDictionary } from "@/lib/i18n";

// Společná kostra prázdné stránky – nadpis, úvod a poznámka „připravujeme“
export default async function PlaceholderPage({ page }) {
  const dict = await getDictionary();
  const texts = dict.pages[page];
  return (
    <section>
      <h1>{texts.title}</h1>
      <p className="lead">{texts.lead}</p>
      <p className="muted">{dict.placeholder}</p>
    </section>
  );
}

export async function placeholderMetadata(page) {
  const dict = await getDictionary();
  return { title: dict.pages[page].title };
}
