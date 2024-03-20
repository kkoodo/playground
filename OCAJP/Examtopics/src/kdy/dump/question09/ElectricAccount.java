package kdy.dump.question09;

public class ElectricAccount {
	
	private double kWh;
	private double rate = 0.07;
	private double bill;
	
	// line n1
	/* A */
//	public void addKWh(double kWh) {
//		this.kWh += kWh;
//		this.bill = this.kWh * this.rate;
////		System.out.println("kWh" + kWh);
////		System.out.println("bill" + bill);
//	}
	
	/* B */
//	public void addKWh(double kWh) {
//		if(kWh > 0) {
//			this.kWh += kWh;
//			this.bill = this.kWh * this.rate;
//		}
//	}
	
	/* C */
	// The method addKWh(double) from the type ElectricAccount is not visible
//	private void addKWh(double kWh) {
//		if(kWh > 0) {
//			this.kWh += kWh;
//			this.bill = this.kWh * this.rate;
//		}
//	}
	
	/* D */
//	public void addKWh(double kWh) {
//		if(kWh > 0) {
//			this.kWh += kWh;
//			this.bill = this.kWh * this.rate;
//		}
//	}
//	public void setBill(double kWh) {
//		bill = kWh * rate;
//	}
}
