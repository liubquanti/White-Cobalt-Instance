<script lang="ts">
    import { contacts, docs, partners } from "$lib/env";
    import { t } from "$lib/i18n/translations";

    import SectionHeading from "$components/misc/SectionHeading.svelte";
    import BetaTesters from "$components/misc/BetaTesters.svelte";
</script>

<section id="imput">
<SectionHeading
    title="imput"
    sectionId="imput"
/>

cobalt створено з любов'ю та турботою командою [imput](https://imput.net/) ❤️

ми маленька команда з двох людей, але дуже старанно працюємо, щоб робити
якісне ПЗ, корисне для всіх. якщо вам подобається наша робота, будь ласка,
підтримайте нас на [сторінці донатів](/donate)!
</section>

<section id="testers">
<SectionHeading
    title={$t("about.heading.testers")}
    sectionId="testers"
/>

велика подяка нашим тестувальникам за раннє тестування оновлень і перевірку
стабільності. вони також допомогли нам випустити cobalt 10! <BetaTesters />

усі посилання зовнішні та ведуть на їхні особисті сайти або соцмережі.
</section>

<section id="partners">
<SectionHeading
    title={$t("about.heading.partners")}
    sectionId="partners"
/>

частину інфраструктури обробки cobalt надає наш давній партнер,
[royalehosting.net]({partners.royalehosting})!
</section>

<section id="meowbalt">
<SectionHeading
    title={$t("general.meowbalt")}
    sectionId="meowbalt"
/>

meowbalt - швидкий маскот cobalt, дуже емоційний кіт, який обожнює швидкий
інтернет.

усі чудові ілюстрації meowbalt, які ви бачите в cobalt, створив
[GlitchyPSI](https://glitchypsi.xyz/). він також є оригінальним автором цього
персонажа.

imput володіє юридичними правами на дизайн персонажа meowbalt, але не на
конкретні ілюстрації, створені GlitchyPSI.

ми любимо meowbalt, тому маємо встановити кілька правил, щоб його захистити:
- ви не можете використовувати дизайн персонажа meowbalt у будь-якій формі,
    окрім фанарту.
- ви не можете використовувати дизайн чи ілюстрації meowbalt у комерційних
    цілях.
- ви не можете використовувати дизайн чи ілюстрації meowbalt у власних проектах.
- ви не можете використовувати або змінювати ілюстрації meowbalt від GlitchyPSI
    у будь-якій формі.

якщо ви створите фанарт meowbalt, поділіться ним у [нашому discord
сервері](/about/community), нам буде дуже приємно це побачити!
</section>

<section id="licenses">
<SectionHeading
    title={$t("about.heading.licenses")}
    sectionId="licenses"
/>

код cobalt api (сервера обробки) є open source і ліцензований за
[AGPL-3.0]({docs.apiLicense}).

фронтенд-код cobalt є [source first](https://sourcefirst.com/) і ліцензований за
[CC-BY-NC-SA 4.0]({docs.webLicense}).

нам довелося зробити фронтенд source first, щоб шахраї не заробляли на нашій
праці та не створювали шкідливі клони, які вводять людей в оману і шкодять нашій
публічній репутації. окрім комерційного використання, ця модель дотримується
тих самих принципів, що й багато open source ліцензій.

ми спираємося на багато open source бібліотек, а також створюємо й поширюємо
власні. повний список залежностей дивіться на [github]({contacts.github})!
</section>
