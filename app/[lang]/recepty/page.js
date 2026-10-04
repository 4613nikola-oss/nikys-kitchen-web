import PlaceholderPage, { placeholderMetadata } from "@/components/PlaceholderPage";

export const generateMetadata = () => placeholderMetadata("recipes");
export default function Page() {
  return <PlaceholderPage page="recipes" />;
}
