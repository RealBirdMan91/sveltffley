<script lang="ts">
    import { fly } from "svelte/transition";
    import type { Live } from "./types/live";
    import { test } from "$lib/utils/test";
    import { cn } from "$lib/utils";
    import { Button } from "$lib/components/ui/button";

    const myTest = test("testitest");
    console.log(myTest);

    type Props = {
        emojis: string;
        live: Live;
    };

    let { emojis }: Props = $props();
    let visible = $state(false);
</script>

<section>
    <Button variant="outline" onclick={() => (visible = !visible)}
        >Button</Button
    >
    {#if visible}
        <div in:fly={{ y: 50, duration: 300 }}>{emojis}</div>
    {/if}
    <div>
        <h1 class={cn(visible ? "text-green-500" : "text-red-500", "text-2xl")}>
            Rules
        </h1>
        <p>Here are the rules:</p>
        <ul>
            <li>Rule 1</li>
            <li>Rule 2</li>
            <li>Rule 3</li>
        </ul>
    </div>
</section>
