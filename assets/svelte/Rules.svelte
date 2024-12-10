<script lang="ts">
    import { fly } from "svelte/transition";
    import type { Live } from "./types/live";

    type Props = {
        emojis: string;
        live: Live;
    };

    let { emojis }: Props = $props();
    let visible = $state(false);
</script>

<section>
    <button onclick={() => (visible = !visible)}>Toggle</button>
    {#if visible}
        <div in:fly={{ y: 50, duration: 300 }}>{emojis}</div>
    {/if}
    <div>
        <h1>Rules</h1>
        <p>Here are the rules:</p>
        <ul>
            <li>Rule 1</li>
            <li>Rule 2</li>
            <li>Rule 3</li>
        </ul>
    </div>
</section>
