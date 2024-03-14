package kdy.dump.question08;

class Caller {
	
	private void init() {
		System.out.println("Initialized");
	}
	
	private void start() {
		init();
		System.out.println("Started");
	}
	
}

public class TestCall {
	
	public static void main(String[] args) {
		TestCall c = new TestCall();
		c.start();	// line n1
		c.init();	// line n2
	}
	
}