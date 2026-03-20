<template>
	<div>
		<p>{{ message }}</p>
		<button v-on:click="addMessage">add click</button>
	</div>
</template>

<script>
import { ref } from 'vue';

export default {
	setup() {
		let message = ref('Hello Vue!');

		const addMessage = () => {
			message.value = message.value + '!';
		};
		console.log(message);
		console.log('message: ', message.value);
		console.log('message typeof: ', typeof message.value);
		return {
			message,
			addMessage,
		};
	},
};

// test reactive
// import { reactive } from 'vue';

// export default {
// 	setup() {
// 		let message = reactive('Hello Vue!');

// 		const addMessage = () => {
// 			message = message + '!';
// 		};

// 		console.log(message);
// 		console.log('message typeof: ', typeof message);

// 		return {
// 			message,
// 			addMessage,
// 		};
// 	},
// };
</script>

<style lang="scss" scoped></style>
