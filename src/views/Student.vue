<script setup>
import { ref } from 'vue';
import Table from '@/components/Table.vue';
import resData from '@/ress.json';

const items = ref([...resData]);
</script>

<template>
    <Table :items="items" />
</template>