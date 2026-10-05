import Link from "next/link";
import Image from "next/image";
import Tecka from "./Tecka";
import { asset } from "@/lib/asset";

// Karta receptu: obrázek (fotka nebo Tečka), název, čas a kcal
export default function RecipeCard({ recipe, lang, dict }) {
  const t = recipe[lang];
  return (
    <article className="card recipe-card">
      <Link href={`/${lang}/recepty/${recipe.slug}/`} className="card-link">
        <div className="card-media">
          {recipe.obrazek ? (
            <Image
              src={asset(`/images/recepty/${recipe.obrazek}`)}
              alt=""
              width={600}
              height={330}
              sizes="(min-width: 900px) 33vw, 100vw"
            />
          ) : (
            <Tecka podoba={recipe.tecka} size={140} />
          )}
        </div>
        <div className="card-body">
          <span className="chip">{dict.categories[recipe.kategorie]}</span>
          <h3>{t.nazev}</h3>
          <p className="card-meta">
            <span><span aria-hidden="true">⏱</span> {recipe.cas} min</span>
            {recipe.kcal && <span><span aria-hidden="true">🔥</span> ~{recipe.kcal} kcal</span>}
          </p>
        </div>
      </Link>
    </article>
  );
}
