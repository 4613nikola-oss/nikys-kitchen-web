import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getArticles } from "@/lib/content";
import ArticleCard from "@/components/ArticleCard";

export async function generateMetadata() {
  const dict = await getDictionary();
  return { title: dict.articles.title, description: dict.articles.lead, alternates: alternates(await getLang(), "clanky/") };
}

export default async function ArticlesPage() {
  const dict = await getDictionary();
  const lang = await getLang();
  const articles = await getArticles();
  return (
    <>
      <h1>{dict.articles.title}</h1>
      <p className="lead">{dict.articles.lead}</p>
      <div className="grid">
        {articles.map((a) => (
          <ArticleCard key={a.slug} article={a} lang={lang} dict={dict} />
        ))}
      </div>
    </>
  );
}
