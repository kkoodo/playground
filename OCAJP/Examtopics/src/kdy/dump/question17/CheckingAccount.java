package kdy.dump.question17;

public class CheckingAccount {

	public int amount;
	public CheckingAccount(int amount) {
		this.amount = amount;
	}
	public int getAmount() {return amount;}
	public void setAmount(int amount) {this.amount = amount;}
	public void changeAmount(int x) {
		amount += x;
	}
}