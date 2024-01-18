package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikesDao {
Connection con=null;

public LikesDao(Connection con) {
	this.con = con;
}

public int myLikeStatus(int uid, int blogId) {
	int isLiked=0;
	String query="select count(*) as count from likes where blog_id=? and user_id=?";
	try {
		PreparedStatement pst=con.prepareStatement(query);
		pst.setInt(2, uid);
		pst.setInt(1, blogId);
		ResultSet res=pst.executeQuery();
		if(res.next())isLiked=res.getInt("count");
	} catch (SQLException e) {
		System.out.println(e);
	}
return isLiked;}

public int countLikesOfBlog(int blogId) {
	int count=0;
	String query="select count(*) as count from likes where blog_id=?";
	try {
		PreparedStatement pst=con.prepareStatement(query);
		pst.setInt(1, blogId);
		ResultSet res=pst.executeQuery();
		if(res.next())count=res.getInt("count");
	} catch (SQLException e) {
		System.out.println(e);
	}
	return count;}

public int addlikeUnlike(int uid, int blogId) {
	int f=0;
	int isLiked=myLikeStatus(uid,blogId);
	if(isLiked==0) {
		String query="insert into likes (blog_id,likes,user_id) value(?,?,?)";
		PreparedStatement pst;
		try {
			pst = con.prepareStatement(query);
			pst.setInt(3, uid);
			pst.setInt(1, blogId);
			pst.setInt(2, 1);
			f = pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}else {
		String query="delete from likes where user_id=? and blog_id=?";
		PreparedStatement pst;
		try {
			pst = con.prepareStatement(query);
			pst.setInt(1, uid);
			pst.setInt(2, blogId);
			f = pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	return f;}


}
