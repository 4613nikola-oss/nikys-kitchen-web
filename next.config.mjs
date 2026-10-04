/** @type {import('next').NextConfig} */
const nextConfig = {
  // Statický web (HTML soubory) – běží na GitHub Pages bez serveru
  output: "export",
  // /recepty → /recepty/index.html, GitHub Pages to tak má rád
  trailingSlash: true,
  // Na GitHub Pages bývá web v podsložce (/nazev-repa) – nastaví se proměnnou při buildu
  basePath: process.env.NEXT_PUBLIC_BASE_PATH || "",
  images: {
    // Optimalizace obrázků potřebuje server, ve statickém exportu ji vypínáme
    unoptimized: true,
  },
};

export default nextConfig;
