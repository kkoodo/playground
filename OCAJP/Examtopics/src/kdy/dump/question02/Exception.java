package kdy.dump.question02;

public class Exception {

	public static void main(String[] args) {
		Exception exp = new Exception();
		
		/* case expressions must be constant expressions */
		int num1 = 1;
		int num2 = 1;
		
		switch(num2) {
		case num1: System.out.println("true");
		break;
		}
		
		/* Normal operation */
		final String name1 = "str";
		String name2 = "str";
		
		switch(name2) {
		case name1 : System.out.println("true");
		}
	}

}