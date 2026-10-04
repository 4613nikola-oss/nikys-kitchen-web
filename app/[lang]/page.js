import { getDictionary } from "@/lib/i18n";

// Domovská stránka – zatím jen kostra (obsah přijde ve fázi 1)
export default async function HomePage() {
  const dict = await getDictionary();
  return (
    <section className="hero">
      <h1>{dict.home.title}</h1>
      <p className="lead">{dict.home.lead}</p>
    </section>
  );
}
