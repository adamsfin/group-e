package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action; // toolパッケージからActionクラスをインポート
import tool.Util;

public class SubjectListAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// Utilクラスのインスタンスを生成して、科目リストをセットアップする
		Util util = new Util();
		util.setSubjects(req);

		// リクエストをsubject_list.jspにフォワードする
		req.getRequestDispatcher("/scoremanager/main/subject_list.jsp").forward(req, res);
	}

}
