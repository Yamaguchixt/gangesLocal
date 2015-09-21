package util;
import org.json.simple.JSONArray;

public class JsonApi {
	public static JSONArray intArrayToJSONArray(int[] array){
		JSONArray jsonArray = new JSONArray();
		for(int j=0;j<array.length;j++){
			jsonArray.add(new Integer(array[j]));
		}
		return jsonArray;
	}
	public static JSONArray int2DArrayToJSONArray(int[][] array){
		JSONArray jsonArray = new JSONArray();
		for(int i=0; i < array.length; i++){
			jsonArray.add(intArrayToJSONArray(array[i]));
		}
		return jsonArray;
	}
}
