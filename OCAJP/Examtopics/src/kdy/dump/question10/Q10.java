package kdy.dump.question10;

public class Q10 {

	public static void main(String[] args) {
		
		StringBuilder sb = new StringBuilder("Java");
		String s = "Java";

		if(sb.toString().equals(s.toString())) {
			System.out.println("Match 1");
		} else if(sb.equals(s)) {
			System.out.println("Match 2");
		} else {
			System.out.println("No Match");
		}
		
		if(sb.equals(s)) System.out.println("sb.equals(s) : TRUE");
		if(sb.equals(s.toString())) System.out.println("sb.equals(s.toString()) : TRUE");
		if(sb.toString().equals(s)) System.out.println("sb.toString().equals(s) : TRUE");
	}

}