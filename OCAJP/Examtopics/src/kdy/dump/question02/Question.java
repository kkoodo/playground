package kdy.dump.question02;

import java.util.Scanner;

public class Question {

	public static void main(String[] args) throws Exception {
        String question = "Which statement is true about the switch statement?";
        String answerA = "A. It must contain the default section.";
        String answerB = "B. The break statement, at the end of each case block, is optional.";
        String answerC = "C. Its case label literals can be changed at runtime.";
        String answerD = "D. Its expression must evaluate to a collection of values.";
        String ko_answer = "A. default ������ �����ؾ��մϴ�." + "\n"
                            + "�� default ������ ���� �����Դϴ�." + "\n"
                            + "B. �� case ����� ���� �ִ� break ���� ���û����Դϴ�." + "\n"
                            + "�� �����Դϴ�." + "\n"
                            + "C. case�� ���ͷ� ���� ��Ÿ�� ������ ����� �� �ֽ��ϴ�." + "\n"
                            + "�� case�� ���ͷ� ���� ���� �����(final constant value)�̾�� �մϴ�." + "\n"
                            + "D. �ش� ǥ������ �÷������� �򰡵Ǿ�� �մϴ�." + "\n"
                            + "�� Java�� Collection���� List, Set ���� �ֽ��ϴ�.";

        Scanner scanner = new Scanner(System.in);
        System.out.println(question + "\n\n" + answerA + "\n" + answerB + "\n" + answerC + "\n" + answerD);
        
        System.out.print("\nEnter the answer : ");
        String answer = scanner.nextLine();
        
        if(answer.equals("B")) {
            System.out.println("\nCorrect answer.\n\nThe Korean interpretation is as follows.\n");
            System.out.println(ko_answer);
        } else {
            System.out.println("\nCorrect answer is \"B\".\n\nThe Korean interpretation is as follows.\n");
            System.out.println(ko_answer);
        }
    }

}