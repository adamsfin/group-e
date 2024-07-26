package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.Teacher;
import dao.StudentDao;
import tool.Action;

public class StudentUpdateExecuteAction extends Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StudentDao studentDao = new StudentDao();
		Student student = new Student();

		student.setNo(request.getParameter("no"));
		student.setName(request.getParameter("name"));
		student.setClassNum(request.getParameter("class_num"));
		student.setEntYear(Integer.parseInt(request.getParameter("ent_year")));
		student.setSchool(((Teacher)request.getSession().getAttribute("user")).getSchool());
		student.setAttend(request.getParameterValues("is_attend")==null ? false : true);

		studentDao.save(student);

		request.getRequestDispatcher("student_update_done.jsp").forward(request, response);
	}

}
