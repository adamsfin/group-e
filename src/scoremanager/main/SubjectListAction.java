package scoremanager.main;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import tool.Action;

@WebServlet(urlPatterns={"/group-e/subject/subject_list"})
public class SubjectListAction extends Action{

	@Override
	public void execute (HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		School school = teacher.getSchool();

		Subject subject = new Subject();

		SubjectDao subDao = new SubjectDao();

		List<Subject> list = subDao.filter(school);

//		System.out.println(list);
//		System.out.print("kuso");

		req.setAttribute("subject_set", list);
	//DBからデータ取得 3
		// ログインユーザーの学校コードをもとに科目の一覧を取得


		req.getRequestDispatcher("/scoremanager/main/subject_list.jsp").forward(req, res);

		}

}
