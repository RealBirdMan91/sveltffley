<script lang="ts">
    import { type Raffle } from "$lib/types/raffle";
    import RaffleCard from "$lib/components/shared/raffle/RaffleCard.svelte";
    let { raffles }: { raffles: Raffle[] } = $props();
</script>

<section class="container mx-auto p-4 flex flex-col space-y-4">
    <h1 class="text-4xl text-center">Raffles</h1>
    <ul class="flex flex-wrap justify-center space-x-4">
        {#each raffles as raffle}
            <li class="max-w-[300px]">
                <RaffleCard {raffle} />
            </li>
        {/each}
    </ul>
</section>
