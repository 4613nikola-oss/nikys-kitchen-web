"use client";

import { useEffect, useState } from "react";
import Icon from "./Icon";

// Propojení receptu na webu s appkou Jídlo od A–Z.
// Web i appka běží na stejné adrese (github.io), takže sdílejí úložiště prohlížeče:
// – tlačítko „Přidat do nákupu“ zapíše suroviny rovnou do nákupního seznamu v appce,
// – když je člověk v appce přihlášený, appka změnu při dalším otevření uloží i do účtu,
// – když recept otevřel z appky (?z=appka), ukáže se „Zpět do appky“.
const APP_URL = "https://4613nikola-oss.github.io/jidlo-od-a-z/";
const KLIC_NAKUP = "jidloaz-shop";
const KLIC_RELACE = "sb-eohgscmupoxeedwsbakd-auth-token";

export default function AppBridge({ items, labels }) {
  const [zAppky, setZAppky] = useState(false);
  const [prihlaseno, setPrihlaseno] = useState(false);
  const [zprava, setZprava] = useState("");

  useEffect(() => {
    setZAppky(new URLSearchParams(location.search).get("z") === "appka");
    try { setPrihlaseno(!!localStorage.getItem(KLIC_RELACE)); } catch { /* bez úložiště */ }
  }, []);

  function pridej() {
    try {
      const seznam = JSON.parse(localStorage.getItem(KLIC_NAKUP) || "[]");
      let pridano = 0;
      for (const text of items) {
        const t = text.trim();
        if (t && !seznam.some((i) => i.text.toLowerCase() === t.toLowerCase() && !i.done)) {
          seznam.push({ text: t, done: false });
          pridano++;
        }
      }
      localStorage.setItem(KLIC_NAKUP, JSON.stringify(seznam));
      // appka podle tohohle pozná, že jsou data novější, a uloží je do účtu
      localStorage.setItem("jidloaz-zmeneno", new Date().toISOString());
      setZprava(pridano ? labels.added.replace("{n}", pridano) : labels.already);
    } catch {
      setZprava(labels.noStorage);
    }
  }

  return (
    <div className="app-bridge">
      {zAppky && <a className="btn btn-ghost" href={APP_URL}>← {labels.backToApp}</a>}
      {items.length > 0 && (
        <button type="button" className="btn btn-primary btn-icon" onClick={pridej}><Icon name="nakup" size={22} /> {labels.addToShop}</button>
      )}
      {prihlaseno && <span className="app-bridge-status"><span className="online-dot" aria-hidden="true" /> {labels.signedIn}</span>}
      {zprava && (
        <p className="app-bridge-msg" role="status">
          {zprava} <a href={APP_URL}>{labels.openApp} →</a>
        </p>
      )}
    </div>
  );
}
