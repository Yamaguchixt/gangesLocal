package util;

import java.math.BigDecimal;
import java.math.RoundingMode;


public class Test {
	public static void main(String[] args){
	double test = 3.0999999999996;
	BigDecimal bd = new BigDecimal(String.valueOf(test));
	double v1 = bd.setScale(0,RoundingMode.HALF_UP).doubleValue();
	double v2 = bd.setScale(1, RoundingMode.CEILING).doubleValue();
	System.out.println(v1 +"\n"+v2);
	}

}
