import PlaceholderPage, { placeholderMetadata } from "@/components/PlaceholderPage";

export const generateMetadata = () => placeholderMetadata("articles");
export default function Page() {
  return <PlaceholderPage page="articles" />;
}
