package scoremanager.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class SubjectCreateAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//		JSPにフォワード
		req.getRequestDispatcher("subject_create.jsp").forward(req, res);

	}
}
