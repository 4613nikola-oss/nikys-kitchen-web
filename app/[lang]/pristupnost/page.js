import { getDictionary, getLang } from "@/lib/i18n";
import { alternates } from "@/lib/site";
import TextPage from "@/components/TextPage";

export async function generateMetadata() {
  const dict = await getDictionary();
  const lang = await getLang();
  return { title: dict.accessibility.title, description: dict.accessibility.lead, alternates: alternates(lang, "pristupnost/") };
}

// Prohlášení o přístupnosti (texty ve slovníku)
export default async function AccessibilityPage() {
  const dict = await getDictionary();
  return <TextPage texts={dict.accessibility} />;
}
