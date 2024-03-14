package kdy.dump.question02;

import java.util.Scanner;

public class Question {

	public static void main(String[] args) throws Exception {
        String question = "Which statement is true about the switch statement?";
        String answerA = "A. It must contain the default section.";
        String answerB = "B. The break statement, at the end of each case block, is optional.";
        String answerC = "C. Its case label literals can be changed at runtime.";
        String answerD = "D. Its expression must evaluate to a collection of values.";
        String ko_answer = "A. default 섹션을 포함해야합니다." + "\n"
                            + "→ default 섹션은 선택 사항입니다." + "\n"
                            + "B. 각 case 블록의 끝에 있는 break 문은 선택사항입니다." + "\n"
                            + "→ 정답입니다." + "\n"
                            + "C. case의 리터럴 라벨은 런타임 시점에 변경될 수 있습니다." + "\n"
                            + "→ case의 리터럴 라벨은 최종 상수값(final constant value)이어야 합니다." + "\n"
                            + "D. 해당 표현식은 컬렉션으로 평가되어야 합니다." + "\n"
                            + "→ Java의 Collection에는 List, Set 등이 있습니다.";

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