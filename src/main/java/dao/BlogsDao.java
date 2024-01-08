package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import entities.Blogs;

public class BlogsDao {
	Connection con;

	public BlogsDao(Connection con) {
		super();
		this.con = con;
	}
	
	
public int addBlog(Blogs b) {
	int f=0;
	String query="insert into blogs (blog_title,blog_content,blog_category,blog_author,blog_comment_status)value(?,?,?,?,?)";
	try {
		PreparedStatement pst=con.prepareStatement(query);
		pst.setString(1, b.getBlog_title());
		pst.setString(2, b.getBlog_content());
		pst.setInt(3, b.getBlog_category());
		pst.setInt(4, b.getBlog_author());
		pst.setString(5, b.getBlog_comment_status());
		f=pst.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
		
return f;}
	
}
