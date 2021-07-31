package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dto.Board;

public class BoardDao {
	
	private Connection conn;
	private ResultSet rs;
	
	private static BoardDao instance = new BoardDao();
	
	public static BoardDao getinstance() {
		return instance;
	}
	
	public BoardDao() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb?serverTimezone=UTC", "root" , "1234" );
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// 글쓰기 메소드
	public int bwrite(Board board) {
		
		String SQL = "insert into board( btitle , bcontents , bwriter, bdate , bcount)"+"values(?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, board.getBtitle());
			pstmt.setString(2, board.getBcontents());
			pstmt.setString(3, board.getBwriter());
			pstmt.setString(4, board.getBdate());
			pstmt.setInt(5, board.getBcount());
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
	// 모든 게시물 출력 메소드
	public ArrayList<Board> blist() {
		
		ArrayList<Board> boards = new ArrayList();
		
		String SQL = "select * from board";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Board board = new Board(
						rs.getInt(1), 
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4), 
						rs.getString(5), 
						rs.getInt(6));
				
				boards.add(board);
			}
			return boards;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	// 게시글 상세 페이지 메소드 -> view
	public Board bview(int bno) {
		
		String SQL = "select * from board where bno=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Board board = new Board(
						rs.getInt(1), 
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4), 
						rs.getString(5), 
						rs.getInt(6));
				
				return board;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	// 게시글 수정 메소드
	public int bupdate(int bno, Board board) {
		
		String SQL = "update board set btitle=?, bcontents=? where bno=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, board.getBtitle());
			pstmt.setString(2, board.getBcontents());
			pstmt.setInt(3, bno);
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
	// 게시글 삭제 메소드
	public int bdelete(int bno) {
		
		String SQL = "delete from board where bno=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
			return 1;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
	// 조회수 증가 메소드
	public void bcountup(int bno) {
		
		String SQL = "update board set bcount=bcount+1 where bno=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
