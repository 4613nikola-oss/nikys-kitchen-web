import Tecka from "./Tecka";

// Animace 3: Tečka se promění v dort (sladká tečka patří k jídlu).
// Čisté CSS, hraje jednou po načtení. Kdo má „omezit pohyb“, vidí rovnou dort.
export default function TeckaMorph({ size = 260, className = "" }) {
  return (
    <div className={`morph ${className}`} style={{ width: size }} aria-hidden="true">
      <Tecka podoba="radost" size={size} className="morph-a" />
      <Tecka podoba="zakusek" size={size} className="morph-b" />
      <svg className="morph-spark" viewBox="0 0 200 200">
        <g fill="#bfa97f"><circle cx="30" cy="50" r="5" /><circle cx="172" cy="40" r="6" /><circle cx="182" cy="130" r="4" /><circle cx="22" cy="140" r="4" /></g>
        <g fill="#a24e33"><circle cx="60" cy="20" r="3.5" /><circle cx="150" cy="170" r="3.5" /></g>
      </svg>
    </div>
  );
}
