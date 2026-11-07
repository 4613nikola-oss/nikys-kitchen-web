// Připojení k databázi PostgreSQL
// Adresu databáze (DATABASE_URL) nastavuje docker-compose.yml, na GitHubu soubor nasazeni.yml.
import postgres from "postgres";

if (!process.env.DATABASE_URL) {
  throw new Error("Chybí DATABASE_URL – spusť web přes `docker compose up -d` (databáze běží v Dockeru).");
}

// Při vývoji se soubory načítají znovu – připojení si držíme jen jedno, ať jich nevznikají desítky
const globalni = globalThis;
const sql = globalni.__sql ?? postgres(process.env.DATABASE_URL, { max: 5 });
if (process.env.NODE_ENV !== "production") globalni.__sql = sql;

export default sql;
