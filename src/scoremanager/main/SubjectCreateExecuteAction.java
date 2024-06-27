package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;
import bean.Subject;
import bean.Teacher;
import dao.StudentDao;
import dao.SubjectDao;
import tool.Action;

public class SubjectCreateExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");

		StudentDao studentDao = new StudentDao();
		Student student = new Student();
		Subject subject = new Subject();
		SubjectDao subDao = new SubjectDao();

		subject.setCd(request.getParameter("cd"));
		subject.setName(request.getParameter("name"));
		subject.setSchool(teacher.getSchool());

		boolean bool = subDao.save(subject);

		if (bool == true) {
			System.out.println("登録成功");
		} else {
			System.out.println("登録失敗");
		}
		response.sendRedirect("group-e/subject/subject_create_done.jsp");



	}
}
