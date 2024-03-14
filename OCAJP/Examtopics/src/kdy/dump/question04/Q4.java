package kdy.dump.question04;

public class Q4 {

	public static void main(String[] args) {
		Short s1 = 200;
		Integer s2 = 400;
		Long s3 = (long) s1 + s2;        // line n1
		String s4 = (String) (s3 * s2);  // line n2
		System.out.println("Sum is " + s4);
	}

}
