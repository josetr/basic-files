<script lang="ts">
  export let title: string;
  export let status: "todo" | "doing" | "done" = "todo";

  $: isDone = status === "done";
</script>

<article class:done={isDone}>
  <h2>{title}</h2>
  <slot />
</article>

<style>
  article {
    border-left: 4px solid currentColor;
    padding: 1rem;
  }

  .done {
    opacity: 0.65;
  }
</style>
