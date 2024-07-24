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
		String
			no = req.getParameter("id"),
			name = req.getParameter("name"),
			classNum = req.getParameter("classNum");
		Integer entYear = Integer.parseInt(req.getParameter("entYear"));


		if (entYear==0) {
			req.setAttribute("year_error", "入学年度を入力してください");


			req.getRequestDispatcher("student_create.jsp").forward(req, res);

			return;
		}

		StudentDao studentDao = new StudentDao();


		if (studentDao.get(no)!=null) {

			req.setAttribute("no_error", "学生番号が重複しています");

			req.getRequestDispatcher("student_create.jsp").forward(req, res);
			return;

		}

		HttpSession session = req.getSession();
		Teacher user = (Teacher)session.getAttribute("user");

		Student student = new Student();
		student.setNo(no);
		student.setName(name);
		student.setEntYear(entYear);
		student.setClassNum(classNum);
		student.setAttend(true);
		student.setSchool(user.getSchool());

		studentDao.save(student);

		session.removeAttribute("class_num_set");
		req.getRequestDispatcher("student_create_done.jsp").forward(req, res);
	}

}
