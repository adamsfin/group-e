package tester__;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.TeacherDao;

@WebServlet(urlPatterns={"/tester2"})
public class Tester__2 extends HttpServlet {

	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try{
//			StudentListAction listAction = new StudentListAction();
			HttpSession session = req. getSession();
			TeacherDao teacherDao = new TeacherDao();
			Teacher teacher = teacherDao.get("admin");
			session.setAttribute("user", teacher);
//			listAction.execute(req, res);
			req.getRequestDispatcher("tester.jsp").forward(req, res);;
		} catch (Exception e) {
			System.out.println("失敗");
			e.printStackTrace();
		}
	}
}
