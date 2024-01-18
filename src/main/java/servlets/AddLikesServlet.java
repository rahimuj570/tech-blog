package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.LikesDao;
import entities.Users;
import helper.ConnectionProvider;

/**
 * Servlet implementation class AddLikesServlet
 */
public class AddLikesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddLikesServlet() {
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
		HttpSession sc = request.getSession();
		Users u = (Users) sc.getAttribute("current_user");
		if (u == null) {
			response.getWriter().append("unauthorized");
		} else {
			int uid = u.getUser_id();
			int blogId = Integer.parseInt(request.getParameter("blog_id"));
			LikesDao dao = new LikesDao(ConnectionProvider.main());
			System.out.println(dao.addlikeUnlike(uid, blogId));

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
