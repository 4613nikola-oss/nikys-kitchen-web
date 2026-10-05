import Tecka from "./Tecka";

// Patička: Tečka a upozornění, že nejde o lékařskou radu (platí pro celý web)
export default function Footer({ dict }) {
  return (
    <footer className="site-footer">
      <div className="container footer-inner">
        <Tecka podoba="radost" size={56} alt={dict.footer.mascot} />
        <div>
          <p>{dict.footer.note}</p>
          <p className="muted">© {new Date().getFullYear()} {dict.footer.rights}</p>
        </div>
      </div>
    </footer>
  );
}
