package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class TestDao {
	public boolean insert(BookBean bk) { 
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	String sql = "insert into bookbean(writer,title,content) values(?,?,?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bk.getWriter());
		pstmt.setString(2, bk.getTitle());
		pstmt.setString(3, bk.getContent());
		if(pstmt.executeUpdate() > 0) return true;
		else return false;
	} catch (SQLException e){
		e.printStackTrace();
	} finally {
		DBConnection.close(conn, pstmt, null);
	}
	return false;
}
	public BookBean selectOne(String writer) {
		Connection conn = DBConnection.getConnection();
		String sql = "select * from bookbean where writer=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			if(rs.next()) { //rs.next() : select된 결과 정보 조회.
				BookBean bk = new BookBean();
				bk.setWriter(rs.getString("writer"));
				bk.setTitle(rs.getString("title"));
				bk.setContent(rs.getString("content"));
				return bk; //입력된 id값에 해당하는 정보를 db에서 조회된 데이터 저장
			}
		}catch (SQLException e){
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}		
}
