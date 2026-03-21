<script lang="ts">
    import { onMount } from "svelte";
    import { t } from "$lib/i18n/translations";

    import IconA from "@tabler/icons-svelte/IconLetterA.svelte";
    import IconBrandGooglePlay from "@tabler/icons-svelte/IconBrandGooglePlay.svelte";
    import IconBrandGithub from "@tabler/icons-svelte/IconBrandGithub.svelte";
    import IconLockOff from "@tabler/icons-svelte/IconLockOff.svelte";
    import IconAdjustmentsHorizontal from "@tabler/icons-svelte/IconAdjustmentsHorizontal.svelte";
    import IconDatabase from "@tabler/icons-svelte/IconDatabase.svelte";

    let phoneLoaded = false;
    let phoneImage: HTMLImageElement | null = null;

    onMount(() => {
        // Cached images may finish loading before the event listener is attached.
        if (phoneImage?.complete) {
            phoneLoaded = true;
        }
    });
</script>

<svelte:head>
    <title>{$t("tabs.app")} ~ {$t("general.cobalt")}</title>
    <meta property="og:title" content="{$t('tabs.app')} ~ {$t('general.cobalt')}" />
</svelte:head>

<section id="app-page" data-first-focus tabindex="-1">
    <header class="hero">
        <img
            class="hero-phone"
            src="/white/phone.png"
            alt=""
            aria-hidden="true"
            loading="eager"
            decoding="async"
            bind:this={phoneImage}
            class:loading={!phoneLoaded}
            on:load={() => (phoneLoaded = true)}
        />

        <div class="hero-content">
            <p class="badge">{$t("app.app")}</p>
            <h1>{$t("app.title")}</h1>
            <p class="subtext hero-text">{$t("app.subtitle")}</p>
        </div>
    </header>

    <section class="card">
        <h2>{$t("app.stores.title")}</h2>

        <div class="store-grid">
            <a class="store" href="https://play.google.com/store/apps/details?id=liubquanti.white.cobalt" target="_blank" rel="noopener noreferrer">
                <IconBrandGooglePlay />
                <span>{$t("app.stores.google")}</span>
            </a>
            <a class="store" href="https://apkpure.com/white-cobalt-media-downloader/liubquanti.white.cobalt" target="_blank" rel="noopener noreferrer">
                <IconA />
                <span>{$t("app.stores.apkpure")}</span>
            </a>
            <a class="store" href="https://github.com/liubquanti/White-Cobalt/releases" target="_blank" rel="noopener noreferrer">
                <IconBrandGithub />
                <span>{$t("app.stores.github")}</span>
            </a>
        </div>

        <p class="subtext">{$t("app.stores.description")}</p>
    </section>

    <section class="card">
        <h2>{$t("app.features.title")}</h2>
        <div class="feature-grid">
            <article class="feature">
                <IconLockOff />
                <h3>{$t("app.features.no_obstacles.title")}</h3>
                <p class="subtext">{$t("app.features.no_obstacles.description")}</p>
            </article>

            <article class="feature">
                <IconAdjustmentsHorizontal />
                <h3>{$t("app.features.full_control.title")}</h3>
                <p class="subtext">{$t("app.features.full_control.description")}</p>
            </article>

            <article class="feature">
                <IconDatabase />
                <h3>{$t("app.features.monitor_storage.title")}</h3>
                <p class="subtext">{$t("app.features.monitor_storage.description")}</p>
            </article>
        </div>
    </section>
</section>

<style>
    #app-page {
        width: min(920px, 100%);
        margin: 0 auto;
        padding: 32px var(--padding);
        display: flex;
        flex-direction: column;
        gap: 18px;
    }

    .hero,
    .card {
        border-radius: var(--border-radius);
        border: 1px solid var(--border-color);
        background: var(--button);
        padding: 18px;
    }

    .hero {
        background: linear-gradient(120deg, var(--button), var(--secondary-transparent));
        min-height: 230px;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 40px;
    }

    .hero-content {
        max-width: 560px;
    }

    .hero-phone {
        position: relative;
        flex: 0 0 auto;
        align-self: end;
        bottom: -18px;
        width: clamp(175px, 23vw, 260px);
        height: auto;
        opacity: 1;
        transition: opacity 0.15s;
        pointer-events: none;
        filter: drop-shadow(0 18px 30px rgba(0, 0, 0, 0.32));
    }

    .hero-phone.loading {
        opacity: 0;
    }

    .hero h1 {
        margin: 8px 0;
    }

    .hero + .card {
        margin-top: -18px;
    }

    .hero-text {
        max-width: 60ch;
        margin: 0;
        padding: 0;
    }

    .badge {
        margin: 0;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        color: var(--secondary);
    }

    .card {
        box-shadow: var(--button-box-shadow);
    }

    .card h2 {
        margin: 0 0 8px;
    }

    .store-grid,
    .feature-grid {
        display: grid;
        gap: 12px;
        margin-top: 12px;
    }

    .store-grid {
        grid-template-columns: repeat(3, minmax(0, 1fr));
    }

    .store {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 6px 13px;
        gap: 6px;
        border: none;
        text-decoration: none;
        border-radius: var(--border-radius);
        font-size: 14.5px;
        cursor: pointer;
        background-color: var(--button);
        color: var(--button-text);
        box-shadow: var(--button-box-shadow);
    }

    .store:hover {
        background-color: var(--button-hover);
    }

    .card .subtext {
        padding-left: 0;
        padding-right: 0;
        
    }

    .store :global(svg),
    .feature :global(svg) {
        width: 22px;
        height: 22px;
    }

    .feature-grid {
        grid-template-columns: repeat(3, minmax(0, 1fr));
    }

    .feature {
        display: grid;
        grid-template-columns: auto 1fr;
        align-items: center;
        column-gap: 10px;
        border-radius: var(--border-radius);
        border: 1px solid var(--border-color);
        background: var(--input-bg);
        padding: 12px;
    }

    .feature h3 {
        margin: 0;
        font-size: 16px;
    }

    .feature p {
        grid-column: 1 / -1;
        margin: 8px 0 0;
        line-height: 1.4;
    }

    @media screen and (max-width: 740px) {
        .store-grid {
            grid-template-columns: 1fr;
        }
    }

    @media screen and (max-width: 900px) {
        .feature-grid {
            grid-template-columns: 1fr;
        }
    }

    @media screen and (max-width: 535px) {
        #app-page {
            padding: var(--padding);
            padding-bottom: calc(var(--sidebar-height-mobile) + var(--padding));
        }

        .hero {
            min-height: 260px;
            flex-direction: column;
            row-gap: 10px;
        }

        .hero-content {
            text-align: center;
            width: 100%;
        }

        .hero-phone {
            bottom: 0;
            width: min(62vw, 220px);
        }

        .store-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
