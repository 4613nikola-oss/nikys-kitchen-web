import Link from "next/link";
import Image from "next/image";
import ikona from "@/assets/logo-ikona-NK.svg";
import NavMenu from "./NavMenu";

// Hlavička: logo + menu (menu je klientská část kvůli otevírání na mobilu)
export default function Header({ dict, lang }) {
  const items = [
    { href: `/${lang}/`, label: dict.nav.home },
    { href: `/${lang}/recepty/`, label: dict.nav.recipes },
    { href: `/${lang}/clanky/`, label: dict.nav.articles },
    { href: `/${lang}/aplikace/`, label: dict.nav.app },
    { href: `/${lang}/obchod/`, label: dict.nav.shop },
    { href: `/${lang}/o-mne/`, label: dict.nav.about },
  ];

  return (
    <header className="site-header">
      <div className="container header-inner">
        <Link href={`/${lang}/`} className="brand">
          <Image src={ikona} alt="" width={44} height={44} priority />
          <span>Niky&apos;s Kitchen</span>
        </Link>
        <NavMenu items={items} dict={dict} lang={lang} />
      </div>
    </header>
  );
}
