// Recepty a články pro appku Jídlo od A–Z – z databáze
// Při sestavení webu se z toho stane obyčejný soubor /api/appka.json,
// který si appka stáhne. Recepty tak existují jen jednou: v databázi.
import { getAppRecipes, getAppArticles } from "@/lib/content";

export const dynamic = "force-static";

export async function GET() {
  const [recepty, clanky] = await Promise.all([getAppRecipes(), getAppArticles()]);
  return Response.json(
    { verze: 1, recepty, clanky },
    // appka běží na jiné adrese (ve vývoji localhost:8080), proto povolení ke čtení odjinud
    { headers: { "Access-Control-Allow-Origin": "*" } }
  );
}
