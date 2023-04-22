package jangjh.member.model;

import java.sql.SQLException;

public interface InterMemberDAO {
	
	// 회원가입을 해주는 메소드(tbl_member 테이블에 insert)
	int registerMember(MemberVO member) throws SQLException;
	
	//ID 중복검사(tbl_member 테이블에서 userid가 존재하면 true를 리턴해주고, userid가 존재하지 않으면 false를 리턴한다.)
	boolean idDulicateCheck(String userid) throws SQLException;
	
	//이메일 중복검사(tbl_member 테이블에서 이메일 존재하면 true를 리턴해주고, userid가 존재하지 않으면 false를 리턴한다.)
	boolean emailDulicateCheck(String email) throws SQLException;

	
	
}
