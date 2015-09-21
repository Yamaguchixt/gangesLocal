package util;


public class Test {
	public static void main(String[] args){
		String test = "1111\n2222\n";
		System.out.println(test);
		System.out.println(test.replaceAll("(a|\n)",""));
	}

}
