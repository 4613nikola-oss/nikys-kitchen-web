import { Playfair_Display, Plus_Jakarta_Sans } from "next/font/google";
import { lang } from "next/root-params";
import { getDictionary, locales } from "@/lib/i18n";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import "../globals.css";

// Písma značky – latin-ext kvůli české diakritice
const playfair = Playfair_Display({
  subsets: ["latin", "latin-ext"],
  variable: "--font-heading",
  display: "swap",
});
const jakarta = Plus_Jakarta_Sans({
  subsets: ["latin", "latin-ext"],
  variable: "--font-body",
  display: "swap",
});

// Statický export: vygeneruj stránky pro každý jazyk, jiné jazyky neexistují
export const dynamicParams = false;
export function generateStaticParams() {
  return locales.map((l) => ({ lang: l }));
}

export async function generateMetadata() {
  const dict = await getDictionary();
  return {
    title: { default: dict.meta.title, template: `%s | ${dict.meta.title}` },
    description: dict.meta.description,
  };
}

export default async function RootLayout({ children }) {
  const locale = await lang();
  const dict = await getDictionary();

  return (
    <html lang={locale} className={`${playfair.variable} ${jakarta.variable}`}>
      <body>
        <a className="skip-link" href="#obsah">{dict.skip}</a>
        <Header dict={dict} lang={locale} />
        <main id="obsah" className="container">
          {children}
        </main>
        <Footer dict={dict} />
      </body>
    </html>
  );
}
