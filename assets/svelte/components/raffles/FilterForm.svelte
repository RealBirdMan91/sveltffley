<script lang="ts">
  import { Input } from "$lib/components/ui/input/index";
  import * as Select from "$lib/components/ui/select/index";
  import type { Params } from "$lib/RafflesList.svelte";

  type Props = { values: Params; onFilterChange: (params: Params) => void };
  type Status = { value: Params["status"]; label: string };
  type SortBy = { value: Params["sort_by"]; label: string };

  const status: Status[] = [
    { value: "", label: "Select a status" },
    { value: "upcoming", label: "Upcoming" },
    { value: "open", label: "Open" },
    { value: "closed", label: "Closed" },
  ];
  const sort_by: SortBy[] = [
    { value: "", label: "Sort by" },
    { value: "prize", label: "Prize" },
    { value: "ticket_price", label: "Ticket Price" },
  ];

  const { values, onFilterChange }: Props = $props();
</script>

<div class="flex gap-2">
  <Input
    value={values.query}
    onkeyup={(e) =>
      onFilterChange({
        ...values,
        query: (e.target as HTMLInputElement).value,
      })}
    type="text"
    placeholder="Search..."
    autocomplete="off"
    class="w-[280px]"
  />
  <Select.Root
    items={status}
    selected={status.find((s) => s.value === values.status)}
    onSelectedChange={(field) => {
      field && onFilterChange({ ...values, status: field.value });
    }}
  >
    <Select.Trigger class="w-[180px]">
      <Select.Value />
    </Select.Trigger>
    <Select.Content>
      {#each status as { value: v, label: l }}
        <Select.Item value={v}>{l}</Select.Item>
      {/each}
    </Select.Content>
  </Select.Root>
  <Select.Root
    items={sort_by}
    selected={sort_by.find((s) => s.value === values.sort_by)}
    onSelectedChange={(field) => {
      field && onFilterChange({ ...values, sort_by: field.value });
    }}
  >
    <Select.Trigger class="w-[180px]">
      <Select.Value />
    </Select.Trigger>
    <Select.Content>
      {#each sort_by as { value: v, label: l }}
        <Select.Item value={v}>{l}</Select.Item>
      {/each}
    </Select.Content>
  </Select.Root>
</div>
