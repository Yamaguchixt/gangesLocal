package util;

public class Util {
	public static int[][] mapStringToInt2DArray(String array){
		/*
		* 引数: "[[1,2,345,-1],[5,5,-123],[1,7,6]]" こんな感じの文字列
		* [[と]]をtrimして ],を区切り文字として一次配列に分解
		* 一次配列を,で区切ってint変換していき、配列に格納する
		* JavaのMapをJSON型に変換するときに使う
		*/
		array = array.replaceAll("(\\[\\[|\\]\\])","");
		String[] arrays = array.split("\\],");
		int[][] result = new int[arrays.length][];
		for(int i=0;i<arrays.length;i++){
			String[] target = arrays[i].replaceAll("\\[","").split(",");
			int[] tmp = new int[target.length];
			for(int j=0;j<target.length;j++){
				tmp[j] = Integer.parseInt(target[j]);
			}
			result[i] = tmp;
		}
		return result;
	}
	/*MapはJava DB上では描画情報は文字列でやり取りするのでこのメソッドはたぶん使わない
	 *
	 *
	 */
	public static String mapInt2DArrayToString(int[][] array){
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		for(int[] i:array){
			sb.append("[");
			for(int j:i){
				sb.append(new Integer(j).toString()).append(",");
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append("]").append(",");
		}
		sb.deleteCharAt(sb.length()-1);
		sb.append("]");

		return sb.toString();
	}
}
