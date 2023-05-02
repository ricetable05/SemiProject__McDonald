package jangjh.member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface InterMemberDAO {
	
	// 회원가입을 해주는 메소드(tbl_member 테이블에 insert)
	int registerMember(MemberVO member) throws SQLException;
	
	// ID 중복검사(tbl_member 테이블에서 userid가 존재하면 true를 리턴해주고, userid가 존재하지 않으면 false를 리턴한다.)
	boolean idDulicateCheck(String userid) throws SQLException;
	
	// 이메일 중복검사(tbl_member 테이블에서 이메일 존재하면 true를 리턴해주고, userid가 존재하지 않으면 false를 리턴한다.)
	boolean emailDulicateCheck(String email) throws SQLException;
	
	// 입력받은 paraMap을 가지고 한명의 회원정보를 리턴시켜주는 메소드(로그인 처리)
	MemberVO selectOneMember(Map<String, String> paraMap)throws SQLException;
	
	// 아이디 찾기(성명, 이메일을 입력받아서 해당 사용자의 아이디를 알려준다.)
	String findUserid(Map<String, String> paraMap) throws SQLException;

	// 비밀번호 찾기(아이디, 이메일을 입력받아서 해당 사용자가 존재하는지 유무를 알려준다.)
	boolean isUserExist(Map<String, String> paraMap) throws SQLException;

	// 암호변경하기
	int pwdUpdate(Map<String, String> paraMap) throws SQLException;

	// 암호 변경시 현재 사용중인 암호인지 아닌지 알아오기
	int duplicatePwdCheck(Map<String, String> paraMap) throws SQLException;

	// 회원의 개인 정보 변경하기
	int updateMember(MemberVO member) throws SQLException;
	
	// 페이징 철를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;
	
	// 페이징 처리한 모든 회원 또는 검색한 회원 목록 보여주기
	List<MemberVO> selectPagingMember(Map<String, String> paraMap) throws SQLException;
	
	// userid 값을 입력받아서 회원 1명에 대한 상세정보를 알아오기
	MemberVO memberOneDetail(String userid) throws SQLException;
	
	// 휴면 계정 풀기를 위해서 login_date 업데이트하기
	int login_date_insert(String userid, String access_ip) throws SQLException;
	
	// 계정 탈퇴
	int deleteMember(String userid) throws SQLException;


	
	
}
