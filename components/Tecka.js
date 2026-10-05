import Image from "next/image";
import ahoj from "@/assets/maskot/ahoj.svg";
import radost from "@/assets/maskot/radost.svg";
import premysli from "@/assets/maskot/premysli.svg";
import vari from "@/assets/maskot/vari.svg";
import jejda from "@/assets/maskot/jejda.svg";
import slavi from "@/assets/maskot/slavi.svg";
import talir from "@/assets/maskot/talir.svg";
import kolac from "@/assets/maskot/kolac.svg";
import vidlicka from "@/assets/maskot/vidlicka.svg";
import zakusek from "@/assets/maskot/zakusek.svg";
import pohar from "@/assets/maskot/pohar.svg";
import buchta from "@/assets/maskot/buchta.svg";
import ovocnyKolac from "@/assets/maskot/ovocny-kolac.svg";
import sklenice from "@/assets/maskot/sklenice.svg";

// Tečka – maskot značky. Nálady (ahoj, radost…) i proměny (talíř, pohár…)
const podoby = {
  ahoj, radost, premysli, vari, jejda, slavi,
  talir, kolac, vidlicka, zakusek, pohar, buchta, "ovocny-kolac": ovocnyKolac, sklenice,
};

export default function Tecka({ podoba = "ahoj", size = 160, alt = "", className = "" }) {
  const src = podoby[podoba] || ahoj;
  return (
    <Image
      src={src}
      alt={alt}
      width={size}
      height={size}
      className={`tecka ${className}`}
    />
  );
}
