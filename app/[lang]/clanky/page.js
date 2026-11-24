import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import { getArticles } from "@/lib/content";
import ArticleBrowser from "@/components/ArticleBrowser";
import ComicPanel from "@/components/ComicPanel";

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
      <div className="page-intro">
        <div>
          <h1>{dict.articles.title}</h1>
        </div>
        <ComicPanel {...dict.comics.articles} size={140} />
      </div>
      <ArticleBrowser articles={articles} lang={lang} dict={dict} />
    </>
  );
}
