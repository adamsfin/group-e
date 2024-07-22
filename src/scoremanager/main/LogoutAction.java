package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class LogoutAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.getSession().removeAttribute("user");
		req.getRequestDispatcher("logout.jsp").forward(req, res);
	}

}
