package scoremanager.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.Teacher;
import dao.ClassNumDao;
import dao.StudentDao;
import dao.TeacherDao;
import tool.Page;

@WebServlet(urlPatterns={"/studentlistaction_test"})
public class StudentListAction_test extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out=res.getWriter();
		Page.header(out);
		try {
			TeacherDao tD = new TeacherDao();
			Teacher teacher = tD.get("admin");

			boolean isAttend = false;
			List<Student> students = null;
			StudentDao sDao = new StudentDao();
			ClassNumDao cNumDao = new ClassNumDao();

			//DBからデータ取得 3
			// ログインユーザーの学校コードをもとにクラス番号の一覧を取得
			List<String> list = cNumDao.filter(teacher.getSchool());

			// 全学生情報を取得
			students = sDao.filter(teacher.getSchool(), isAttend);

			for (String a:list) {
				out.println(a);
			}
			for (Student s:students) {
				out.println(s.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		Page.footer(out);
	}
}
