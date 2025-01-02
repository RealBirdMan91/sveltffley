<script lang="ts">
  import type { Rule } from "$lib/types/rule";
  import * as Accordion from "$lib/components/ui/accordion";
  import type { Live } from "live_svelte";

  type Props = {
    emojis: string;
    live: Live;
    rules: Rule[];
  };

  let { emojis, rules }: Props = $props();
  console.log(emojis, rules);
</script>

<section class="flex flex-col gap-6">
  <h1 class="text-4xl font-semibold text-neutral-800">The Rules</h1>
  <p class="text-xl">{emojis}</p>
  <Accordion.Root>
    {#each rules as rule}
      <Accordion.Item value={`item-${rule.id}`} class="text-neutral-600">
        <Accordion.Trigger>{rule.title}</Accordion.Trigger>
        <Accordion.Content>{rule.text}</Accordion.Content>
      </Accordion.Item>
    {/each}
  </Accordion.Root>
</section>
