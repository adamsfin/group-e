package tester__;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.Subject;
import dao.StudentDao;
import dao.SubjectDao;
import tool.Page; // 正しいPageクラスのインポート

@WebServlet(urlPatterns={"/tester__/Tester_kamoku"})
public class Tester_kamoku extends HttpServlet {

    public void doGet (
        HttpServletRequest request, HttpServletResponse response
    ) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        // ヘッダー部分の出力
        Page.header(out);

        try {
            // 科目データを取得するためのDAOオブジェクトの作成
            SubjectDao dao = new SubjectDao();

            // DAOを使って科目データを取得
            List<Subject> list = dao.searchSubjects();

            // 取得した科目データをリクエストの属性に設定
            request.setAttribute("list", list);

            // コンソールにリストの内容を出力
            System.out.println("科目リスト:");
            for (Subject subject : list) {
                System.out.println(subject.getCd() + ": " + subject.getName());
            }





            StudentDao studentDao = new StudentDao();

            // DAOを使って学生データを取得
            List<Student> studentList = studentDao.searchStudent();

            // 取得した学生データをリクエストの属性に設定
            request.setAttribute("studentList", studentList);

            // コンソールにリストの内容を出力
            System.out.println("学生リスト:");
            for (Student student : studentList) {
            	System.out.println(student.getNo() + ": " + student.getName() +
            	        ", " + student.getEntYear() +
            	        ", " + student.getClassNum() +
            	        ", " + student.isAttend());
            }

            // 次のJSPページにフォワードする
            request.getRequestDispatcher("test_list.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            // 例外が発生した場合のエラーハンドリング
            e.printStackTrace(out);
        }

        // フッター部分の出力
        Page.footer(out);
    }

}

