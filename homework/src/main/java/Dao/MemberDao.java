package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Dto.Member;

public class MemberDao {

	private Connection conn;
	private ResultSet rs;
	
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getinstance() {
		return instance;
	}
	
	public MemberDao() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb?serverTimezone=UTC", "root" , "1234" );
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// 회원가입 메소드 
	public int signup( Member member ) {
			
		String SQL = "insert into member(mid , mpassword , mname , memail , mphone , maddress )"+"values(?,?,?,?,?,?)";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
				
			pstmt.setString(1, member.getMid() );
			pstmt.setString(2, member.getMpassword() );
			pstmt.setString(3, member.getMname() );
			pstmt.setString(4, member.getMemail() );
			pstmt.setString(5, member.getMphone() );
			pstmt.setString(6, member.getMaddress() );
			
			pstmt.executeUpdate();
				
			return 1;
		}
		catch (Exception e) {
			
		}
		return 0;
			
	}
	
	// 로그인 메소드
	public int login(String mid, String mpassword) {
		
		String SQL = "select * from member where mid=? and mpassword=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, mid);
			pstmt.setString(2, mpassword);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1;
				
			} else {
				return 2;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
}
