package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action; // toolパッケージからActionクラスをインポート

public class SubjectUpdateAction extends Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// リクエストから取得したパラメータ "cd" を "cd" という名前でリクエスト属性に設定する
		request.setAttribute("cd", request.getParameter("cd"));

		// リクエストをsubject_update.jspにフォワードする
		request.getRequestDispatcher("subject_update.jsp").forward(request, response);
	}

}
