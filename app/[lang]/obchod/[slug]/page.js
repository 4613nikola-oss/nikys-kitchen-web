import Link from "next/link";
import { notFound } from "next/navigation";
import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getProducts, getProduct, getRecipes } from "@/lib/content";
import { asset } from "@/lib/asset";
import ProductCover from "@/components/ProductCover";
import ProductPrice from "@/components/ProductPrice";
import SampleDay from "@/components/SampleDay";
import SignupForm from "@/components/SignupForm";
import { typeLabel } from "@/components/ProductCard";
import RecipeCard from "@/components/RecipeCard";

export const dynamicParams = false;
export async function generateStaticParams() {
  return (await getProducts()).map((p) => ({ slug: p.slug }));
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const lang = await getLang();
  const p = await getProduct(slug);
  return p ? { title: p[lang].nazev, description: p[lang].popis, alternates: alternates(lang, `obchod/${slug}/`) } : {};
}

// Detail produktu: obálka, cena, pro koho, co v něm je, ukázka zdarma a časté otázky
export default async function ProductPage({ params }) {
  const { slug } = await params;
  const product = await getProduct(slug);
  if (!product) notFound();

  const dict = await getDictionary();
  const lang = await getLang();
  const s = dict.shop;
  const t = product[lang];
  const u = product.ukazka || {};
  const recipes = await getRecipes();
  const zaklad = u.zaklad ? recipes.find((r) => r.slug === u.zaklad) : null;
  const pdf = u.pdf?.[lang];

  return (
    <article className="product">
      <p className="breadcrumb"><Link href={`/${lang}/obchod/`}>← {s.title}</Link></p>

      <header className="recipe-head">
        <div>
          <span className="chip">{typeLabel(product, s)}</span>
          <h1>{t.nazev}</h1>
          <p className="lead">{t.popis}</p>
          <ProductPrice product={product} lang={lang} labels={s} />
          {/* Prodej zatím neběží: místo „Koupit“ nechá člověk e-mail (dárek = přihlášení k newsletteru) */}
          <div className="interest">
            <h2 className="h3">{product.typ === "darek" ? s.newsletterTitle : s.interestTitle}</h2>
            <p>{product.typ === "darek" ? s.newsletterText : s.interestText}</p>
            <SignupForm typ={product.typ === "darek" ? "newsletter" : "zajem"} produkt={product.slug} lang={lang} f={s.form} />
          </div>
        </div>
        <ProductCover product={product} lang={lang} typeLabel={typeLabel(product, s)} large />
      </header>

      <div className="recipe-body">
        <section className="card pad" aria-labelledby="pro-koho">
          <h2 id="pro-koho" className="h3">{s.forWho}</h2>
          <p>{t.proKoho}</p>
          <h2 className="h3">{s.format}</h2>
          <p>{t.format}</p>
        </section>
        <section aria-labelledby="obsah">
          <h2 id="obsah">{s.inside}</h2>
          <ul className="variant-list">
            {t.obsah.map((x) => <li key={x}>{x}</li>)}
          </ul>
        </section>
      </div>

      {u.den && (
        <section className="band band-sage" aria-labelledby="ukazka">
          <h2 id="ukazka">{s.sampleDayTitle}</h2>
          <p>{s.sampleDayLead}</p>
          <SampleDay den={u.den} recipes={recipes} lang={lang} s={s} />
          {pdf && (
            <p><a className="btn btn-primary" href={asset(`/ukazky/${pdf}`)} download>{s.samplePdf}</a></p>
          )}
        </section>
      )}

      {u.recepty && (
        <section aria-labelledby="ukazka">
          <h2 id="ukazka">{s.sampleRecipesTitle}</h2>
          <div className="grid">
            {u.recepty.map((slug2) => recipes.find((r) => r.slug === slug2)).filter(Boolean).map((r) => (
              <RecipeCard key={r.slug} recipe={r} lang={lang} dict={dict} />
            ))}
          </div>
        </section>
      )}

      {zaklad && (
        <section className="band band-sage" aria-labelledby="ukazka">
          <h2 id="ukazka">{s.sampleBaseTitle}</h2>
          <div className="band-grid">
            <div style={{ maxWidth: "22rem" }}>
              <RecipeCard recipe={zaklad} lang={lang} dict={dict} />
            </div>
            <ul className="variant-list">
              {zaklad[lang].varianty?.map((v) => (
                <li key={v.nazev}><strong>{v.nazev}:</strong> {v.text}</li>
              ))}
            </ul>
          </div>
        </section>
      )}

      <section aria-labelledby="faq" className="faq">
        <h2 id="faq">{s.faqTitle}</h2>
        {/* kurz naživo má vlastní otázky, online kurz jen obecné (bez PDF) */}
        {(product.obrazek === "kurz-nazivo" ? s.faqLive : product.obrazek ? s.faq.slice(2) : s.faq).map((f) => (
          <details key={f.q} className="more">
            <summary>{f.q}</summary>
            <p>{f.a}</p>
          </details>
        ))}
      </section>

      <p><Link href={`/${lang}/obchod/`}>← {s.back}</Link></p>
    </article>
  );
}
