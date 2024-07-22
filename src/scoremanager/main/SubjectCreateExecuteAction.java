package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import tool.Action;

public class SubjectCreateExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		SubjectDao subDao = new SubjectDao();
		Subject subject = new Subject();

//		入力した値を取得
		subject.setCd(req.getParameter("cd"));
		subject.setName(req.getParameter("name"));
		subject.setSchool(teacher.getSchool());
		System.out.println();
//		DBに保存
		boolean bool = subDao.save(subject);

//		登録成功したらJSPへフォワード
		if (bool == true) {
			System.out.println("登録成功");
			req.getRequestDispatcher("/scoremanager/main/subject_create_done.jsp").forward(req, res);
		} else {
			System.out.println("登録失敗");
		}

	}
}
