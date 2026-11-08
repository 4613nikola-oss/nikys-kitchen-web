import { notFound } from "next/navigation";
import { getDictionary, getLang } from "@/lib/i18n";
import { getProducts, getProduct, getRecipes } from "@/lib/content";
import SampleDay from "@/components/SampleDay";
import Tecka from "@/components/Tecka";

// Ukázka plánu k tisku – z této stránky se vyrábí PDF ke stažení (Chrome → Uložit jako PDF)
export const dynamicParams = false;
export async function generateStaticParams() {
  return (await getProducts()).filter((p) => p.ukazka?.den).map((p) => ({ slug: p.slug }));
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const lang = await getLang();
  const dict = await getDictionary();
  const p = await getProduct(slug);
  return p ? { title: `${dict.shop.sampleDayTitle} – ${p[lang].nazev}`, robots: { index: false } } : {};
}

export default async function SamplePrintPage({ params }) {
  const { slug } = await params;
  const product = await getProduct(slug);
  if (!product?.ukazka?.den) notFound();

  const dict = await getDictionary();
  const lang = await getLang();
  const s = dict.shop;
  const recipes = await getRecipes();

  return (
    <article className="print-sample">
      <header className="band-grid">
        <Tecka podoba={product.tecka} size={110} />
        <div>
          <p className="chip">{s.sampleDayTitle}</p>
          <h1>{product[lang].nazev}</h1>
          <p>{s.sampleDayLead}</p>
        </div>
      </header>
      <SampleDay den={product.ukazka.den} recipes={recipes} lang={lang} s={s} />
      <p className="note">{dict.footer.note}</p>
    </article>
  );
}
