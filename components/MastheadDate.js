"use client";

import { useEffect, useState } from "react";

// Dnešní datum podle návštěvníka (web je statický, proto se počítá až v prohlížeči)
export default function MastheadDate({ lang }) {
  const [datum, setDatum] = useState("");
  useEffect(() => {
    setDatum(new Date().toLocaleDateString(lang === "cs" ? "cs-CZ" : "en-GB", { weekday: "long", day: "numeric", month: "long", year: "numeric" }));
  }, [lang]);
  return <span className="masthead-date">{datum || " "}</span>;
}
