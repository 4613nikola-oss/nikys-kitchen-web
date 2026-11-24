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
        <div className="page-intro-text">
          <p className="intro-kicker">{dict.articles.kicker}</p>
          <h1>{dict.articles.title}</h1>
          <p className="intro-lead">{dict.articles.introLead}</p>
          <ul className="intro-stats">
            <li className="intro-stat-1"><b>{articles.length}</b> {dict.articles.statArticles}</li>
            <li className="intro-stat-2"><b>{new Set(articles.flatMap((a) => a.stitky)).size}</b> {dict.articles.statTopics}</li>
            <li className="intro-stat-3"><b>{Math.max(...articles.map((a) => a.cteni))}</b> {dict.articles.statMaxRead}</li>
          </ul>
        </div>
        <ComicPanel {...dict.comics.articles} size={140} />
      </div>
      <ArticleBrowser articles={articles} lang={lang} dict={dict} />
    </>
  );
}
