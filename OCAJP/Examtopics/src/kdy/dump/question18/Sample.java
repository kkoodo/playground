package kdy.dump.question18;

public class Sample {

	public static void main(String[] args) {
		
		/* 향상된 for 문의 사용법 */
		int arr[][] = new int[2][2];
		arr[0][0] = 0;
		arr[0][1] = 1;
		arr[1][0] = 2;
		arr[1][1] = 3;
		
		for(int[] element1 : arr) {
			for(int element2 : element1) {
				System.out.print(element2 + " / ");	// 0 / 1 / 2 / 3 / 
			}
		}
		
	}
}