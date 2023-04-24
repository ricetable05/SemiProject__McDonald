package jeonym.util;

public class JeonymUtil {

	
	// 만약 들어온 문자열이 null 이라면 공백을 리턴
	public static String null_to_empty(Object obj) { // 숫자나 문자열 둘다 들어올 수 있도록 obj 처리
		
		String result_str = null;
		
		if(obj == null) {		
			result_str = "0"; // null 이라면 "0"		
		}
		else {
			result_str = String.valueOf(obj); // 아니라면 문자열화 해서 리턴
		}
		
		return result_str;
			
	} // end of public static String null_to_empty(String str) ------------- 
}
