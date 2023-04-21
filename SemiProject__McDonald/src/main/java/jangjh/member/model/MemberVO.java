package jangjh.member.model;

import java.util.Calendar;

public class MemberVO {

	// insert 용도
	private String userid;       		// 회원아이디
	private String pwd;          		// 비밀번호 (SHA-256 암호화 대상) 한번 암호화를 시키면 복호화가 불가능하다. 오직 회원만 알고 있음
	private String member_name;         // 회원명
	private String email;        		// 이메일 (AES-256 암호화/복호화 대상) 복호화가 가능하다.
	private String member_tel;          // 연락처 (AES-256 암호화/복호화 대상) 복호화가 가능하다.
	private String postcode;     		// 우편번호
	private String address;      		// 주소
	private String detail_address;		//상세 주소
	private String ref_address; 		// 참고항목
	private String birthday;     		// 생년월일 
	private String registerday;  		// 가입일자 
	private String last_pwd_change_date;// 마지막으로 암호를 변경한 날짜 (비밀번호 변경 권유하기 위해) 
	private int is_deactivate; 		 	// 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
	private int is_dormant;  			// 휴면유무      0: 활동중 / 1: 휴면중 
								 		// 마지막으로 로그인한 날짜시간이 현재시각으로부터 1년이 지났으면 휴면으로 지정
	
	//==============================================================================================================//

	// select 용도
	private boolean requirePwdChange = false;
	//  마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
	//  마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false 


	public MemberVO() {} // 기본생성자를 만든다.
	
	public MemberVO(String userid, String pwd, String member_name, String email, String member_tel, String postcode,
			String address, String detail_address, String ref_address, String birthday, String registerday,
			String last_pwd_change_date, int is_deactivate, int is_dormant, boolean requirePwdChange) {
		
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.member_name = member_name;
		this.email = email;
		this.member_tel = member_tel;
		this.postcode = postcode;
		this.address = address;
		this.detail_address = detail_address;
		this.ref_address = ref_address;
		this.birthday = birthday;
		this.registerday = registerday;
		this.last_pwd_change_date = last_pwd_change_date;
		this.is_deactivate = is_deactivate;
		this.is_dormant = is_dormant;
		this.requirePwdChange = requirePwdChange;
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	

	public String getUserid() {
		return userid;
	}




	public void setUserid(String userid) {
		this.userid = userid;
	}




	public String getPwd() {
		return pwd;
	}




	public void setPwd(String pwd) {
		this.pwd = pwd;
	}




	public String getMember_name() {
		return member_name;
	}




	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getMember_tel() {
		return member_tel;
	}




	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}




	public String getPostcode() {
		return postcode;
	}




	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getDetail_address() {
		return detail_address;
	}




	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}




	public String getRef_address() {
		return ref_address;
	}




	public void setRef_address(String ref_address) {
		this.ref_address = ref_address;
	}




	public String getBirthday() {
		return birthday;
	}




	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}




	public String getRegisterday() {
		return registerday;
	}




	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}




	public String getLast_pwd_change_date() {
		return last_pwd_change_date;
	}




	public void setLast_pwd_change_date(String last_pwd_change_date) {
		this.last_pwd_change_date = last_pwd_change_date;
	}




	public int getIs_deactivate() {
		return is_deactivate;
	}




	public void setIs_deactivate(int is_deactivate) {
		this.is_deactivate = is_deactivate;
	}




	public int getIs_dormant() {
		return is_dormant;
	}




	public void setIs_dormant(int is_dormant) {
		this.is_dormant = is_dormant;
	}




	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}




	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}




	public int getAge() {
		
		int age = 0;
		
		// 현재 날짜와 시간을 얻어온다.
		Calendar currentDate = Calendar.getInstance();
		int currentYear = currentDate.get(Calendar.YEAR);
		
		age = currentYear - Integer.parseInt(birthday.substring(0, 4)) + 1;
	
		return age;
	}
	
	
}
