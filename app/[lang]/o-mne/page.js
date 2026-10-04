import PlaceholderPage, { placeholderMetadata } from "@/components/PlaceholderPage";

export const generateMetadata = () => placeholderMetadata("about");
export default function Page() {
  return <PlaceholderPage page="about" />;
}
