<template>
	<div>
		<h2 v-if="visible">Hello Vue3!</h2>
		<h2 v-else>false 입니다.</h2>
		<button v-on:click="visible = !visible">toggle</button>
		<hr />
		<button v-on:click="type = 'A'">A</button>
		<button v-on:click="type = 'B'">B</button>
		<button v-on:click="type = 'C'">C</button>
		<button v-on:click="type = 'D'">D</button>

		<h2 v-if="type === 'A'">A입니다.</h2>
		<h2 v-else-if="type === 'B'">B입니다.</h2>
		<h2 v-else-if="type === 'C'">C입니다.</h2>
		<h2 v-else>A, B, C가 아닙니다.</h2>
		<hr />
		<template v-if="visible">
			<h1>Title</h1>
			<p>Paragraph 1</p>
			<p>Paragraph 2</p>
		</template>
		<hr />
		<h1 v-show="ok">Title 입니다.</h1>
		<button v-on:click="ok = !ok">show toggle</button>
	</div>
</template>

<script>
import { ref } from 'vue';

export default {
	setup() {
		const visible = ref(false);
		const type = ref('A');
		const ok = ref(true);
		return { visible, type, ok };
	},
};
/*
[v-if 와 v-show 핵심 차이]
- v-if (진짜로 지우고 만듦): 조건에 따라 DOM 요소를 실제로 '생성'하거나 '파괴'합니다.
- v-show (눈가림): 조건과 상관없이 일단 무조건 DOM에 렌더링한 후, CSS(display: none)를 이용해 화면에서 숨기기만 합니다.

[비용 비교]
- 초기 렌더링 비용: v-if는 낮음 (초기값이 false면 아예 안 그림) / v-show는 높음 (false여도 일단 무조건 그림)
- 토글(전환) 비용: v-if는 높음 (상태가 바뀔 때마다 다시 만들고 지움) / v-show는 낮음 (CSS만 껐다 켰다 함)

[공식 문서 권장 사용처]
- v-show를 쓸 때 (자주 껐다 켰다 할 때):
=> 모달(Modal) 창, 드롭다운 메뉴, 탭(Tab) 전환 등. 화면을 자주 끄고 켜야 해서 전환 속도가 중요할 때 씁니다.

- v-if를 쓸 때 (조건이 거의 안 바뀔 때):
=> 관리자 권한에 따른 메뉴 노출, 데이터가 완전히 로딩된 후 화면 그리기 등. 불필요한 초기 렌더링을 막아 메모리를 아끼고 싶을 때 씁니다.
*/
</script>

<style lang="scss" scoped></style>
