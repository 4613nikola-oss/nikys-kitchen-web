import Link from "next/link";
import Image from "next/image";
import Tecka from "./Tecka";
import Icon from "./Icon";
import { asset } from "@/lib/asset";

// Stejné číslo pro stejný recept (na serveru i v prohlížeči) – „náhodná“ hláška bez blikání
function hash(text) {
  let h = 0;
  for (const c of text) h = (h * 31 + c.charCodeAt(0)) >>> 0;
  return h;
}

// Karta receptu: barevný proužek podle kategorie, fotka jako polaroid (bez fotky Tečka),
// čas, kcal, alergeny a štítky Fit / Normal / Svaly. Při najetí komiksová bublina.
export default function RecipeCard({ recipe, lang, dict }) {
  const t = recipe[lang];
  const d = dict.recipes;
  const bubliny = d.bubbles || [];
  const bublina = bubliny.length ? bubliny[hash(recipe.slug) % bubliny.length] : null;
  return (
    <article className={`card recipe-card cat-${recipe.kategorie}`}>
      <Link href={`/${lang}/recepty/${recipe.slug}/`} className="card-link">
        <div className="card-media">
          {bublina && <span className="card-bubble" aria-hidden="true">{bublina}</span>}
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
          {recipe.cile?.length > 0 && (
            <p className="card-goals">
              {recipe.cile.map((c) => <span key={c} className={`goal goal-${c}`}>{d.goals[c]}</span>)}
            </p>
          )}
          {/* alergeny: trojúhelník + slova (ne jen barva) */}
          {t.alergeny?.length > 0 && (
            <p className="card-allergens">
              <Icon name="alergen" size={16} /> <span className="visually-hidden">{d.allergens}: </span>{t.alergeny.join(", ")}
            </p>
          )}
        </div>
      </Link>
    </article>
  );
}
