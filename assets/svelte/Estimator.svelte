<script lang="ts">
    import type { Live } from "live_svelte";
    import { Input } from "$lib/components/ui/input/index.js";
    import { Label } from "$lib/components/ui/label/index.js";
    import Button from "./components/ui/button/button.svelte";
    import { EstimatorSchema, type Estimator } from "./schemas/Estimator";
    import { createForm } from "$lib/store/createForm.svelte";

    type Props = {
        tickets: number;
        price: number;
        live: Live;
    };
    const { tickets, price, live }: Props = $props();

    function substract() {
        live.pushEvent("substract", { price: 5 }, () => {});
    }
    function add() {
        live.pushEvent("add", { price: 5 }, () => {});
    }

    const { formState, register, handleSubmit } = createForm<Estimator>({
        initialValues: {
            ticketPrice: price,
        },
        schema: EstimatorSchema,
    });

    function onSubmit(value: Estimator) {
        live.pushEvent("set-price", { price: value.ticketPrice }, () => {});
    }
</script>

<div class="flex flex-col items-center gap-12">
    <h1 class="text-6xl font-bold">Sveltffey Estimator</h1>
    <section class="flex gap-4 text-4xl">
        <Button type="button" onclick={() => add()}>+</Button>
        <div>
            <div>{tickets}</div>
        </div>
        <span>@</span>
        <div>
            <div><span>${price}</span></div>
        </div>
        <span>=</span>
        <div>
            <div><span>$</span>{tickets * price}</div>
        </div>
        <Button onclick={() => substract()}>-</Button>
    </section>
    <section class="flex flex-col gap-4">
        <h3 class="text-3xl font-semibold">Change Price:</h3>
        <form
            class="flex flex-col gap-2 min-w-[300px]"
            onsubmit={handleSubmit(onSubmit)}
        >
            <div>
                <div class="flex w-full max-w-sm flex-col gap-1.5">
                    <Label for="ticketPrice">Ticket Price</Label>
                    <Input
                        type="number"
                        id="ticketPrice"
                        {...register("ticketPrice")}
                        placeholder="Ticket Price"
                    />
                    <p class="text-red-500">
                        {formState.errors.ticketPrice?.message}
                    </p>
                </div>
            </div>

            <Button type="submit">Submit</Button>
        </form>
    </section>
</div>
