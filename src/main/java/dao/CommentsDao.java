package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentsDao {
private Connection con=null;

public CommentsDao(Connection con) {
	this.con = con;
}




public int addComment(int user_id,int blog_id,String content) {
	int f=0;
	String query="insert into comments(blog_id,content,user_id) value(?,?,?)";
	try {
		PreparedStatement pst=con.prepareStatement(query);
		pst.setInt(3, user_id);
		pst.setInt(1, blog_id);
		pst.setString(2, content);
		f=pst.executeUpdate();
	} catch (SQLException e) {
		System.out.println(e);
	}
return f;}

}
