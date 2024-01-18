package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.CommentsDao;
import entities.Users;
import helper.ConnectionProvider;

/**
 * Servlet implementation class CommentsServlet
 */
public class CommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String comment=(request.getParameter("comment"));
		int blog_id=Integer.parseInt(request.getParameter("blog_id"));
		HttpSession sc=request.getSession();
		Users u=(Users)sc.getAttribute("current_user");
		int user_id=u.getUser_id();
		CommentsDao dao=new CommentsDao(ConnectionProvider.main());
		if(dao.addComment(user_id, blog_id, comment)==1) {
			response.sendRedirect("single_post.jsp?post_id="+blog_id+"");
		}else {
			response.getWriter().append("<h2>comment_failed</h2>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
