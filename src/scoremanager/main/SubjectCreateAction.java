package scoremanager.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;
import bean.Subject;
import bean.Teacher;
import dao.StudentDao;
import dao.SubjectDao;
import tool.Action;

public class SubjectCreateAction extends Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");

		StudentDao studentDao = new StudentDao();
		Student student = new Student();
		Subject subject = new Subject();
		SubjectDao subDao = new SubjectDao();

		subject.setCd(request.getParameter("cd"));
		subject.setName(request.getParameter("name"));
		subject.setSchool(teacher.getSchool());


		request.getRequestDispatcher("group-e/subject/subject_create.jsp").forward(request, response);



	}
}
