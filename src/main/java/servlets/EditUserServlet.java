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
	 **/
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
		String dp = dp = part.getSubmittedFileName();
		String clear_dp = request.getParameter("clear_dp");

		HttpSession s = request.getSession();
		Users sessionU=new Users();
		sessionU = (Users) s.getAttribute("current_user");
		Users u=new Users();
		u.setRegistration_date(sessionU.getRegistration_date());
		u.setUser_about(sessionU.getUser_about());
		u.setUser_dp(sessionU.getUser_dp());
		u.setUser_email(sessionU.getUser_email());
		u.setUser_gender(sessionU.getUser_gender());
		u.setUser_id(sessionU.getUser_id());
		u.setUser_name(sessionU.getUser_name());
		u.setUser_password(sessionU.getUser_password());
		String oldDpName = u.getUser_dp();
		if (clear_dp != null) {
			new ProfilePicOperation()
					.deleteDp(getServletConfig().getServletContext().getRealPath("/") + File.separator + oldDpName);
			u.setUser_dp("");
		} else {
			if (part.getSize() != 0)
				u.setUser_dp(dp);
		}
		if (!about.isBlank())
			u.setUser_about(about);

		if (!email.isBlank())
			u.setUser_email(email);
		if (!name.isBlank())
			u.setUser_name(name);
		if (!password.isBlank())
			u.setUser_password(password);
		String dpPath = getServletConfig().getServletContext().getRealPath("/") + File.separator + u.getUser_dp();
		System.out.println(dpPath);

		if (part.getSize() != 0 && clear_dp==null) {
			new ProfilePicOperation()
					.deleteDp(getServletConfig().getServletContext().getRealPath("/") + File.separator + oldDpName);

			if (new ProfilePicOperation().saveDp(part.getInputStream(), dpPath)) {
				System.out.println("yessssssssss");
			} else {
				System.out.println("nooooooo");
			}
		}

		UsersDao dao = new UsersDao(ConnectionProvider.main());
		String errorMsg=dao.edit_user(u);
		System.out.println(errorMsg);
		if (errorMsg.equals("true")) {
			sessionU.setRegistration_date(u.getRegistration_date());
			sessionU.setUser_about(u.getUser_about());
			sessionU.setUser_dp(u.getUser_dp());
			sessionU.setUser_email(u.getUser_email());
			sessionU.setUser_gender(u.getUser_gender());
			sessionU.setUser_id(u.getUser_id());
			sessionU.setUser_name(u.getUser_name());
			sessionU.setUser_password(u.getUser_password());
			response.sendRedirect("profile.jsp");
		} else {
			s.setAttribute("update_fail", new Message().main("SQL", errorMsg));
			response.sendRedirect("profile.jsp");
		}

	}

}
