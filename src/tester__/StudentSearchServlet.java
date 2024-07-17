package tester__;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Test;
import dao.TestDao;

@WebServlet("/tester__/studentsearchservlet")
public class StudentSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // フォームから送信されたパラメータを取得
        String entYearStr = request.getParameter("f1");
        Integer entYear = entYearStr != null && !entYearStr.equals("0") ? Integer.parseInt(entYearStr) : null;

        String classNum = request.getParameter("f2");
        if (classNum != null && classNum.equals("0")) {
            classNum = null;
        }

        String noStr = request.getParameter("f3");
        Integer no = noStr != null && !noStr.equals("0") ? Integer.parseInt(noStr) : null;



        TestDao testDao = new TestDao(); // TestDaoのインスタンスを生成

        try {
            // TestDaoを使用してフィルタリングされたテストリストを取得
            List<Test> tests = testDao.filter(entYear, classNum, no);

            // 取得したテストリストをリクエスト属性にセット
            request.setAttribute("tests", tests);

            // 結果を表示するJSPにフォワード
            request.getRequestDispatcher("test_list.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // エラーログを出力し、適切にエラーを処理する
            // 例外が発生した場合の処理をここに追加する
        }
    }
}