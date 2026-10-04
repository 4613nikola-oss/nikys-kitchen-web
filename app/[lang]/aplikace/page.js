import PlaceholderPage, { placeholderMetadata } from "@/components/PlaceholderPage";

export const generateMetadata = () => placeholderMetadata("app");
export default function Page() {
  return <PlaceholderPage page="app" />;
}
