"use client";

import { useState } from "react";
import Link from "next/link";
import { FORM_URL } from "@/lib/site";
import { asset } from "@/lib/asset";

// Formulář na e-mail: přihlášení k newsletteru nebo „Mám zájem“ o produkt.
// Pošle údaje do Make, který je zapíše do Google tabulky.
export default function SignupForm({ typ, produkt = "", lang, f }) {
  const [stav, setStav] = useState("ceka"); // ceka | odesilam | hotovo | chyba
  const id = `email-${typ}-${produkt || "web"}`;

  async function odeslat(e) {
    e.preventDefault();
    const data = new FormData(e.currentTarget);
    // past na roboty: skryté pole vyplní jen robot
    if (data.get("web")) return setStav("hotovo");
    setStav("odesilam");
    try {
      await fetch(FORM_URL, {
        method: "POST",
        mode: "no-cors",
        body: new URLSearchParams({
          email: String(data.get("email")).trim(),
          typ,
          produkt,
          jazyk: lang,
          souhlas: "ano",
          cas: new Date().toISOString(),
        }),
      });
      setStav("hotovo");
    } catch {
      setStav("chyba");
    }
  }

  if (stav === "hotovo") {
    return (
      <div className="form-ok" role="status">
        <p>{typ === "newsletter" ? f.okNewsletter : f.okInterest}</p>
        {/* dárek za newsletter hned ke stažení */}
        {typ === "newsletter" && (
          <a className="btn btn-primary" href={asset(`/darky/startovaci-knizka-${lang}.pdf`)} download>{f.download}</a>
        )}
      </div>
    );
  }

  return (
    <form className="signup" onSubmit={odeslat}>
      <label htmlFor={id} className="sr-only">{f.email}</label>
      <div className="signup-row">
        <input id={id} name="email" type="email" required autoComplete="email" placeholder={f.email} />
        <button type="submit" className="btn btn-primary" disabled={stav === "odesilam"}>
          {stav === "odesilam" ? f.sending : typ === "newsletter" ? f.sendNewsletter : f.sendInterest}
        </button>
      </div>
      <input type="text" name="web" tabIndex={-1} autoComplete="off" aria-hidden="true" className="hp" />
      <label className="signup-consent">
        <input type="checkbox" name="souhlas" required />{" "}
        <span>{f.consent} <Link href={`/${lang}/soukromi/`}>{f.consentLink}</Link>.</span>
      </label>
      {stav === "chyba" && <p className="form-error" role="alert">{f.error}</p>}
    </form>
  );
}
