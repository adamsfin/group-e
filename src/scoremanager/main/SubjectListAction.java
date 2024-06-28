package scoremanager.main;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import tool.Action;

@WebServlet(urlPatterns={"/subject/subject_list"})
public class SubjectListAction extends Action{

	@Override
	public void execute (HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");

		String name="";


		SubjectDao subDao = new SubjectDao();

		name = req.getParameter("f1");


		//DBからデータ取得 3
		// ログインユーザーの学校コードをもとに科目の一覧を取得

		List<Subject> list = subDao.filter(teacher.getSchool());

		req.setAttribute("f1", name);

		req.setAttribute("subject_set", list);

		req.setAttribute("name", name);

		req.getRequestDispatcher("group-e/subject/subject_list.jsp").forward(req, res);








		}

}
