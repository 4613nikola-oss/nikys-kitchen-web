import Link from "next/link";
import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import Tecka from "@/components/Tecka";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.about.title, description: dict.about.lead, alternates: alternates(await getLang(), "o-mne/") };
}

// O mně: polaroid (zatím Tečka, později karikatura Niky), pravidla v kuchyni, co tu dělám, proč, Tečka
export default async function AboutPage() {
  const dict = await getDictionary();
  const lang = await getLang();
  const a = dict.about;
  return (
    <article className="about">
      <section className="band-grid about-hero">
        {/* místo pro fotku / karikaturu Niky – polaroid připíchnutý do kuchařky */}
        <figure className="polaroid about-photo">
          <span className="pin" aria-hidden="true" />
          <Tecka podoba="vari" size={220} />
          <figcaption className="hand">{a.photoCaption}</figcaption>
        </figure>
        <div>
          <h1>{a.title}</h1>
          <p className="lead">{a.lead}</p>
          {a.text.map((p) => <p key={p}>{p}</p>)}
        </div>
      </section>

      <section aria-labelledby="pravidla">
        <h2 id="pravidla">{a.rulesTitle}</h2>
        <ul className="variant-list">{a.rules.map((r) => <li key={r}>{r}</li>)}</ul>
      </section>

      <section aria-labelledby="co">
        <h2 id="co">{a.whatTitle}</h2>
        <div className="grid about-what">
          {a.what.map(([h, p]) => (
            <div key={h} className="card pad"><h3>{h}</h3><p>{p}</p></div>
          ))}
        </div>
      </section>

      <section aria-labelledby="proc">
        <h2 id="proc">{a.whyTitle}</h2>
        {a.why.map((p) => <p key={p}>{p}</p>)}
      </section>

      <section className="tip" aria-labelledby="tecka">
        <Tecka podoba="slavi" size={110} />
        <div>
          <h2 id="tecka">{a.teckaTitle}</h2>
          <p>{a.tecka}</p>
        </div>
      </section>

      <p className="about-cta">
        <Link className="btn btn-primary" href={`/${lang}/recepty/`}>{a.cta.recipes}</Link>{" "}
        <Link className="btn btn-accent" href={`/${lang}/aplikace/`}>{a.cta.app}</Link>{" "}
        <Link className="btn btn-ghost" href={`/${lang}/obchod/#newsletter`}>{a.cta.news}</Link>
      </p>
    </article>
  );
}
