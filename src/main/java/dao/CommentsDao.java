package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Comments;

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

public ArrayList<Comments>getAllCommentsOfBlog(int blog_id){
	ArrayList<Comments>entities=new ArrayList<Comments>();
	String query="select * from comments where blog_id=?";
	try {
		PreparedStatement pst=con.prepareStatement(query);
		pst.setInt(1, blog_id);
		ResultSet res=pst.executeQuery();
		while(res.next()) {
			Comments c=new Comments();
			c.setBlog_id(res.getInt("blog_id"));
			c.setComment_date(res.getTimestamp("comment_date"));
			c.setContent(res.getString("content"));
			c.setUser_id(res.getInt("user_id"));
			entities.add(c);
		}
	} catch (SQLException e) {
		System.out.println(e);
	}
	
return entities;}

}
