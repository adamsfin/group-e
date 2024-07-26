package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDao;
import scoremanager.Util;
import tool.Action; // toolパッケージからActionクラスをインポート

public class SubjectUpdateAction extends Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		科目コードを受け取る
		String cd = request.getParameter("cd");

		// SubjectDaoクラスのインスタンスを生成する
		SubjectDao subjectDao = new SubjectDao();

		// Utilクラスのインスタンスを生成する
		Util util = new Util();

		// 科目名を取得する
		Subject subject = subjectDao.get(cd, util.getUser(request).getSchool());

		// リクエスト属性にデータをセットする
		request.setAttribute("cd", cd);
		request.setAttribute("subject", subject);

		// リクエストをsubject_update.jspにフォワードする
		request.getRequestDispatcher("subject_update.jsp").forward(request, response);
	}

}
