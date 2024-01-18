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
	
	
	public int countPost() {
		int count=0;
		String query="select count(*) as count from blogs";
		try {
			PreparedStatement pst=con.prepareStatement(query);
			ResultSet res=pst.executeQuery();
			if(res.next()) {
				count=res.getInt("count");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	return count;}
	
	
	public int countPost(int uid) {
		int count=0;
		String query="select count(*) as count from blogs where blog_author=?";
		try {
			PreparedStatement pst=con.prepareStatement(query);
			pst.setInt(1, uid);
			ResultSet res=pst.executeQuery();
			if(res.next()) {
				count=res.getInt("count");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return count;}
	
	public int countPostOfCategory(int catId) {
		int count=0;
		String query=null;
		
		if(catId!=0)query="select count(*) as count from blogs where blog_category=?";
		else query="select count(*) as count from blogs";
		try {
			PreparedStatement pst=con.prepareStatement(query);
			if(catId!=0)pst.setInt(1, catId);
			ResultSet res=pst.executeQuery();
			if(res.next()) {
				count=res.getInt("count");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return count;}

	public ArrayList<Blogs> getAllPost(int catId,int start, int amount) {
		String query=null;
		if(catId==0) {
			query = "select * from blogs order by blog_date DESC limit ?,? ";
		}else {
			query = "select * from blogs where blog_category=? order by blog_date DESC limit ?,? ";
		}
		ArrayList<Blogs> entities = new ArrayList<Blogs>();
		try {
			PreparedStatement pst = con.prepareStatement(query);
			if(catId==0) {
				pst.setInt(1, start);
				pst.setInt(2, amount);
			}else {
				pst.setInt(1, catId);
				pst.setInt(2, start);
				pst.setInt(3, amount);
			}
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				String title = res.getString("blog_title");
				String content = res.getString("blog_content");
				int blog_id = res.getInt("blog_id");
				int blog_category = res.getInt("blog_category");
				int author = res.getInt("blog_author");
				String comment_status = res.getString("blog_comment_status");
				Timestamp blog_date = res.getTimestamp("blog_date");
				Blogs entity = new Blogs(blog_id, title, content, blog_category, author, blog_date, comment_status);
				entities.add(entity);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

		return entities;
	}
	
	
	public ArrayList<Blogs> getPostByUserId(int id,int start, int amount) {
		String query = "select * from blogs where blog_author=? order by blog_date DESC limit ?,? ";
		ArrayList<Blogs> entities = new ArrayList<Blogs>();
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, id);
			pst.setInt(2, start);
			pst.setInt(3, amount);
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				String title = res.getString("blog_title");
				String content = res.getString("blog_content");
				int blog_id = res.getInt("blog_id");
				int blog_category = res.getInt("blog_category");
				int author = res.getInt("blog_author");
				String comment_status = res.getString("blog_comment_status");
				Timestamp blog_date = res.getTimestamp("blog_date");
				Blogs entity = new Blogs(blog_id, title, content, blog_category, author, blog_date, comment_status);
				entities.add(entity);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return entities;
	}


//	public boolean getBlogByCategory(int category_id) {
//		boolean f = false;
//		String query = "select b.blog_title, b.blog_id, b.blog_content, b.blog_comment_status,c.category_name,u.user_name, b.blog_date"
//				+ " from blogs b  inner join users u  inner join categories c where b.blog_author=? and u.user_id=? and c.category_id=?and c.category_id=b.blog_category;";
//		try {
//
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setInt(1, category_id);
//			ResultSet res = pst.executeQuery();
//			ArrayList<Blogs> blogs = new ArrayList<Blogs>();
//			while (res.next()) {
//				Blogs b = new Blogs();
////				b.getBlog_author(res.get);
//			}
//		} catch (SQLException e) {
//			System.out.println(e);
//		}
//		return f;
//	}

}
