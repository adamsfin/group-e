package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;
import dao.StudentDao;
import tool.Action;

public class StudentUpdateExecuteAction extends Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
//		HttpSession session = req. getSession();
		StudentDao studentDao = new StudentDao();
//		Student student = (Student)session.getAttribute("student");
		Student student = (Student)session.getAttribute("student");

		student.setName(request.getParameter("name"));
		student.setClassNum(request.getParameter("classnum"));
		student.setAttend(request.getParameterValues("isattend")==null ? false : true);

		boolean bool = studentDao.save(student);

		if (bool == true) {
//			上手くいったらメインメニューにリダイレクトでもするか
			System.out.println("更新成功");
			session.removeAttribute("student");
			response.sendRedirect("scoremanager.main.StudentList.action");
		}
	}

}
