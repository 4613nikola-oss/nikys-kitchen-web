// Samostatný rámec jen pro úvodní adresu „/“ – ta pouze přesměruje na českou verzi
export const metadata = { title: "Niky's Kitchen" };

export default function StartLayout({ children }) {
  return (
    <html lang="cs">
      <body>{children}</body>
    </html>
  );
}
