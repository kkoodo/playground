package kdy.dump.question09;

public class Customer {

	ElectricAccount acct = new ElectricAccount();
	public void useElectricity(double kWh) {
		acct.addKWh(kWh);
	}
}