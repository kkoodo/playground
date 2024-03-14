package kdy.dump.question03;

public class Question {

	public static void main(String[] args) {
		String date = LocalDate.parse("2014-05-04").format(DateTimeFormatter.ISO_DATE_TIME);
		System.out.println(date);
		
		String date2 = LocalDate.parse("2014-05-04");
		System.out.println(date);
		
		String date3 = LocalDate();
		System.out.println(date);
	}
}