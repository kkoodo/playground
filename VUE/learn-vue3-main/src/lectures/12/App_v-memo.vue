<template>
	<div>
		<div v-memo="[views, likes]">
			<p>subscribers: {{ subscribers }}</p>
			<p>views: {{ views }}</p>
			<p>likes: {{ likes }}</p>
		</div>
		<button @click="subscribers++">Subs++</button>
		<button @click="views++">Views++</button>
		<button @click="likes++">Likes++</button>
		<div>
			<p>subscribers: {{ subscribers }}</p>
			<p>views: {{ views }}</p>
			<p>likes: {{ likes }}</p>
		</div>
	</div>
</template>

<script>
import { ref } from 'vue';

export default {
	setup() {
		const subscribers = ref(4000);
		const views = ref(400);
		const likes = ref(20);
		return { subscribers, views, likes };
	},
};
/*
[v-memo]
- 역할 : 렌더링 성능 최적화 (Vue 3.2+)
	React의 useMemo와 비슷한 역할입니다.
	화면의 특정 부분(DOM 트리)의 렌더링 결과를 '기억(캐싱)'해 두었다가, 
	내가 지정한 값이 바뀔 때만 다시 그리도록 통제하는 강력한 최적화 도구입니다.
- 동작 원리: 배열 안에 추적할 조건 값을 넣습니다. 
	그 값이 그대로면 Vue는 아예 가상 DOM 비교조차 건너뛰고 이전 렌더링 결과를 재사용합니다.
*/
</script>

<style lang="scss" scoped></style>
