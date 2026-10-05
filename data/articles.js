/*
  ČLÁNKY – „V kostce“ (3 body) + celý text po rozkliknutí
  bloky: { h: "nadpis" } | { p: "odstavec" } | { ul: ["bod", ...] }
  zdroje: jen ověřené (studie s DOI, oficiální weby)
  recepty: související recepty (slug)
*/

export const articles = [
  {
    slug: "jez-bez-vycitek",
    cteni: 3,
    recepty: ["datlove-kulicky", "tvarohovy-dezert-s-jahodami", "pecena-zelenina-s-quinoou"],
    zdroje: [
      { nazev: "Westenhoefer a kol. 1999 – přísná a flexibilní kontrola jídla", url: "https://doi.org/10.1002/(sici)1098-108x(199907)26:1%3C53::aid-eat7%3E3.0.co;2-n" },
      { nazev: "Simpson a Mazzeo 2017 – počítání kalorií a starosti kolem jídla", url: "https://doi.org/10.1016/j.eatbeh.2017.02.002" },
    ],
    cs: {
      nazev: "Jez s radostí, ne s výčitkami",
      perex: "Proč nemusíš zapisovat každé sousto a proč si sladkou tečku klidně dát.",
      vKostce: [
        "Lidé, kteří se hlídají flexibilně, mají podle výzkumu lepší výsledky než ti, kdo si všechno zakazují.",
        "Zapisování každého sousta může u části lidí přidat starosti kolem jídla.",
        "Plánuj dopředu, odškrtej, co jsi snědla, a sladkou tečku ber jako součást plánu.",
      ],
      telo: [
        { h: "Zákazy nefungují" },
        { p: "Velká studie s více než 54 tisíci lidmi rozlišila dva přístupy. Přísná kontrola („nikdy žádnou čokoládu“) souvisela s častějším přejídáním. Flexibilní kontrola („klidně si dám, jen míň“) souvisela s nižší váhou a úspěšnějším hubnutím." },
        { h: "Zapisování není pro každého" },
        { p: "Studie u vysokoškoláků zjistila, že lidé, kteří si počítají kalorie v appce, mají víc starostí kolem jídla. Neznamená to, že appka škodí každému. Jen že to jde i jinak." },
        { h: "Jak na to v praxi" },
        { ul: ["Naplánuj si den nebo týden dopředu.", "Místo zapisování jen odškrtni, co jsi snědla.", "Sladkou tečku si dej, ideálně do zhruba 10 % denního příjmu (doporučení WHO pro přidaný cukr)."] },
        { p: "Nejde o lékařskou radu. Pokud tě jídlo trápí víc, než bys chtěla, obrať se na odborníka." },
      ],
    },
    en: {
      nazev: "Eat with joy, not with guilt",
      perex: "Why you don't need to log every bite and why a sweet treat is fine.",
      vKostce: [
        "Research suggests flexible eaters do better than people who ban foods completely.",
        "Logging every bite can add food-related worries for some people.",
        "Plan ahead, tick off what you ate, and treat dessert as part of the plan.",
      ],
      telo: [
        { h: "Bans don't work" },
        { p: "A large study of more than 54,000 people compared two approaches. Rigid control (\"never any chocolate\") was linked to more overeating. Flexible control (\"I'll have some, just less\") was linked to lower weight and more successful weight loss." },
        { h: "Logging isn't for everyone" },
        { p: "A study of university students found that people who count calories in apps report more food-related worries. It doesn't mean apps harm everyone, just that there is another way." },
        { h: "In practice" },
        { ul: ["Plan your day or week ahead.", "Instead of logging, just tick off what you ate.", "Have your sweet treat, ideally within about 10% of your daily intake (WHO advice on added sugar)."] },
        { p: "This is not medical advice. If food worries you more than you'd like, talk to a professional." },
      ],
    },
  },
  {
    slug: "kolik-toho-snist",
    cteni: 5,
    recepty: ["kolac-od-niky", "kureci-salat-s-quinoou", "pecena-zelenina-s-quinoou"],
    zdroje: [
      { nazev: "Mifflin a kol. 1990 – rovnice pro výpočet bazálního metabolismu", url: "https://doi.org/10.1093/ajcn/51.2.241" },
      { nazev: "ISSN 2017 – bílkoviny a pohyb", url: "https://doi.org/10.1186/s12970-017-0177-8" },
    ],
    cs: {
      nazev: "Kolik toho vlastně sníst?",
      perex: "Co znamená BMR a TDEE a jak čísla z kalkulačky převést do běžného dne.",
      vKostce: [
        "BMR je energie pro tělo v klidu. Pod ni by příjem dlouhodobě klesat neměl.",
        "TDEE je celodenní výdej včetně práce a sportu. Když jíš zhruba tolik, váha se drží.",
        "Při hubnutí stačí mírný deficit, při nabírání mírný přebytek a dost bílkovin.",
      ],
      telo: [
        { h: "Spočítej si to" },
        { p: "Kalkulačka v naší appce počítá podle Mifflin-St Jeorovy rovnice, která se běžně používá jako dobrý odhad pro dospělé. Je to orientační výpočet, ne lékařská rada." },
        { h: "BMR – bazální metabolismus" },
        { p: "Energie, kterou tělo spotřebuje v klidu na dýchání, srdce a mozek. Ber ji jako spodní hranici: ani při hubnutí by příjem dlouhodobě neměl klesnout pod BMR." },
        { h: "TDEE – celkový denní výdej" },
        { p: "BMR plus všechen pohyb. Kdo je celý den na nohou a večer ještě sportuje, má výdej výrazně vyšší než člověk v kanceláři." },
        { h: "Jak s čísly pracovat" },
        { ul: ["Hubnutí: jez o něco méně než TDEE, nikdy ne pod BMR.", "Udržení: jez zhruba tolik, kolik je TDEE.", "Nabírání: mírný přebytek a bílkoviny. Pro aktivní lidi se doporučuje 1,4 až 2,0 g bílkovin na kg váhy denně.", "Sacharidy nejsou nepřítel: po náročném dni a tréninku doplňují energii."] },
      ],
    },
    en: {
      nazev: "How much should I actually eat?",
      perex: "What BMR and TDEE mean and how to turn calculator numbers into a normal day.",
      vKostce: [
        "BMR is the energy your body uses at rest. Your intake shouldn't stay below it for long.",
        "TDEE is your whole-day energy use including work and sport. Eat about that much and your weight stays steady.",
        "To lose weight, a mild deficit is enough. To build muscle, a mild surplus and enough protein.",
      ],
      telo: [
        { h: "Work it out" },
        { p: "The calculator in our app uses the Mifflin-St Jeor equation, a common estimate for adults. It's a guide, not medical advice." },
        { h: "BMR – basal metabolic rate" },
        { p: "The energy your body uses at rest for breathing, heart and brain. Treat it as a floor: even when losing weight, your intake shouldn't stay below BMR for long." },
        { h: "TDEE – total daily energy expenditure" },
        { p: "BMR plus all your movement. Someone on their feet all day who also trains in the evening burns much more than an office worker." },
        { h: "Using the numbers" },
        { ul: ["Losing weight: eat a bit less than TDEE, never below BMR.", "Maintaining: eat about your TDEE.", "Building muscle: a mild surplus plus protein. For active people, 1.4 to 2.0 g of protein per kg of body weight per day is recommended.", "Carbs aren't the enemy: they refuel you after a hard day and training."] },
      ],
    },
  },
  {
    slug: "kdyz-prijdes-domu-unavena",
    cteni: 2,
    recepty: ["kolac-od-niky", "omeleta-se-zeleninou", "pecena-zelenina-s-quinoou"],
    zdroje: [],
    cs: {
      nazev: "Když přijdeš domů unavená",
      perex: "Záchranná lednice: jak mít doma základ, ze kterého do 15 minut uvaříš večeři.",
      vKostce: [
        "Měj v lednici tři stavební kameny: rychlé bílkoviny, zeleninu a sacharidy, dochucení.",
        "Z nich složíš pět různých večeří podle nálady.",
        "Pomůže i jeden základ uvařený dopředu na víc dní.",
      ],
      telo: [
        { p: "Když dorazíš domů po celém dni na nohou, poslední, na co máš chuť, je vymýšlet složité recepty. Tajemství klidného večera je chytře zásobená „záchranná lednice“." },
        { h: "Tři stavební kameny" },
        { ul: ["Rychlé bílkoviny: mleté maso, vejce, sýr. Hotové za chvilku.", "Zelenina a sacharidy: cuketa, předvařené brambory, luštěniny. Dodají objem a vlákninu.", "Dochucení: piniové oříšky, bylinky, oblíbené koření. I obyčejné jídlo rázem oživí."] },
        { h: "Vyzkoušej to" },
        { p: "Koláč od Niky je přesně takový záchranný recept: z mletého masa, cukety a brambor, a vydrží 3 dny." },
      ],
    },
    en: {
      nazev: "When you come home tired",
      perex: "The rescue fridge: how to keep a base at home for a 15-minute dinner.",
      vKostce: [
        "Keep three building blocks: quick protein, vegetables and carbs, and flavour.",
        "Combine them into five different dinners depending on your mood.",
        "One base cooked ahead for several days helps too.",
      ],
      telo: [
        { p: "When you get home after a whole day on your feet, the last thing you want is a complicated recipe. The secret to a calm evening is a well-stocked \"rescue fridge\"." },
        { h: "Three building blocks" },
        { ul: ["Quick protein: mince, eggs, cheese. Ready in no time.", "Vegetables and carbs: courgette, pre-cooked potatoes, pulses. They add volume and fibre.", "Flavour: pine nuts, herbs, your favourite spices. They liven up even a simple meal."] },
        { h: "Try it" },
        { p: "Niky's Pie is exactly that kind of rescue recipe: mince, courgette and potatoes, and it keeps for 3 days." },
      ],
    },
  },
  {
    slug: "proc-po-nekterem-jidle-hladovis",
    cteni: 2,
    recepty: ["tvarohova-pomazanka", "cockovy-salat-s-fetou", "ovesna-kase-s-jablkem"],
    zdroje: [],
    cs: {
      nazev: "Proč po některém jídle hned hladovíš",
      perex: "Dvě jídla se stejnými kaloriemi tě můžou zasytit úplně jinak.",
      vKostce: [
        "Nejde jen o kalorie, ale i o to, jak dlouho jídlo zasytí.",
        "Pomáhají bílkoviny, vláknina a trocha tuku.",
        "Po sladké svačině máš za hodinu hlad, po poctivém jídle vydržíš.",
      ],
      telo: [
        { p: "Většina lidí řeší jen kalorie. Ale dvě jídla se stejným počtem kalorií tě můžou zasytit úplně jinak." },
        { h: "Trojkombinace, která drží" },
        { ul: ["Bílkoviny: tráví se déle a zasytí.", "Vláknina, třeba ze zeleniny a luštěnin: zvětší objem jídla bez zbytečných kalorií.", "Trocha tuku: zpomalí trávení, takže sytost vydrží déle."] },
        { p: "Výsledek? Žádný vlčí hlad v půlce směny, ale rovnoměrná energie." },
      ],
    },
    en: {
      nazev: "Why some meals leave you hungry straight away",
      perex: "Two meals with the same calories can fill you up very differently.",
      vKostce: [
        "It's not just calories, it's how long a meal keeps you full.",
        "Protein, fibre and a little fat help.",
        "After a sugary snack you're hungry in an hour; a proper meal lasts.",
      ],
      telo: [
        { p: "Most people only think about calories. But two meals with the same calories can fill you up very differently." },
        { h: "A combination that lasts" },
        { ul: ["Protein: digests slowly and fills you up.", "Fibre, e.g. from vegetables and pulses: adds volume without extra calories.", "A little fat: slows digestion so you stay full longer."] },
        { p: "The result? No ravenous hunger halfway through your shift, just steady energy." },
      ],
    },
  },
  {
    slug: "traveni-po-treninku",
    cteni: 1,
    recepty: ["kureci-salat-s-quinoou", "zelene-smoothie"],
    zdroje: [{ nazev: "ISSN 2017 – bílkoviny a pohyb", url: "https://doi.org/10.1186/s12970-017-0177-8" }],
    cs: {
      nazev: "Jídlo po tréninku",
      perex: "Co sníst po sportu, aby se tělo dobře zotavilo a žaludek netrpěl.",
      vKostce: [
        "Hned po tréninku nezatěžuj žaludek těžkým jídlem.",
        "Dej si lehce stravitelné bílkoviny a sacharidy.",
        "Na jedno jídlo se doporučuje zhruba 20 až 40 g bílkovin.",
      ],
      telo: [
        { h: "Dej tělu chvíli klid" },
        { p: "Po tréninku nebo plavání je krev v pracujících svalech. Začni lehce: tekutiny, vývar, šetrné sacharidy." },
        { h: "Kvalitní bílkoviny" },
        { p: "Pro regeneraci sáhni po lehce stravitelných zdrojích: drůbež, vejce, mléčné výrobky. Odborná společnost pro sportovní výživu doporučuje na jedno jídlo zhruba 20 až 40 g bílkovin." },
      ],
    },
    en: {
      nazev: "Eating after training",
      perex: "What to eat after sport so your body recovers well and your stomach stays happy.",
      vKostce: [
        "Don't load your stomach with a heavy meal right after training.",
        "Go for easily digestible protein and carbs.",
        "About 20 to 40 g of protein per meal is recommended.",
      ],
      telo: [
        { h: "Give your body a moment" },
        { p: "After training or swimming, blood is in your working muscles. Start light: fluids, broth, gentle carbs." },
        { h: "Quality protein" },
        { p: "For recovery, choose easily digestible sources: poultry, eggs, dairy. The International Society of Sports Nutrition recommends about 20 to 40 g of protein per meal." },
      ],
    },
  },
  {
    slug: "bylinky-a-ovoce-v-napojich",
    cteni: 2,
    recepty: ["okurkova-limonada", "ledovy-caj-s-matou", "ginger-shot", "ledova-kava-s-vanilkou"],
    zdroje: [],
    cs: {
      nazev: "Ovoce a bylinky v domácích nápojích",
      perex: "Domácí limonády bez kupovaných sirupů. Sladkost i chuť máš ve svých rukou.",
      vKostce: [
        "Doma víš, co do nápoje dáváš, a sladíš jen tolik, kolik chceš.",
        "Bylinky před přidáním promni, uvolní vůni.",
        "Kombinuj citrusy s mátou, bazalkou nebo rozmarýnem.",
      ],
      telo: [
        { p: "Kupované limonády bývají plné cukru. Doma si nápoj osladíš přesně podle sebe, třeba lžičkou medu." },
        { h: "Tipy pro dokonalou chuť" },
        { ul: ["Bylinky před přidáním lehce promni v prstech, uvolní se vůně.", "Citrusy se skvěle hodí k mátě, bazalce i rozmarýnu.", "Po sportu stačí voda s citronem a špetkou soli."] },
      ],
    },
    en: {
      nazev: "Fruit and herbs in homemade drinks",
      perex: "Homemade lemonades without bought syrups. Sweetness and flavour are up to you.",
      vKostce: [
        "At home you know what goes in, and you sweeten only as much as you like.",
        "Rub herbs before adding them to release the aroma.",
        "Pair citrus with mint, basil or rosemary.",
      ],
      telo: [
        { p: "Shop-bought lemonades are often full of sugar. At home you sweeten your drink to taste, for example with a teaspoon of honey." },
        { h: "Tips for great flavour" },
        { ul: ["Rub herbs lightly between your fingers before adding them to release the aroma.", "Citrus goes well with mint, basil and rosemary.", "After sport, water with lemon and a pinch of salt is enough."] },
      ],
    },
  },
];
