import { getDictionary } from "@/lib/i18n";
import Tecka from "@/components/Tecka";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.shop.title, description: dict.shop.lead };
}

// Obchod s digitálními produkty – zatím přehled toho, co připravujeme
export default async function ShopPage() {
  const dict = await getDictionary();
  const s = dict.shop;
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
        {s.items.map((item) => (
          <article key={item.name} className="card pad">
            <span className="chip chip-terra">{s.soon}</span>
            <h2 className="h3">{item.name}</h2>
            <p>{item.text}</p>
          </article>
        ))}
      </div>
    </>
  );
}
