// Cesta k souboru ve složce public/ i když web běží v podsložce (GitHub Pages)
export const asset = (path) => `${process.env.NEXT_PUBLIC_BASE_PATH || ""}${path}`;
