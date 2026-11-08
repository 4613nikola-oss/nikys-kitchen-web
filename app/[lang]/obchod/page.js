import { getDictionary, getLang } from "@/lib/i18n";
import { getProducts } from "@/lib/content";
import Tecka from "@/components/Tecka";
import ProductCard from "@/components/ProductCard";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.shop.title, description: dict.shop.lead };
}

// Obchod s digitálními produkty: karty s obálkou a cenou, dole dárek za newsletter
export default async function ShopPage() {
  const dict = await getDictionary();
  const lang = await getLang();
  const s = dict.shop;
  const products = await getProducts();

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
        {products.map((p) => (
          <ProductCard key={p.slug} product={p} lang={lang} s={s} />
        ))}
      </div>

      <section className="band band-honey newsletter-box" aria-labelledby="darek">
        <div className="band-grid">
          <Tecka podoba="slavi" size={160} />
          <div>
            <h2 id="darek">{s.newsletterTitle}</h2>
            <p>{s.newsletterText}</p>
            <p className="note">{s.newsletterSoon}</p>
          </div>
        </div>
      </section>
    </>
  );
}
