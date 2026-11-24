import Link from "next/link";
import Tecka from "./Tecka";
import SignupForm from "./SignupForm";

// Box s newsletterem a dárkem – stejný na úvodu, v obchodě i na konci článků.
// „zdarma“ je zeleně a tučně, co dostaneš je v odrážkách.
export default function NewsletterBox({ dict, lang, id = "newsletter" }) {
  const n = dict.newsletter;
  const [pred, po] = n.lead.split("{free}");
  return (
    <section id={id} className="band band-honey newsletter-box" aria-labelledby={`${id}-h`}>
      <div className="band-grid">
        <Tecka podoba="slavi" size={160} />
        <div>
          <h2 id={`${id}-h`}>{n.title}</h2>
          <p>{pred}<strong className="free">{n.free}</strong>{po}</p>
          <ul className="newsletter-perks">
            {n.perks.map((p) => <li key={p}>{p}</li>)}
          </ul>
          <SignupForm typ="newsletter" lang={lang} f={dict.shop.form} />
          <p className="newsletter-more"><Link href={`/${lang}/obchod/startovaci-knizka/`}>{dict.shop.newsletterLink}</Link></p>
        </div>
      </div>
    </section>
  );
}
