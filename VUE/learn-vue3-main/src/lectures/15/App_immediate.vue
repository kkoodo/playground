<template>
	<div>
		<p>{{ message }}</p>
		<p>{{ reverseMessage }}</p>
	</div>
</template>

<script>
import { ref, watch } from 'vue';

export default {
	setup() {
		const message = ref('Hello Vue3');
		const reverseMessage = ref('');

		const reverseFunction = () => {
			console.log('즉시실행함!!!');
			reverseMessage.value = message.value.split('').reverse().join('');
		};
		watch(message, reverseFunction);
		reverseFunction();
		return { message, reverseMessage };
	},
};
/*
[computed]
- 설명
	기존 데이터를 조합해서 "새로운 값을 계산(조작)할 때" 씁니다.
	엑셀의 "수식" 같습니다.
	A셀에 10, B셀에 20이 있을 때, C셀에 =A+B 라고 적어두는 것과 같습니다.
	A나 B가 바뀌면 C는 알아서 30으로 바뀝니다. 결과를 화면에 보여주기 위한 용도입니다.

- 요약 : [computed (계산기)]
	* 핵심 역할: 기존 데이터를 바탕으로 새로운 값을 계산해 냅니다.
	* 반환값(Return): 화면이나 다른 곳에서 그 값을 써야 하므로 
										**반드시 결과값을 반환(return)**해야 합니다.
	* 캐싱 기능 (⭕): 원본 데이터가 바뀌지 않았다면, 
										굳이 다시 계산하지 않고 이전에 계산해 둔 값을 재사용하여 성능을 높입니다.
	* 비동기 작업 (❌): 단순 계산용이므로 내부에서 서버 통신(API 요청)이나 타이머 같은 
											비동기 작업을 하면 안 됩니다.

- 예시
  * 장바구니 배열의 총합계 금액을 구할 때
  * firstName과 lastName을 합쳐서 fullName을 만들 때
  * 게시물 리스트에서 '공지사항'만 필터링해서 보여줄 때

[watch]
- 설명
	특정 데이터가 바뀌었을 때 "어떤 행동(API 호출, 알람 띄우기 등)을 할 때" 씁니다.
	watch는 "알람 시계" 같습니다.
	"온도가 30도를 넘어가면 -> 에어컨을 켜라!" 처럼, 어떤 값이 변하는 걸 가만히 지켜보고 있다가 
	**조건이 맞으면 행동(Side Effect)**을 개시합니다.

- 요약 : [watch (감시 카메라)]
	* 핵심 역할: 특정 데이터가 변경되는지 지켜보다가, 바뀌면 특정 행동(로직)을 실행합니다.
	* 반환값(Return): 무언가를 실행하는 것이 목적이므로 반환값이 필요 없습니다.
	* 캐싱 기능 (❌): 캐싱 없이, 지켜보던 데이터가 바뀔 때마다 
										무조건 지정된 함수를 매번 실행합니다.
	* 비동기 작업 (⭕): 값이 바뀔 때 서버에 데이터를 요청하거나, 
											알림 팝업을 띄우는 등의 비동기 작업이나 
											부가적인 조작(Side Effect)을 처리하는 데 아주 적합합니다.

- 예시
  * 검색어(searchKeyword) 입력창에 글자가 바뀔 때마다 서버에 검색 API를 요청할 때
  * 유저가 '저장' 버튼을 눌러 상태값이 변하면 "저장되었습니다"라는 알람 팝업을 띄울 때
  * URL 라우터(경로)가 변경되었을 때 스크롤을 맨 위로 올릴 때
*/
</script>

<style lang="scss" scoped></style>
