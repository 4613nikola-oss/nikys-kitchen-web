// Práce s recepty a články – hledání, kategorie, alergeny
import { recipes } from "@/data/recipes";
import { articles } from "@/data/articles";

export const categories = ["slane", "sladke", "napoje"];

// 14 alergenů podle nařízení EU 1169/2011
export const allergenNames = {
  cs: {
    lepek: "lepek", korysi: "korýši", vejce: "vejce", ryby: "ryby", arasidy: "arašídy", soja: "sója",
    mleko: "mléko", orechy: "ořechy", celer: "celer", horcice: "hořčice", sezam: "sezam",
    siricitany: "oxid siřičitý a siřičitany", vlcibob: "vlčí bob", mekkysi: "měkkýši",
  },
  en: {
    lepek: "gluten", korysi: "crustaceans", vejce: "eggs", ryby: "fish", arasidy: "peanuts", soja: "soy",
    mleko: "milk", orechy: "tree nuts", celer: "celery", horcice: "mustard", sezam: "sesame",
    siricitany: "sulphites", vlcibob: "lupin", mekkysi: "molluscs",
  },
};

export const getRecipes = () => recipes;
export const getRecipe = (slug) => recipes.find((r) => r.slug === slug);
export const recipesByCategory = (cat) => recipes.filter((r) => r.kategorie === cat);

export const getArticles = () => articles;
export const getArticle = (slug) => articles.find((a) => a.slug === slug);

// Propojení: články k receptu a recepty k článku (jen ty, které existují)
export const articlesFor = (recipe) => recipe.clanky.map(getArticle).filter(Boolean);
export const recipesFor = (article) => article.recepty.map(getRecipe).filter(Boolean);
