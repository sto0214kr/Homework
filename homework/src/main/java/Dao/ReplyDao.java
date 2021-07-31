package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dto.Reply;

public class ReplyDao {
	
	private Connection conn;
	private ResultSet rs;
	
	private static ReplyDao instance = new ReplyDao();
	
	public static ReplyDao getinstance() {
		return instance;
	}
	
	public ReplyDao() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb?serverTimezone=UTC", "root" , "1234" );
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// 댓글 등록 메소드
	public int rwrite(Reply reply) {
		
		String SQL = "insert into reply(bno, rwriter, rcontents, rdate)" + " values(?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, reply.getBno());
			pstmt.setString(2, reply.getRwriter());
			pstmt.setString(3, reply.getRcontents());
			pstmt.setString(4, reply.getRdate());
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
	// [게시글번호] 댓글 목록 출력 메소드
	public ArrayList<Reply> rlist(int bno) {
		
		ArrayList<Reply> replies = new ArrayList<Reply>();
		
		String SQL = "select * from reply where bno=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Reply reply = new Reply(
						rs.getInt(1),
						rs.getInt(2), 
						rs.getString(3), 
						rs.getString(4), 
						rs.getString(5));
				
				replies.add(reply);
			}
			return replies;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	// 댓글 삭제 메소드
	public int rdelete(int rno) {
		
		String SQL = "delete from reply where rno=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, rno);
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}

}
