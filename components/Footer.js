import Link from "next/link";
import Tecka from "./Tecka";

// Patička: Tečka, upozornění, že nejde o lékařskou radu (platí pro celý web), a odkazy na povinné stránky
export default function Footer({ dict, lang }) {
  return (
    <footer className="site-footer">
      <div className="container footer-inner">
        <Tecka podoba="radost" size={56} alt={dict.footer.mascot} />
        <div>
          <p>{dict.footer.note}</p>
          <p className="footer-links">
            <Link href={`/${lang}/soukromi/`}>{dict.footer.legal.privacy}</Link>
            <Link href={`/${lang}/pristupnost/`}>{dict.footer.legal.accessibility}</Link>
          </p>
          <p className="muted">© {new Date().getFullYear()} {dict.footer.rights}</p>
        </div>
      </div>
    </footer>
  );
}
