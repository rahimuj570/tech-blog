package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import entities.Blogs;

public class BlogsDao {
	Connection con;

	public BlogsDao(Connection con) {
		super();
		this.con = con;
	}

	public int addBlog(Blogs b) {
		int f = 0;
		String query = "insert into blogs (blog_title,blog_content,blog_category,blog_author,blog_comment_status)value(?,?,?,?,?)";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, b.getBlog_title());
			pst.setString(2, b.getBlog_content());
			pst.setInt(3, b.getBlog_category());
			pst.setInt(4, b.getBlog_author());
			pst.setString(5, b.getBlog_comment_status());
			f = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}

		return f;
	}

//	public String getAuthorOfBlog(int uid) {
//		String query=""select * from;
//	return null;}

	public boolean getBlogByCategory(int category_id) {
		boolean f = false;
		String query = "select b.blog_title, b.blog_id, b.blog_content, b.blog_comment_status,c.category_name,u.user_name, b.blog_date"
				+ " from blogs b  inner join users u  inner join categories c where b.blog_author=? and u.user_id=? and c.category_id=?and c.category_id=b.blog_category;";
		try {

			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, category_id);
			ResultSet res = pst.executeQuery();
			ArrayList<Blogs> blogs = new ArrayList<Blogs>();
			while (res.next()) {
				Blogs b = new Blogs();
//				b.getBlog_author(res.get);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return f;
	}

}
