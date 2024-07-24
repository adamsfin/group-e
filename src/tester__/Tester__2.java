package tester__;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher; // beanパッケージからTeacherクラスをインポート
import dao.TeacherDao; // daoパッケージからTeacherDaoクラスをインポート

@WebServlet(urlPatterns={"/tester2"})
public class Tester__2 extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            // セッションを取得する
            HttpSession session = req.getSession();

            // TeacherDaoクラスのインスタンスを生成する
            TeacherDao teacherDao = new TeacherDao();

            // "admin"というユーザー名の先生情報をデータベースから取得する
            Teacher teacher = teacherDao.get("admin");

            // セッションに取得した先生情報を"user"という名前で設定する
            session.setAttribute("user", teacher);

            // リクエストをtester.jspにフォワードする
            req.getRequestDispatcher("tester.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("失敗");
            e.printStackTrace();
        }
    }
}
