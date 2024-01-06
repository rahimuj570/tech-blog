package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Users;

public class UsersDao {
	private Connection con;

	public UsersDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean save_user(Users users) {
		Boolean f;
		try {
			String query = "insert into users(user_name,user_email,user_password,user_gender,user_about,user_dp) value(?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, users.getUser_name());
			pst.setString(2, users.getUser_email());
			pst.setString(3, users.getUser_password());
			pst.setString(4, users.getUser_gender());
			pst.setString(5, users.getUser_about());
			pst.setString(6, users.getUser_dp());
			pst.executeUpdate();
			f = true;
		} catch (Exception e) {
			System.out.println(e);
			f = false;
		}
		return f;
	}

	public Users get_user(String email, String password) {
		Users user = null;
		String query="select * from users where user_email=? and user_password=?";
		try {
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet res=pst.executeQuery();
			if(res.next()) {
				user=new Users();
				try {
					user.setUser_name(res.getString("user_name"));
					user.setUser_email(res.getString("user_email"));
					user.setRegistration_date(res.getTimestamp("registration_date"));
					user.setUser_about(res.getString("user_about"));
					user.setUser_gender(res.getString("user_gender"));
					user.setUser_id(res.getInt("user_id"));
					user.setUser_dp(res.getString("user_dp"));
				}catch(Exception e){
					System.out.println(e);
				}
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return user;
	}

}
