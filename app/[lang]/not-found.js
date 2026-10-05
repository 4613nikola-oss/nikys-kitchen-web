import Link from "next/link";
import { getDictionary, getLang } from "@/lib/i18n";
import Tecka from "@/components/Tecka";

// Stránka 404 – Tečka „Jejda“, žádné obviňování, vždy cesta zpět
export default async function NotFound() {
  const dict = await getDictionary();
  const lang = await getLang();
  return (
    <section className="not-found">
      <Tecka podoba="jejda" size={220} />
      <h1>{dict.notFound.title}</h1>
      <p>{dict.notFound.text}</p>
      <Link className="btn btn-primary" href={`/${lang}/`}>{dict.notFound.cta}</Link>
    </section>
  );
}
