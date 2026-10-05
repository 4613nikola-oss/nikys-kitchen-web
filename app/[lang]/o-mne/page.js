import { getDictionary } from "@/lib/i18n";
import Tecka from "@/components/Tecka";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.about.title };
}

export default async function AboutPage() {
  const dict = await getDictionary();
  const a = dict.about;
  return (
    <section className="band-grid">
      <Tecka podoba="radost" size={220} />
      <div>
        <h1>{a.title}</h1>
        <p className="lead">{a.lead}</p>
        {a.text.map((p) => <p key={p}>{p}</p>)}
      </div>
    </section>
  );
}
