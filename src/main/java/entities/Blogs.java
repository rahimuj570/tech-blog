package entities;

import java.sql.Timestamp;

public class Blogs {
	private int blog_id;
	private String blog_title;
	private String blog_content;
	private int blog_category;
	private int blog_author;
	private Timestamp blog_date;
	private int blog_comment_status;

	public int getBlog_id() {
		return blog_id;
	}

	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}

	public String getBlog_title() {
		return blog_title;
	}

	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}

	public String getBlog_content() {
		return blog_content;
	}

	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}

	public int getBlog_category() {
		return blog_category;
	}

	public void setBlog_category(int blog_category) {
		this.blog_category = blog_category;
	}

	public int getBlog_author() {
		return blog_author;
	}

	public void setBlog_author(int blog_author) {
		this.blog_author = blog_author;
	}

	public Timestamp getBlog_date() {
		return blog_date;
	}

	public void setBlog_date(Timestamp blog_date) {
		this.blog_date = blog_date;
	}

	public int getBlog_comment_status() {
		return blog_comment_status;
	}

	public void setBlog_comment_status(int blog_comment_status) {
		this.blog_comment_status = blog_comment_status;
	}

	public Blogs(String blog_title, String blog_content, int blog_category, int blog_author, Timestamp blog_date,
			int blog_comment_status) {
		super();
		this.blog_title = blog_title;
		this.blog_content = blog_content;
		this.blog_category = blog_category;
		this.blog_author = blog_author;
		this.blog_date = blog_date;
		this.blog_comment_status = blog_comment_status;
	}

	public Blogs(int blog_id, String blog_title, String blog_content, int blog_category, int blog_author,
			Timestamp blog_date, int blog_comment_status) {
		super();
		this.blog_id = blog_id;
		this.blog_title = blog_title;
		this.blog_content = blog_content;
		this.blog_category = blog_category;
		this.blog_author = blog_author;
		this.blog_date = blog_date;
		this.blog_comment_status = blog_comment_status;
	}

	public Blogs() {
		super();
	}

}
