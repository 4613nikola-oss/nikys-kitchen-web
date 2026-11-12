import Link from "next/link";
import Image from "next/image";
import Tecka from "./Tecka";
import Icon from "./Icon";
import { asset } from "@/lib/asset";

// Karta receptu (fáze B): barevný proužek podle kategorie, fotka jako polaroid připíchnutý v kuchařce
// (bez fotky Tečka), štítek kategorie, čas a kcal jako štítky s ikonkami
export default function RecipeCard({ recipe, lang, dict }) {
  const t = recipe[lang];
  return (
    <article className={`card recipe-card cat-${recipe.kategorie}`}>
      <Link href={`/${lang}/recepty/${recipe.slug}/`} className="card-link">
        <div className="card-media">
          {recipe.obrazek ? (
            <figure className="polaroid">
              <span className="pin" aria-hidden="true" />
              <Image
                src={asset(`/images/recepty/${recipe.obrazek}`)}
                alt=""
                width={600}
                height={450}
                sizes="(min-width: 900px) 25vw, 80vw"
              />
            </figure>
          ) : (
            <Tecka podoba={recipe.tecka} size={140} />
          )}
        </div>
        <div className="card-body">
          <span className="chip chip-cat">
            <Icon name={recipe.kategorie} size={16} /> {dict.categories[recipe.kategorie]}
          </span>
          <h3>{t.nazev}</h3>
          <p className="card-meta">
            <span className="fact"><Icon name="cas" size={18} /> {recipe.cas} min</span>
            {recipe.kcal && <span className="fact"><Icon name="kcal" size={18} /> ~{recipe.kcal} kcal</span>}
          </p>
        </div>
      </Link>
    </article>
  );
}
