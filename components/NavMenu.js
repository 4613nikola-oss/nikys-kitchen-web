"use client";

import { useState } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";

// Menu: na mobilu se rozbalí tlačítkem, na počítači je vidět rovnou
export default function NavMenu({ items, dict, lang }) {
  const [open, setOpen] = useState(false);
  const pathname = usePathname() || `/${lang}/`;

  // Stejná stránka v druhém jazyce: /cs/recepty/ ↔ /en/recepty/
  const otherLang = lang === "cs" ? "en" : "cs";
  const otherPath = pathname.replace(/^\/(cs|en)(?=\/|$)/, `/${otherLang}`);

  return (
    <nav aria-label={dict.nav.label} className="nav">
      <button
        type="button"
        className="nav-toggle"
        aria-expanded={open}
        aria-controls="hlavni-menu"
        onClick={() => setOpen(!open)}
      >
        {open ? dict.nav.menuClose : dict.nav.menuOpen}
      </button>

      <ul id="hlavni-menu" className={open ? "nav-list is-open" : "nav-list"}>
        {items.map((item) => (
          <li key={item.href}>
            <Link
              href={item.href}
              aria-current={pathname === item.href ? "page" : undefined}
              onClick={() => setOpen(false)}
            >
              {item.label}
            </Link>
          </li>
        ))}
        <li>
          <Link href={otherPath} hrefLang={otherLang} lang={otherLang} className="lang-switch">
            <span aria-hidden="true">{dict.language.switchToShort}</span>
            <span className="visually-hidden">{dict.language.switchTo}</span>
          </Link>
        </li>
      </ul>
    </nav>
  );
}
