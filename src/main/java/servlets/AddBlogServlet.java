package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.BlogsDao;
import entities.Blogs;
import entities.Users;
import helper.ConnectionProvider;

/**
 * Servlet implementation class AddBlogServlet
 */
public class AddBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBlogServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String check_box = request.getParameter("check_box");
		HttpSession s = request.getSession();
		Users u = (Users) s.getAttribute("current_user");

		Blogs b = new Blogs();
		b.setBlog_category(Integer.parseInt(category));
		b.setBlog_comment_status(check_box);
		b.setBlog_content(content);
		b.setBlog_title(title);
		b.setBlog_author(u.getUser_id());

		BlogsDao dao = new BlogsDao(ConnectionProvider.main());
		if (dao.addBlog(b) == 1) {
			response.getWriter().append("1");
		} else {
			response.getWriter().append("2");

		}

	}

}
