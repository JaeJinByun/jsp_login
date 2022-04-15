package logon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//DAO = Data Access Object
//싱글톤 패턴

public class LogonDBBean {
	
	private static LogonDBBean instance = new LogonDBBean(); //객체 만들어서 뿌려주기 위함
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/joeun");
		return ds.getConnection();
	}
	
	
	//회원가입하기 가입정보 db 저장
	public int insertMember( LogonDataBean dto ) { //멤버변수 데이터 받아오기
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();	
			String sql = "insert into member values( ?, ?, ?, ?, ?, ?, ?, ? )";
			pstmt = con.prepareStatement(sql);
			pstmt.setString( 1, dto.getId());
			pstmt.setString( 2, dto.getPasswd());
			pstmt.setString( 3, dto.getName());
			pstmt.setString( 4, dto.getJumin1());
			pstmt.setString( 5, dto.getJumin2());
			pstmt.setString( 6, dto.getTel());
			pstmt.setString( 7, dto.getEmail());
			pstmt.setTimestamp(8, dto.getReg_date());
			result = pstmt.executeUpdate();
			
		}catch(NamingException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if( con != null ) con.close();
				if( pstmt != null ) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	//아이디 중복값 체크
	public int check(String id) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//아이디가있다
				result = 1;
			}else {
				//아이디가없다.
				result = 0;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(NamingException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		return result;
	}
	
	//db 에 id passwd 유효성 검사메소드
	public int check(String id, String passwd) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				//아이디가있다
				if(passwd.equals(rs.getString("passwd"))) {
					result = 1;
				}else {
					result = 0;
				}
				
				
			}else {
				//아이디가없다.
				return -1;
				
			}
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( con!= null) con.close();
				if( pstmt!= null) pstmt.close();
				if( rs != null) rs.close();				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}
	
	//db delete 처리 메소드
	public int deleteMember(String id) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "delete from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); //? 값에 넣은 데이터값 (몇번째 물음표에, 넣을값)
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				result = 1;
			}else {
				result = 0;
			}		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
			try {
				if( con!= null) con.close();
				if( pstmt!= null) pstmt.close();
				if( rs != null) rs.close();				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}
	
	public LogonDataBean getMember(String id) {
		LogonDataBean dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {  //select 구문에 대한 결과값이 있다면
				dto = new LogonDataBean();	//바구니 객체 생성.. dto 는 setter getter 의 역활 
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setJumin1(rs.getString("jumin1"));
				dto.setJumin2(rs.getString("jumin2"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if( con!= null) con.close();
				if( pstmt!= null) pstmt.close();
				if( rs != null) rs.close();				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		}	
				
				
		return dto;
	}
	
	
	public int modifyMember(LogonDataBean dto) { //update 시키기..
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			String sql = "update member set passwd=?, tel=?, email=? where id=?" ;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getTel());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getId());
			result = pstmt.executeUpdate(); //update 된 행의 개수 
			
		} catch (NamingException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		}		
		return result;
	}
	
}





















