package tester__;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/tester"})
public class Tester__ extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String i = request.getParameter("name");
		session.setAttribute("name", i);
		request.getRequestDispatcher("tester2.jsp").forward(request, response);
	}

}
