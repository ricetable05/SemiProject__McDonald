package jangjh.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;


public class MemberDAO implements InterMemberDAO {
	
	private DataSource ds;    // DataSource ds 는 아파치톰켓이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	// 사용한 자원을 반납하는 close() 매소드 생성하기
	private void close() {
		try {
			if(rs != null) { rs.close(); rs=null;}
			if(pstmt != null) { pstmt.close(); pstmt=null;}
			if(conn != null) { conn.close(); conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// 생성자
	public MemberDAO() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");      // lookup(이름) 이 중요한 것이다. web.xml 부분의 이름, context.xml 이름과 모두 같아야 한다. 이 것이 배치 서술자인 web.xml 로 가고 context.xml 로 간다. 
		    
		    aes = new AES256(SecretMyKey.KEY);
		    // SecretMyKey 우리끼리 만든 암호화(복호화) 키이다.
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    
	}

	// 회원가입을 해주는 메소드(tbl_member 테이블에 insert)
	@Override
	public int registerMember(MemberVO member) throws SQLException {
		int result = 0;
		
		try {
			
		   conn = ds.getConnection();
		   
		   String sql = " insert into tbl_member(userid, pwd, member_name, email, member_tel, postcode, address, detail_address, ref_address, birthday) "
		   			  + " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		   
		   pstmt = conn.prepareStatement(sql);
		   
		   pstmt.setString(1,member.getUserid());
		   pstmt.setString(2,Sha256.encrypt(member.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화시킨다.
		   pstmt.setString(3,member.getMember_name());
		   pstmt.setString(4,aes.encrypt(member.getEmail()));  // 이메일을 AES256 알고리즘으로 양방향 암호화시킨다.
		   pstmt.setString(5,aes.encrypt(member.getMember_tel())); // 휴대폰번호를 AES256 알고리즘으로 양방향 암호화시킨다.
		   pstmt.setString(6,member.getPostcode());
		   pstmt.setString(7,member.getAddress());
		   pstmt.setString(8,member.getDetail_address());
		   pstmt.setString(9,member.getRef_address());
		   pstmt.setString(10,member.getBirthday());
		   
		   result = pstmt.executeUpdate();
		   
		}catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return result;	
	}//end of public int registerMember(MemberVO member) throws SQLException -----------

	//ID 중복검사(tbl_member 테이블에서 userid가 존재하면 true를 리턴해주고, userid가 존재하지 않으면 false를 리턴한다.)
	@Override
	public boolean idDulicateCheck(String userid) throws SQLException {
		boolean isExists = false;
		
		try {
			 conn = ds.getConnection();	
			
			 String sql = " select * "
					    + " from tbl_member "
					    + " where userid = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1,userid);
			 
			 rs = pstmt.executeQuery();
			 
			 isExists = rs.next(); // 행이 있으면(중복된 userid) true,
			 			           // 행이 없으면(사용가능한 userid) false
			 
		} finally {
			close();
		}
		
		return isExists;
	}//end of public boolean idDulicateCheck(String userid) throws SQLException 


	//이메일 중복검사(tbl_member 테이블에서 이메일이 존재하면 true를 리턴해주고, userid가 존재하지 않으면 false를 리턴한다.)
		@Override
		public boolean emailDulicateCheck(String email) throws SQLException {
			
			boolean isExists = false;
			
			try {
				 conn = ds.getConnection();	
				
				 String sql = " select email "
						    + " from tbl_member "
						    + " where email = ? ";
				 
				 pstmt = conn.prepareStatement(sql);
				 
				 pstmt.setString(1,aes.encrypt(email));
				 
				 rs = pstmt.executeQuery();
				 
				 isExists = rs.next(); // 행이 있으면(중복된 email) true,
				 			           // 행이 없으면(사용가능한 email) false
				 
			}catch(GeneralSecurityException | UnsupportedEncodingException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return isExists;
		}//end of public boolean emailDulicateCheck(String email) throws SQLException ------------
		

}
