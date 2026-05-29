<template>
  <section class="task-panel">
    <h2>{{ title }}</h2>
    <ul>
      <li v-for="task in openTasks" :key="task.id">{{ task.title }}</li>
    </ul>
  </section>
</template>

<script setup lang="ts">
import { computed } from "vue";

const props = defineProps<{
  title: string;
  tasks: Array<{ id: string; title: string; status: "todo" | "doing" | "done" }>;
}>();

const openTasks = computed(() => props.tasks.filter((task) => task.status !== "done"));
</script>

<style scoped>
.task-panel {
  padding: 1rem;
}
</style>
