package kdy.dump.question20;

public class Q20 {

	public static void main(String[] args) {
		int x = 5;
		while(isAvailable(x)) {
			System.out.print(x);
			x --;
		}
	}

	public static boolean isAvailable(int x) {
		return x-- > 0 ? true : false;
	}
	
}