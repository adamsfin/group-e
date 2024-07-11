package scoremanager.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Test;
import dao.TestDao;
import tool.Action;

public class TestUpdateAction extends Action {

	@Override
	@SuppressWarnings("unchecked")
	public void execute ( HttpServletRequest req, HttpServletResponse res ) throws Exception {
		HttpSession session = req.getSession();
		TestDao testDao = new TestDao();
		String result = testDao.save((List<Test>)session.getAttribute("list")) ? "更新成功" : "更新失敗";
		System.out.println(result);
	}

}
