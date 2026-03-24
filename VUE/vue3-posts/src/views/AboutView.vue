<template>
	<h2>About</h2>
	<p>PATH : {{ $route.path }}</p>
	<p>NAME : {{ $route.name }}</p>
	<button class="btn btn-primary" @click="$router.push('/')">GO HOME</button>
</template>

<script setup>
import { useRoute } from 'vue-router';

const route = useRoute();
console.log('path : ', route.path);
console.dir(route);
</script>

<style lang="scss" scoped></style>
