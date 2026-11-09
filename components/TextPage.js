// Jednoduchá textová stránka (ochrana soukromí, přístupnost): nadpis, úvod, bloky textu
function Block({ b }) {
  if (b.h) return <h2>{b.h}</h2>;
  if (b.ul) return <ul>{b.ul.map((x) => <li key={x}>{x}</li>)}</ul>;
  return (
    <p>
      {b.p}
      {b.link && (
        <>
          {" "}
          <a href={b.link} rel="noopener" target="_blank">{b.linkText}</a>
        </>
      )}
    </p>
  );
}

export default function TextPage({ texts }) {
  return (
    <article className="article prose">
      <h1>{texts.title}</h1>
      <p className="lead">{texts.lead}</p>
      <p className="muted">{texts.updated}</p>
      {texts.sections.map((b, i) => <Block key={i} b={b} />)}
    </article>
  );
}
