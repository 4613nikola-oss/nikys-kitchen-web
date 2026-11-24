import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getProducts } from "@/lib/content";
import ProductCard from "@/components/ProductCard";
import NewsletterBox from "@/components/NewsletterBox";
import ComicPanel from "@/components/ComicPanel";

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

  return (
    <>
      {/* úvod jako na ostatních stránkách: text vlevo, komiks vpravo, pod tím vzduch */}
      <div className="page-intro shop-intro">
        <div>
          <h1>{s.title}</h1>
          <p className="lead">{s.lead}</p>
        </div>
        <ComicPanel {...dict.comics.shop} size={150} />
      </div>

      <div className="grid">
        {products.filter((p) => p.typ !== "darek").map((p) => (
          <ProductCard key={p.slug} product={p} lang={lang} s={s} />
        ))}
      </div>

      <NewsletterBox dict={dict} lang={lang} />
    </>
  );
}
