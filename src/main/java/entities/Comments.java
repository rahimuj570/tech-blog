package entities;

import java.sql.Timestamp;

public class Comments {
	private int user_id;
	private Timestamp comment_date;
	private int blog_id;
	private String content;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Timestamp getComment_date() {
		return comment_date;
	}

	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}

	public int getBlog_id() {
		return blog_id;
	}

	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Comments() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comments(int user_id, Timestamp comment_date, int blog_id, String content) {
		super();
		this.user_id = user_id;
		this.comment_date = comment_date;
		this.blog_id = blog_id;
		this.content = content;
	}

}
