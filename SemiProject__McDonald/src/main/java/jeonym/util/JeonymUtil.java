package jeonym.util;

public class JeonymUtil {

	
	// 만약 들어온 문자열이 null 이라면 공백을 리턴
	public static String null_to_empty(Object obj) { // 숫자나 문자열 둘다 들어올 수 있도록 obj 처리
		
		String result_str = obj+"";
		
		if(obj == null) {
		
			try {
				Integer.parseInt(obj + ""); // 숫자로 변환이 가능한 형태면 "0" 을 리턴
				result_str = "0";

			}catch(NumberFormatException e) { // 문자열 형태면 "" 리턴
				result_str = ""; 
			}
		
		}		
		return result_str;
			
	} // end of public static String null_to_empty(String str) ------------- 
}
