import { getDictionary } from "@/lib/i18n";
import Tecka from "@/components/Tecka";

const APP_URL = "https://4613nikola-oss.github.io/jidlo-od-a-z/";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.app.title, description: dict.app.lead };
}

export default async function AppPage() {
  const dict = await getDictionary();
  const a = dict.app;
  return (
    <section className="band-grid">
      <Tecka podoba="premysli" size={220} />
      <div>
        <h1>{a.title}</h1>
        <p className="lead">{a.lead}</p>
        <ul className="feature-list">
          {a.features.map((f) => <li key={f}>{f}</li>)}
        </ul>
        <p><a className="btn btn-accent" href={APP_URL}>{a.cta}</a></p>
        <p className="muted">{a.note}</p>
      </div>
    </section>
  );
}
