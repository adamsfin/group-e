package scoremanager.main;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject; // beanパッケージからSubjectクラスをインポート
import dao.SubjectDao; // daoパッケージからSubjectDaoクラスをインポート
import scoremanager.Util; // scoremanagerパッケージからUtilクラスをインポート
import tool.Action; // toolパッケージからActionクラスをインポート

public class SubjectUpdateExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// リクエストから科目コード（cd）と科目名（name）を取得する
		String cd = request.getParameter("cd");
		String name = request.getParameter("name");

		// SubjectDaoクラスのインスタンスを生成する
		SubjectDao subjectDao = new SubjectDao();

		// Utilクラスのインスタンスを生成する
		Util util = new Util();

		// 科目が存在するかどうかを確認する
		if (subjectDao.get(cd, util.getUser(request).getSchool()) != null) {
			// 科目オブジェクトを生成し、属性を設定する
			Subject subject = new Subject();
			subject.setCd(cd);
			subject.setName(name);
			subject.setSchool(util.getUser(request).getSchool());

			// 科目をデータベースに保存する
			subjectDao.save(subject);

			// 科目の更新が完了したら、subject_update_done.jspにリクエストをフォワードする
			request.getRequestDispatcher("subject_update_done.jsp").forward(request, response);
		} else {
			// 科目が存在しない場合のエラーメッセージと、入力値をリクエスト属性に設定する
			request.setAttribute("subject_error", "科目が存在していません");
			request.setAttribute("inputVal", new HashMap<String, String>() {{
				put("cd", cd);
				put("name", name);
			}});

			// 科目が存在しない場合は、再度subject_update.jspにリクエストをフォワードする
			request.getRequestDispatcher("subject_update.jsp").forward(request, response);
		}
	}

}
