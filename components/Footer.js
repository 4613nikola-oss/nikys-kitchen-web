// Patička: upozornění, že nejde o lékařskou radu (platí pro celý web)
export default function Footer({ dict }) {
  return (
    <footer className="site-footer">
      <div className="container">
        <p>{dict.footer.note}</p>
        <p className="muted">© {new Date().getFullYear()} {dict.footer.rights}</p>
      </div>
    </footer>
  );
}
