<script setup>
  defineProps ({
    bg:{
      type: String,
      default: 'bg-gray-100'
    }
  });
</script>

<template>
<div :class="`${bg} p-6 rounded-lg shadow-md`"><!-- ` is not '-->
  <slot></slot>
</div>
</template>