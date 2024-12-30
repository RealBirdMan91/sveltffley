<script lang="ts">
    import { Input } from "$lib/components/ui/input/index";
    import * as Select from "$lib/components/ui/select/index";
    import type { Selected } from "bits-ui";

    export type FormState = {
        query: string;
        status: "upcoming" | "open" | "closed" | "";
        sort_by: "prize" | "ticket_price" | "";
    };

    type StatusValue = {
        value: FormState["status"];
        label: string;
    };

    type SortByValue = {
        value: FormState["sort_by"];
        label: string;
    };

    const status: Array<StatusValue> = [
        { value: "", label: "Select a status" },
        { value: "upcoming", label: "Upcoming" },
        { value: "open", label: "Open" },
        { value: "closed", label: "Closed" },
    ];
    const sort_by: Array<SortByValue> = [
        { value: "", label: "Sort by" },
        { value: "prize", label: "Prize" },
        { value: "ticket_price", label: "Ticket Price" },
    ];

    const { onChange } = $props<{
        onChange: (formState: FormState) => void;
    }>();

    const formState = $state<FormState>({
        query: "",
        status: "",
        sort_by: "",
    });

    $effect(() => {
        onChange($state.snapshot(formState));
    });
</script>

<div class="flex gap-2">
    <Input
        bind:value={formState.query}
        type="text"
        placeholder="Search..."
        autocomplete="off"
        class="w-[280px]"
    />
    <Select.Root
        selected={status.find((x) => x.value === formState.status) ?? status[0]}
        onSelectedChange={(s: Selected<FormState["status"]> | undefined) => {
            s && (formState.status = s.value);
        }}
    >
        <Select.Trigger class="w-[180px]">
            <Select.Value />
        </Select.Trigger>
        <Select.Content>
            {#each status as { value, label }}
                <Select.Item {value}>{label}</Select.Item>
            {/each}
        </Select.Content>
    </Select.Root>
    <Select.Root
        selected={sort_by.find((x) => x.value === formState.sort_by) ??
            sort_by[0]}
        onSelectedChange={(s: Selected<FormState["sort_by"]> | undefined) => {
            s && (formState.sort_by = s.value);
        }}
    >
        <Select.Trigger class="w-[180px]">
            <Select.Value />
        </Select.Trigger>
        <Select.Content>
            {#each sort_by as { value, label }}
                <Select.Item {value}>{label}</Select.Item>
            {/each}
        </Select.Content>
    </Select.Root>
</div>
