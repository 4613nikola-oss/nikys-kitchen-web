import Link from "next/link";
import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getProducts } from "@/lib/content";
import Tecka from "@/components/Tecka";
import ProductCard from "@/components/ProductCard";
import SignupForm from "@/components/SignupForm";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.shop.title, description: dict.shop.lead, alternates: alternates(await getLang(), "obchod/") };
}

// Obchod: karty produktů s obálkou a cenou, dole dárek za newsletter.
// Dárek (Startovací knížka) není v mřížce, je jen v boxu s newsletterem, aby tu nebyl dvakrát.
export default async function ShopPage() {
  const dict = await getDictionary();
  const lang = await getLang();
  const s = dict.shop;
  const products = await getProducts();
  const darek = products.find((p) => p.typ === "darek");

  return (
    <>
      <div className="band-grid">
        <Tecka podoba="pohar" size={200} />
        <div>
          <h1>{s.title}</h1>
          <p className="lead">{s.lead}</p>
        </div>
      </div>

      <div className="grid">
        {products.filter((p) => p.typ !== "darek").map((p) => (
          <ProductCard key={p.slug} product={p} lang={lang} s={s} />
        ))}
      </div>

      <section id="newsletter" className="band band-honey newsletter-box" aria-labelledby="darek">
        <div className="band-grid">
          <Tecka podoba="slavi" size={160} />
          <div>
            <h2 id="darek">{s.newsletterTitle}</h2>
            <p>{s.newsletterText}</p>
            <SignupForm typ="newsletter" lang={lang} f={s.form} />
            {darek && <p><Link href={`/${lang}/obchod/${darek.slug}/`}>{s.newsletterLink}</Link></p>}
          </div>
        </div>
      </section>
    </>
  );
}
