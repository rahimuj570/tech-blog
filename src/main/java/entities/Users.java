package entities;

import java.security.Timestamp;

public class Users {

	private int user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_about;
	private String user_gender;
	private Timestamp registration_date;

	public Users() {
		super();
	}

	public Users(String user_name, String user_email, String user_password, String user_about, String user_gender) {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_about = user_about;
		this.user_gender = user_gender;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_about() {
		return user_about;
	}

	public void setUser_about(String user_about) {
		this.user_about = user_about;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public Timestamp getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(Timestamp registration_date) {
		this.registration_date = registration_date;
	}

}
