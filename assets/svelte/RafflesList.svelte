<script lang="ts">
    import { type Raffle } from "$lib/types/raffle";
    import RaffleCard from "$lib/components/shared/raffle/RaffleCard.svelte";
    import FilterForm, {
        type FormState,
    } from "$lib/components/raffles/FilterForm.svelte";
    import type { Live } from "live_svelte";
    let { raffles, live }: { raffles: Raffle[]; live: Live } = $props();

    function onFilterChange(formState: FormState) {
        live.pushEvent("filter", formState);
    }
</script>

<section class="container mx-auto p-4 flex flex-col space-y-6">
    <h1 class="text-4xl text-neutral-800">Raffles</h1>
    <FilterForm onChange={(values) => onFilterChange(values)} />
    <ul class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {#each raffles as raffle}
            <li>
                <RaffleCard {raffle} />
            </li>
        {/each}
    </ul>
</section>
