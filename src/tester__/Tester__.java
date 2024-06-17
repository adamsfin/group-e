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

//	public void doGet (
//		HttpServletRequest request, HttpServletResponse response
//	) throws ServletException, IOException {
//		PrintWriter out = response.getWriter();
//		Page.header(out);
//		try {
//			StudentDao sDao = new StudentDao();
//			Student s = sDao.get("2231111");
//
//			out.println("<table border=1><tr>");
//			out.println("<th>学生番号</th>");
//			out.println("<th>学生名</th>");
//			out.println("<th>クラス番号</th></tr>");
//			out.println("<tr><td>"+s.getNo()+"</td>");
//			out.println("<td>"+s.getName()+"</td>");
//			out.println("<td>"+s.getClassNum()+"</td></tr></table>");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String i = request.getParameter("name");
		session.setAttribute("name", i);
		request.getRequestDispatcher("tester2.jsp").forward(request, response);
	}

}
