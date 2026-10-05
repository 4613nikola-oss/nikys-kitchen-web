// Úvodní adresa „/“ → česká verze. Funguje ve vývoji i ve statickém exportu.
export default function StartPage() {
  return (
    <>
      <meta httpEquiv="refresh" content="0; url=./cs/" />
      <p>
        <a href="./cs/">Pokračovat na Niky&apos;s Kitchen</a> · <a href="./en/">English</a>
      </p>
    </>
  );
}
