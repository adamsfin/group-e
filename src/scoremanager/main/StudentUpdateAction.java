package scoremanager.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;
import bean.Teacher;
import dao.ClassNumDao;
import dao.StudentDao;
import tool.Action;

public class StudentUpdateAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");

//		学生IDを受け取り （どっちで受け取るか）
		String no = req.getParameter("no");
//		String id = (String)session.getAttribute("id");

		StudentDao studentDao = new StudentDao();
		ClassNumDao classNumDao = new ClassNumDao();


//		学生の詳細情報を取得
		Student student = studentDao.get(no);


		//DBからデータ取得 3
		// ログインユーザーの学校コードをもとにクラス番号の一覧を取得
		List<String> list = classNumDao.filter(teacher.getSchool());

		// リクエストにデータをセット
		req.setAttribute("class_num_set", list);
		session.setAttribute("student", student);
		req.setAttribute("attend", student.isAttend() ? "true" : null);
		//JSPへフォワード 7
		req.getRequestDispatcher("student/student_update.jsp").forward(req, res);
	}

}
