package servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import dao.UsersDao;
import entities.Users;
import helper.ConnectionProvider;
import helper.Message;
import helper.ProfilePicOperation;

/**
 * Servlet implementation class EditUserServlet
 */
@MultipartConfig
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditUserServlet() {
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
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String about = request.getParameter("about");
		Part part = request.getPart("dp");
		String dp = part.getSubmittedFileName();

		HttpSession s = request.getSession();
		Users u = (Users) s.getAttribute("current_user");
		u.setUser_about(about);
		String oldDpName=u.getUser_dp();
		u.setUser_dp(dp);
		u.setUser_email(email);
		u.setUser_name(name);
		u.setUser_password(password);
		String dpPath = getServletConfig().getServletContext().getRealPath("/") + File.separator + u.getUser_dp();
		System.out.println(dpPath);

		new ProfilePicOperation().deleteDp(getServletConfig().getServletContext().getRealPath("/") + File.separator +oldDpName);

		
			if (new ProfilePicOperation().saveDp(part.getInputStream(), dpPath)) {
				System.out.println("yessssssssss");
			} else {
				System.out.println("nooooooo");
			}


		UsersDao dao = new UsersDao(ConnectionProvider.main());
		if (dao.edit_user(u)) {
			response.sendRedirect("profile.jsp");
		} else {
			response.sendRedirect("profile.jsp");
			s.setAttribute("update_fail", new Message().main("SQL", "Faild to Update"));
		}

	}

}
