package scoremanager.main;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import tool.Action;

public class SubjectUpdateAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
		Map<String,String>errors = new HashMap<>();

//		科目コードを受け取る
		String cd = req.getParameter("no");
//		String id = (String)session.getAttribute("id");

		SubjectDao subjectDao = new SubjectDao();

//		科目の詳細情報を取得
		Subject subject = subjectDao.get(cd, teacher.getSchool());

//		科目が途中で削除された場合、エラー文を表示
		if (subject == null) {
			errors.put("e1", "科目が存在していません");
			req.setAttribute("errors", errors);
		}

		// リクエストにデータをセット
		session.setAttribute("subject", subject);
		//JSPへフォワード
		req.getRequestDispatcher("subject/subject_update.jsp").forward(req, res);
	}

}
