package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectDao; // daoパッケージからSubjectDaoクラスをインポート
import tool.Action; // toolパッケージからActionクラスをインポート
import tool.Util;

public class SubjectDeleteExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// データベースとのやり取りを行うSubjectDaoクラスのインスタンスを生成
		SubjectDao dao = new SubjectDao();

		// ユーティリティ操作を行うためのUtilクラスのインスタンスを生成
		Util util = new Util();

		// ユーザーが削除を行った科目コード（cd）と、そのユーザーが所属する学校に基づいて、データベースから科目を削除する
		dao.delete(dao.get(req.getParameter("cd"), util.getUser(req).getSchool()));

		// 削除が成功した場合は、subject_delete_done.jspにリクエストをフォワードする
		req.getRequestDispatcher("subject_delete_done.jsp").forward(req, res);
	}

}
