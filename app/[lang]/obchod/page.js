import PlaceholderPage, { placeholderMetadata } from "@/components/PlaceholderPage";

export const generateMetadata = () => placeholderMetadata("shop");
export default function Page() {
  return <PlaceholderPage page="shop" />;
}
