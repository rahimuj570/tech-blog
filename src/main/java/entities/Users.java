package entities;


public class Users {

	private int user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_about;
	private String user_gender;
	private java.sql.Timestamp registration_date;
	private String user_dp;

	public String getUser_dp() {
		return user_dp;
	}

	public void setUser_dp(String user_dp) {
		this.user_dp = user_dp;
	}

	public Users() {
		super();
	}

	public Users(String user_name, String user_email, String user_password, String user_about, String user_gender,String user_dp) {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_about = user_about;
		this.user_gender = user_gender;
		this.user_dp=user_dp;
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

	public java.sql.Timestamp getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(java.sql.Timestamp timestamp) {
		this.registration_date = timestamp;
	}

}
