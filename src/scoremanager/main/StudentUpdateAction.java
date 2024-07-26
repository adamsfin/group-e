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

		String no = req.getParameter("no");

		StudentDao studentDao = new StudentDao();
		ClassNumDao classNumDao = new ClassNumDao();


//		学生の詳細情報を取得
		Student student = studentDao.get(no);


		//DBからデータ取得 3
		// ログインユーザーの学校コードをもとにクラス番号の一覧を取得
		List<String> list = classNumDao.filter(teacher.getSchool());

		// リクエストにデータをセット
		req.setAttribute("class_num_set", list);

		req.setAttribute("no", student.getNo());
		req.setAttribute("name", student.getName());
		req.setAttribute("ent_year", student.getEntYear());
		req.setAttribute("cNum", student.getClassNum());
		req.setAttribute("attend", student.isAttend() ? "true" : null);
		//JSPへフォワード
		req.getRequestDispatcher("student_update.jsp").forward(req, res);
	}

}
