import Link from "next/link";
import Image from "next/image";
import ikona from "@/assets/logo-ikona-NK.svg";
import NavMenu from "./NavMenu";
import MastheadDate from "./MastheadDate";

// Hlavička jako titulní strana novin: řádek s ročníkem a datem vydání, velký titulek, podtitul, menu mezi linkami.
// Datum je vždy dnešní – počítá se v prohlížeči návštěvníka (MastheadDate).
export default function Header({ dict, lang }) {
  const items = [
    { href: `/${lang}/`, label: dict.nav.home },
    { href: `/${lang}/recepty/`, label: dict.nav.recipes },
    { href: `/${lang}/clanky/`, label: dict.nav.articles },
    { href: `/${lang}/aplikace/`, label: dict.nav.app },
    { href: `/${lang}/obchod/`, label: dict.nav.shop },
    { href: `/${lang}/o-mne/`, label: dict.nav.about },
  ];
  const m = dict.masthead;

  return (
    <header className="site-header">
      <div className="container masthead">
        <div className="masthead-row" aria-hidden="true">
          <span>{m.issue}</span>
          <MastheadDate lang={lang} />
          <span>{m.price}</span>
        </div>
        {/* logo vlevo, vedle něj název a pod ním podtitul – zarovnané na jeden okraj */}
        <Link href={`/${lang}/`} className="brand">
          <Image src={ikona} alt="" width={80} height={80} priority className="brand-logo" />
          <span className="brand-text">
            <span className="brand-name">Niky&apos;s Kitchen</span>
            <span className="masthead-tagline">{m.tagline}</span>
          </span>
        </Link>
        <div className="header-inner">
          <NavMenu items={items} dict={dict} lang={lang} />
        </div>
      </div>
    </header>
  );
}
