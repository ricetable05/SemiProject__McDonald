package jangjh.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

		// 임력받은 paraMap을 가지고 한명의 회원정보를 리턴시켜주는 메소드(로그인 처리)
		@Override
		public MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException {
			
			MemberVO member = null;
			
			try {
				conn = ds.getConnection();
				
				String sql = " select userid, member_name, email, member_tel, postcode, address, detail_address, ref_address,         \n"+
							" substr(birthday,1,4) AS birthyyyy, substr(birthday,5,2) As birthmm, substr(birthday,7) AS birthdd, registerday, pwdchangegap,        \n"+
							" NVL(lastlogingap,trunc( months_between(sysdate, registerday) )) AS lastlogingap   \n"+
							" from   \n"+
							" (select userid, member_name, email, member_tel, postcode, address, detail_address, ref_address       \n"+
							" ,  to_char(birthday,'yyyymmdd') as birthday , registerday        \n"+
							" , trunc(months_between(sysdate, last_pwd_change_date),0) AS pwdchangegap   \n"+
							" from tbl_member   \n"+
							" where is_deactivate = '1' and userid = ? and pwd= ?\n"+
							" ) M   \n"+
							" CROSS JOIN   \n"+
							" (   select trunc(months_between(sysdate, max(login_date))) AS lastlogingap   \n"+
							" from tbl_login_history where fk_userid = ? \n"+
							" ) H ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("userid"));
				pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")));
				pstmt.setString(3, paraMap.get("userid"));
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					member = new MemberVO();
					
					member.setUserid(rs.getString(1));
					member.setMember_name((rs.getString(2)));
					member.setEmail(aes.decrypt(rs.getString(3)));
					member.setMember_tel(aes.decrypt(rs.getString(4)));
					member.setPostcode(rs.getString(5));
					member.setAddress(rs.getString(6));
					member.setDetail_address(rs.getString(7));
					member.setRef_address(rs.getString(8));
					member.setBirthday(rs.getString(9) + rs.getString(10) + rs.getString(11) );
					member.setRegisterday(rs.getString(12));
					
					if( rs.getInt(13) >= 3) {
						//마지막으로 암호를 변경한 날짜가 현재시각으로부터 3개월이 지났으면 true
						//마지막으로 암호를 변경한 날짜가 현재시각으로부터 3개월이 지나지 않았으면 false
						
						member.setRequirePwdChange(true); // 로그인시 암호를 변경해라는 alert를 띄우도록 할 때 사용한다.
					}
					
					if(rs.getInt(14) >= 12) {
						//마지막으로 로그인한 날짜가 현재시각으로부터 1년이 지났으면 휴먼으로 지정
						
						member.setIs_dormant(1);
						
						// == tbl_member 테이블의 idle 컬럼의 값을 1로 변경하기 == //
						sql = " update tbl_member set is_dormant = 1 "
							+ " where userid = ? ";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, paraMap.get("userid"));
						
						pstmt.executeUpdate();
					}
					
					// == tbl_lastlogingap(로그인 기록) 테이블에 insert 하기 == //
					if(member.getIs_dormant()!= 1) {
						
						sql = " insert into tbl_login_history values(login_histroy_seq.nextval, ?, sysdate, ?) ";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, paraMap.get("userid"));
						pstmt.setString(2, paraMap.get("access_ip"));
						
						pstmt.executeUpdate();
					
					}
					
				}//end of if(rs.next()) ------------------------------------------------------
				
			}catch(GeneralSecurityException | UnsupportedEncodingException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return member;
		}//end of public MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException ----------


		// 아이디 찾기(성명, 이메일을 입력받아서 해당 사용자의 아이디를 알려준다.)
		@Override
		public String findUserid(Map<String, String> paraMap) throws SQLException {
			
			String userid = null;
			
			try {
				 conn = ds.getConnection();	
				
				 String sql = " select userid "+
						 	  " from tbl_member "+
							  " where is_deactivate = 1 and member_name = ? and email = ? ";
						 				 
				 pstmt = conn.prepareStatement(sql);
				 
				 pstmt.setString(1, paraMap.get("member_name"));
				 pstmt.setString(2, aes.encrypt(paraMap.get("email")));
				 
				 rs = pstmt.executeQuery();
				 
				 if(rs.next()) {
					 userid = rs.getString(1);
				 }
				 
			}catch(GeneralSecurityException | UnsupportedEncodingException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return userid;
		}//end of public String findUserid(Map<String, String> paraMap) throws SQLException  ---------


		// 비밀번호 찾기(아이디, 이메일을 입력받아서 해당 사용자가 존재하는지 유무를 알려준다.)
		@Override
		public boolean isUserExist(Map<String, String> paraMap) throws SQLException {
			
			boolean isUserExist = false;
			
			try {
				 conn = ds.getConnection();	
				
				 String sql = " select userid "
						    + " from tbl_member "
						    + " where is_deactivate = 1 and userid = ? and email = ? ";
				 
				 pstmt = conn.prepareStatement(sql);
				 
				 pstmt.setString(1,paraMap.get("userid"));
				 pstmt.setString(2, aes.encrypt(paraMap.get("email")));
				 
				 rs = pstmt.executeQuery();
				 
				 isUserExist = rs.next();
				 
			}catch(GeneralSecurityException | UnsupportedEncodingException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return isUserExist;
		}//end of public boolean isUserExist(Map<String, String> paraMap) ----------------------------


		// 암호변경하기
		@Override
		public int pwdUpdate(Map<String, String> paraMap) throws SQLException {
			
			int result = 0;
			
			try {
				
				   conn = ds.getConnection();
				   
				   String sql = " update tbl_member set pwd = ? "
						   	   +"                ,last_pwd_change_date = sysdate "	
						       +" where userid = ? ";
				   
				   pstmt = conn.prepareStatement(sql);
				   
				   pstmt.setString(1,Sha256.encrypt(paraMap.get("pwd")));
				   pstmt.setString(2,paraMap.get("userid"));
				   
				   result = pstmt.executeUpdate();
				   
				}finally {
					close();
				}
			
			return result;
		}


		// 암호 변경시 현재 사용중인 암호인지 아닌지 알아오기
		@Override
		public int duplicatePwdCheck(Map<String, String> paraMap) throws SQLException {

			int n = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql =  " select count(*) "
							+ " from tbl_member "
							+ " where userid = ? and pwd = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("userid"));
				pstmt.setString(2, Sha256.encrypt(paraMap.get("new_pwd")));
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				n = rs.getInt(1);
				
				
			}
			finally {
				close();
			}
			
			return n;
		}// end of public int duplicatePwdCheck(Map<String, String> paraMap) throws SQLException 

		
		// 회원의 개인 정보 변경하기
		@Override
		public int updateMember(MemberVO member) throws SQLException {

			int result = 0;	
			
			try {
				
				conn = ds.getConnection();   // datesourse 에서 가져옴
				
				String sql = " update tbl_member set pwd = ? "
						   + " 				   , member_name = ? "
						   + " 				   , email = ? "
						   + " 				   , member_tel = ? "
						   + " 				   , postcode = ? "
						   + " 				   , address = ? "
						   + " 				   , detail_address = ? "
						   + " 				   , ref_address = ? "
						   + " 				   , birthday = ? "
						   + " 				   , last_pwd_change_date = sysdate "
						   + " where userid = ? ";
				
				// 우편배달부
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, Sha256.encrypt(member.getPwd()));
				pstmt.setString(2, member.getMember_name());
				pstmt.setString(3, aes.encrypt(member.getEmail()));
				pstmt.setString(4, aes.encrypt(member.getMember_tel()));
				pstmt.setString(5, member.getPostcode());
				pstmt.setString(6, member.getAddress());
				pstmt.setString(7, member.getDetail_address());
				pstmt.setString(8, member.getRef_address());
				pstmt.setString(9, member.getBirthday());
				pstmt.setString(10, member.getUserid());
				
				result = pstmt.executeUpdate();
				
			}
			catch(GeneralSecurityException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			
			return result;
		} // end of public int updateMember(MemberVO member) throws SQLException {}----------


		// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
		@Override
		public int getTotalPage(Map<String, String> paraMap) throws SQLException {
			
			  int totalPage = 0;    
			  
		         try {
		        	 
		            conn = ds.getConnection();
		            
		            String sql = " select ceil(count(*)/?) "
		                       + " from tbl_member "
		                       + " where userid != 'admin' ";
		            
		            String colname = paraMap.get("searchType");
		            String searchWord = paraMap.get("searchWord");
		            
		            if( "email".equals(colname) ) {
		               // 검색대상이 email인 경우
		               searchWord = aes.encrypt(searchWord);
		            }
		            
		            if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty() ) {
		               sql += " and " + colname + " like '%'|| ? ||'%' " ;
		              
		            }
		                        
		            pstmt = conn.prepareStatement(sql); 
		                        
		            pstmt.setString(1, paraMap.get("sizePerPage"));
		            
		            if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty() ) {
		               pstmt.setString(2, searchWord);
		            }
		            
		            rs = pstmt.executeQuery();
		            
		            rs.next();
		            
		            totalPage = rs.getInt(1);
		                     
		            
		         } catch(GeneralSecurityException | UnsupportedEncodingException e) {
		            e.printStackTrace();
		         } finally {
		            close();
		         }
		         
		         return totalPage;

		} // end of public int getTotalPage(Map<String, String> paraMap) {} 


		// ** 페이징 처리한 모든 회원 또는 검색한 회원 목록 보여주기 ** //
		@Override
		public List<MemberVO> selectPagingMember(Map<String, String> paraMap) throws SQLException {
			
			List<MemberVO> memberList = new ArrayList<>();
			
			try {
				conn = ds.getConnection();
				
				String sql = " select userid, member_name, email "+
				             "      from "+
				             "      ( "+
				             "      select rownum as RNO, userid, member_name, email "+
				             "      from "+
				             "      ( "+
				             "      select userid, member_name, email "+
				             "      from tbl_member "+
				             "      where userid != 'admin' ";
				
				String colname = paraMap.get("searchType");
				String searchWord = paraMap.get("searchWord");
				
				int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));  
				int sizePerPage =  Integer.parseInt(paraMap.get("sizePerPage"));
				
				if("email".equals(colname)) {
					// 검색대상이 email 인 경우
					searchWord = aes.encrypt(searchWord);
		
				}
				
				if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
					
					sql += " and " + colname + " like '%' || ? || '%' "; // 이메일은 암호화 처리되기 때문에 전체 이메일을 검색창에 입력해야한다.
					
				}
				
					sql +=    "  order by registerday desc "
							+ "        "
							+ "      ) V "
							+ "  ) T "
							+ "  WHERE RNO between ? and ? ";
				
				pstmt = conn.prepareStatement(sql);
				
		/*
			  === 페이징 처리 공식 === 
			  WHERE RNO between (조회하고자하는 페이지번호 * 한페이지당 보여줄 행의개수) - (한페이지당보여줄 행의개수 - 1) and (조회하고자하는 페이지번호 * 한페이지당 보여줄 행의개수);
		 */
				
				if(!"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) { // 검색어가 있는 경우
					pstmt.setString(1, searchWord);
					pstmt.setInt(2,(currentShowPageNo * sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(3,(currentShowPageNo * sizePerPage));
				}
				else { // 검색이 없는 경우
					pstmt.setInt(1,(currentShowPageNo * sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(2,(currentShowPageNo * sizePerPage));
				}
		
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					MemberVO member = new MemberVO();
					
					member.setUserid(rs.getString("userid"));
					member.setMember_name(rs.getString("member_name"));
					member.setEmail(aes.decrypt(rs.getString("email"))); // 복호화 해야한다.
					
					memberList.add(member);
				} // end of while(rs.next)) ----------------------------------------------------------------------
				
			}
			catch(GeneralSecurityException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			
			return memberList;
		}
		// end of public List<MemberVO> selectPagingMember(Map<String, String> paraMap) throws SQLException {} ----------


		// userid 값을 입력받아서 회원 1명에 대한 상세정보를 알아오기
		@Override
		public MemberVO memberOneDetail(String userid) throws SQLException {
			
			MemberVO member = null;
			
			try {
				conn = ds.getConnection();
				
				String sql = " select userid, member_name, email, member_tel, postcode, address, detail_address, ref_address "+
							 " , substr(birthday,1,4) AS birthyyyy ,substr(birthday,5,2) AS birthmm "+
							 " , substr(birthday,7) AS birthdd, registerday "+
							 " from "+
							 " ( "+
							 " select to_char(birthday, 'yyyymmdd') as birthday, userid, member_name, email, member_tel, postcode, address, detail_address, ref_address, registerday "+
							 " from tbl_member "+
							 " )B "+
							 " where userid = ? ";
				
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userid);
						
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					member = new MemberVO();
					
					member.setUserid(rs.getString("USERID"));
					member.setMember_name(rs.getString("MEMBER_NAME"));
					member.setEmail(aes.decrypt(rs.getString("EMAIL"))); // 복호화 해야한다.
					member.setMember_tel(aes.decrypt(rs.getString("MEMBER_TEL")));
					member.setPostcode(rs.getString("POSTCODE"));
					member.setAddress(rs.getString("ADDRESS"));
					member.setDetail_address(rs.getString("DETAIL_ADDRESS"));;
					member.setRef_address(rs.getString("REF_ADDRESS"));;
					member.setBirthday(rs.getString("BIRTHYYYY") +rs.getString("BIRTHMM") +rs.getString("BIRTHDD"));
					member.setRegisterday(rs.getString("REGISTERDAY"));
					
				} // end of while(rs.next)) ----------------------------------------------------------------------
				
			}
			catch(GeneralSecurityException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			
			return member;
		}

		// 휴면 계정 풀기를 위해서 login_date 업데이트하기
		@Override
		public int login_date_Update(String userid) throws SQLException {
			int result = 0;	
			
			try {
				
				conn = ds.getConnection();  
				
				String sql = " update tbl_login_history set login_date = sysdate "
						   + " where fk_userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userid);
				
				result = pstmt.executeUpdate();
				
			}
			finally {
				close();
			}
			
			return result;
		}//end of public int login_date_Update(String userid) throws SQLException ---------------


		

		


}
