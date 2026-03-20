<template>
	<div>
		<!-- <form action="" @submit.prevent="save(title, contents)"> -->
		<form @submit.prevent>
			<input v-model.lazy="title" type="text" placeholder="Title" />
			<textarea v-model.lazy="contents" placeholder="Contents"></textarea>
			<hr />
			<!-- <button>저장</button> -->
			<button @click="save(title, contents)">저장</button>
		</form>
	</div>
</template>

<script>
import { ref, watchEffect } from 'vue';

export default {
	setup() {
		const title = ref('');
		const contents = ref('');

		const save = (title, contents) => {
			console.log(`저장되었습니다. title: ${title}, contents: ${contents}`);
		};
		watchEffect(() => {
			console.log('watchEffect');
			save(title.value, contents.value);
		});
		return { title, contents, save };
	},
};
/*
[watch (지정 감시 / 스나이퍼)]
- 감시 대상 : "너만 지켜볼 거야!" 하고 어떤 변수를 감시할지 직접 콕 집어서 지정해야 합니다. 
							(watch(감시할변수, 콜백함수))
- 값의 비교 : 이전 값(oldValue)과 새로운 값(newValue)을 모두 알 수 있습니다.
							("어? 아까는 10이었는데 지금은 20이네?" 하고 비교가 가능합니다.)
- 첫 실행 : 기본적으로 컴포넌트가 처음 렌더링될 때는 가만히 있다가, 
						지정한 값이 진짜로 바뀔 때만 처음으로 실행됩니다. (immediate 옵션으로 즉시 실행 가능)

[watchEffect (자동 감시 / 투망)]
- 감시 대상 : 대상을 지정할 필요 없이, 함수 안에서 쓰인 모든 반응형 변수를 알아서 다 감시합니다.
							(로직 안에 변수 A와 B를 썼다면, A나 B 둘 중 하나만 바뀌어도 알아서 감지하고 재실행됩니다.)
- 값의 비교 : 이전 값이 뭐였는지는 관심 없고, 그냥 지금 바뀐 최신 상태만 가지고 로직을 실행합니다.
							(새로운 값, 이전 값 인자가 없습니다.)
- 첫 실행 : 컴포넌트가 화면에 켜지자마자, 데이터가 바뀌기도 전에 무조건 즉시 1번 실행됩니다.
						(자기가 뭘 감시해야 하는지 파악하기 위해 일단 함수 안의 코드를 한 번 쫙 읽어보는 겁니다.)

💡 실무 사용처 요약:
[watch]
- "이전 값이랑 지금 값이랑 비교해야 해!", 또는 "딱 이 변수 하나만 명시적으로 감시하고 싶어!"

[watchEffect]
- "이전 값은 알 필요 없고, 그냥 이 로직 안에 있는 데이터 중 하나라도 바뀌면 이 행동(API 호출 등)을 알아서 다시 실행해 줘!"
*/
</script>

<style lang="scss" scoped></style>
