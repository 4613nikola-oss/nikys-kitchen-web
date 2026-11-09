import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import TextPage from "@/components/TextPage";

export async function generateMetadata() {
  const dict = await getDictionary();
  const lang = await getLang();
  return { title: dict.privacy.title, description: dict.privacy.lead, alternates: alternates(lang, "soukromi/") };
}

// Ochrana soukromí – co se děje s údaji (texty ve slovníku)
export default async function PrivacyPage() {
  const dict = await getDictionary();
  return <TextPage texts={dict.privacy} />;
}
