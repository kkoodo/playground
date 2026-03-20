<template>
	<div>
		<div :style="styleObject">
			Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae enim
			nostrum molestiae earum nesciunt ad, totam perspiciatis consequuntur
			consectetur, quidem, cumque eveniet odit excepturi amet eum nisi veritatis
			similique veniam!
		</div>
		<button v-on:click="fontSize--">-</button>
		<button v-on:click="fontSize++">+</button>
	</div>
</template>

<script>
import { computed, reactive, ref } from 'vue';

export default {
	setup() {
		// const styleObject = reactive({
		// 	color: 'red',
		// 	fontSize: '13px',
		// });
		const fontSize = ref(13);
		const styleObject = computed(() => {
			return {
				color: 'red',
				fontSize: fontSize.value + 'px',
			};
		});
		return { styleObject, fontSize };
	},
};

/*
1. <script> 내부 (자바스크립트 로직): .value 필수 ⭕
- ref나 computed로 만든 변수는 하나의 '상자'로 포장되어 있습니다. 
- 그 상자 안의 실제 값을 꺼내거나 수정하려면 자바스크립트에서는 반드시 .value를 붙여야 합니다.

=> ref() / computed(): .value 사용함
=> 숫자, 문자열, 불리언 같은 단일 값(원시 타입)을 반응형으로 만들 때 주로 씁니다. (물론 객체를 넣어도 됩니다.)

2. <template> 내부 (HTML 화면): .value 생략 ❌
- Vue는 똑똑해서 화면에 값을 그릴 때(템플릿 엔진을 거칠 때) '상자'를 알아서 까줍니다(Auto Unwrapping). 
- 그래서 .value 없이 변수 이름만 적어도 화면에 잘 나옵니다.

=> reactive(): .value 절대 안 씀 (어디서든)
=> 객체(Object)나 배열(Array) 전용입니다.
=> 이 친구는 변수 자체가 이미 속성들을 바로 꺼내 쓸 수 있는 상태(Proxy)로 만들어지기 때문에, 
=> <script>이든 <template>이든 .value라는 개념 자체가 없습니다.
*/
</script>

<style lang="scss" scoped></style>
