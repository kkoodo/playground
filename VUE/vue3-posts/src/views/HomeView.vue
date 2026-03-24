<template>
	<h2>Home</h2>
	<p>PATH : {{ $route.path }}</p>
	<button class="btn btn-primary" @click="goAboutPage">GO ABOUT</button>
	<hr />
	<p>$route : {{ $route }}</p>
</template>

<script setup>
import { useRouter } from 'vue-router';

const router = useRouter();
const goAboutPage = () => {
	console.log('>>> goAboutPage');
	router.push('/about');
};
</script>

<style lang="scss" scoped></style>
