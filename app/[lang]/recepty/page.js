import { getDictionary, getLang } from "@/lib/i18n";
import { categories, recipesByCategory } from "@/lib/content";
import RecipeCard from "@/components/RecipeCard";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.recipes.title, description: dict.recipes.lead };
}

// Přehled receptů: rychlé skoky na kategorie a pod nimi karty
export default async function RecipesPage() {
  const dict = await getDictionary();
  const lang = await getLang();

  return (
    <>
      <h1>{dict.recipes.title}</h1>
      <p className="lead">{dict.recipes.lead}</p>

      <nav aria-label={dict.recipes.filterLabel} className="chips-nav">
        {categories.map((cat) => (
          <a key={cat} href={`#${cat}`} className="chip chip-link">
            {dict.categories[cat]} ({recipesByCategory(cat).length})
          </a>
        ))}
      </nav>

      {categories.map((cat) => (
        <section key={cat} id={cat} className="category-row" aria-labelledby={`h-${cat}`}>
          <h2 id={`h-${cat}`}>{dict.categories[cat]}</h2>
          <div className="grid">
            {recipesByCategory(cat).map((r) => (
              <RecipeCard key={r.slug} recipe={r} lang={lang} dict={dict} />
            ))}
          </div>
        </section>
      ))}
    </>
  );
}
