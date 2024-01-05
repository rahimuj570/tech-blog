package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entities.Users;

public class UsersDao {
	private Connection con;

	public UsersDao(Connection con) {
		super();
		this.con = con;
	}

	public Boolean save_user(Users users) {
		Boolean f;
		try {
			String query = "insert into users(user_name,user_email,user_password,user_gender,user_about) value(?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, users.getUser_name());
			pst.setString(2, users.getUser_email());
			pst.setString(3, users.getUser_password());
			pst.setString(4, users.getUser_gender());
			pst.setString(5, users.getUser_about());
			pst.executeUpdate();
			f=true;
		} catch (Exception e) {
			System.out.println(e);
			f = false;
		}
		return f;
	}

}
