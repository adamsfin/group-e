package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;
import bean.Teacher;
import dao.StudentDao;
import tool.Action;

public class StudentCreateExecuteAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		StudentDao studentDao = new StudentDao();
		Student student = new Student();

		if (Character.isDigit(req.getParameter("entYear").charAt(0))) {
			session.setAttribute("year_error", "入学年度を入力してください");
			req.getRequestDispatcher("student/student_registration.jsp").forward(req, res);
		}

		student.setNo(req.getParameter("id"));
		student.setName(req.getParameter("name"));
		student.setEntYear(Integer.parseInt(req.getParameter("entYear")));
		student.setClassNum(req.getParameter("classNum"));
		student.setAttend(true);
		student.setSchool(teacher.getSchool());

		boolean bool = studentDao.save(student);

		if (bool == true) {
//			上手くいったらメインメニューにリダイレクトでもするか
			System.out.println("登録成功");
			session.removeAttribute("class_num_set");
			res.sendRedirect("tester.jsp");
		} else {
			System.out.println("登録失敗");
			req.setAttribute("no_error", "学生番号が重複しています");
			req.getRequestDispatcher("student/student_registration.jsp").forward(req, res);
		}
	}

}
