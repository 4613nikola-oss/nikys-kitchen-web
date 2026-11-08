// Hledání, které promine překlep a nevadí mu diakritika („omleta“ najde „Omeleta“)

export function normalize(text) {
  return String(text).toLowerCase().normalize("NFD").replace(/[̀-ͯ]/g, "");
}

// Levenshteinova vzdálenost: kolik písmen je potřeba změnit, aby z jednoho slova bylo druhé
function distance(a, b) {
  const d = Array.from({ length: a.length + 1 }, (_, i) => [i]);
  for (let j = 1; j <= b.length; j++) d[0][j] = j;
  for (let i = 1; i <= a.length; i++) {
    for (let j = 1; j <= b.length; j++) {
      d[i][j] = Math.min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + (a[i - 1] === b[j - 1] ? 0 : 1));
    }
  }
  return d[a.length][b.length];
}

// Jak dobře slovo z dotazu sedí na text: 0 = přesně, vyšší = hůř, Infinity = vůbec
function wordScore(word, words) {
  let best = Infinity;
  for (const w of words) {
    if (w.startsWith(word) || w.includes(word)) return 0;
    // krátká slova musí sedět přesně, delší snesou 1 překlep, dlouhá 2
    const tolerance = word.length >= 8 ? 2 : word.length >= 4 ? 1 : 0;
    // porovnáme s celým slovem i se začátkem stejně dlouhým (hledání během psaní)
    const dist = Math.min(distance(word, w), distance(word, w.slice(0, word.length)));
    if (dist <= tolerance) best = Math.min(best, dist);
  }
  return best;
}

// Skóre receptu vůči celému dotazu (každé slovo dotazu musí někde sedět)
export function matchScore(query, haystack) {
  const q = normalize(query).split(/\s+/).filter(Boolean);
  if (!q.length) return 0;
  const words = normalize(haystack).split(/[^a-z0-9]+/).filter(Boolean);
  let total = 0;
  for (const word of q) {
    const s = wordScore(word, words);
    if (s === Infinity) return Infinity;
    total += s;
  }
  return total;
}

// Nejpodobnější recepty, když nic nesedí (volnější tolerance) – pro nabídku „Zkus…“
export function suggestions(query, items, getText, limit = 3) {
  const q = normalize(query).split(/\s+/).filter(Boolean);
  if (!q.length) return [];
  return items
    .map((item) => {
      const words = normalize(getText(item)).split(/[^a-z0-9]+/).filter(Boolean);
      const score = q.reduce((sum, word) => sum + Math.min(...words.map((w) => distance(word, w.slice(0, word.length)))), 0);
      return { item, score };
    })
    .sort((a, b) => a.score - b.score)
    .slice(0, limit)
    .map((x) => x.item);
}
