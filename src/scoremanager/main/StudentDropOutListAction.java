package scoremanager.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;
import bean.Teacher;
import dao.StudentDao;
import tool.Action;

public class StudentDropOutListAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	StudentDao studentdao = new StudentDao();
	List<Student> students = null;
	HttpSession session = req. getSession();
	Teacher teacher = (Teacher)session.getAttribute("user");

	students = studentdao.dropoutfilter(teacher.getSchool());

	req.setAttribute("do_students",students);

	req.getRequestDispatcher("/scoremanager/main/student_dropoutlist.jsp").forward(req, res);

		}
	}

