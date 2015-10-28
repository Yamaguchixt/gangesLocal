package util;

import java.util.HashMap;

import paypal.paypalfunctions;





public class Test {
	public static void main(String[] args) throws Exception {

	HashMap<String,String> test = new HashMap<>();
	test.put("key1","value1");
	paypalfunctions.showNvp(test);
	}
}
