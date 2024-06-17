package tool;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Action2 extends HttpServlet{

	public void execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {}

	public void doGet(
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		try{
			execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			//エラーページへリダイレクト
			request.getRequestDispatcher("/error.jsp").forward(request,  response);
		}
	}

	public void doPost(
			HttpServletRequest request, HttpServletResponse response
		) throws ServletException, IOException {
		doGet(request, response);
	}

}
