package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Subject;

public class SubjectDao extends Dao {


	public Subject get (String cd, School school) throws Exception {
		Subject subject = new Subject();
		Connection connection = getConnection();
		PreparedStatement statement = null;

		try {

			statement = connection.prepareStatement("select * from subject where cd=?");
			statement.setString(1, cd);
			ResultSet rSet = statement.executeQuery();


			if (rSet.next()) {
				SchoolDao schoolDao = new SchoolDao();
				subject.setCd(rSet.getString("cd"));
				subject.setName(rSet.getString("name"));
				subject.setSchool(schoolDao.get(rSet.getString("school_cd")));
			} else {
				subject = null;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return subject;
	}


	public List<Subject> searchSubjects() throws Exception {

		    // 空のリストを作成して、検索結果を格納する準備をします

		    List<Subject> list = new ArrayList<>();

		    // データベースとの接続を確立します

		    Connection con = getConnection();

		    // SQLクエリを準備します

		    PreparedStatement st = con.prepareStatement(

		            "select * from subject");

		    // クエリを実行し、その結果を取得します

		    ResultSet rs = st.executeQuery();

		    // 取得した結果を1行ずつ処理します

		    while (rs.next()){

		        // 新しいSubjectオブジェクトを作成します

		        Subject subject = new Subject();

		        // ResultSetからデータを取得して、Subjectオブジェクトに設定します

		        subject.setCd(rs.getString("cd"));

		        subject.setName(rs.getString("name"));

		        // 学校情報を取得して、Subjectオブジェクトに設定します

		        School school = new School();

		        subject.setSchool(school);

		        // リストにSubjectオブジェクトを追加します

		        list.add(subject);

		    }

		    // 使用が終わったPreparedStatementとConnectionを閉じます

		    st.close();

		    con.close();

		    // 最終的にSubjectのリストを返します

		    return list;

		}



	public List<Subject> filter(School school) throws Exception{
		List<Subject> list = new ArrayList<>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;

//		String condition = "and cd=?";
//		String order = " order by cd asc";
		Subject subject = new Subject();


		try {


			statement = connection.prepareStatement("select * from subject where school_cd=?");
			statement.setString(1, school.getCd());
			rSet = statement.executeQuery();

			while (rSet.next()) {
				subject.setCd(rSet.getString("cd"));
				subject.setName(rSet.getString("name"));
				subject.setSchool(school);
				list.add(subject);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return list;
	}



	public boolean save(Subject subject) throws Exception{

		Connection connection = getConnection();
		PreparedStatement statement = null;
		School school = new School();
		int count = 0;

		try {
			Subject old = get(subject.getCd(), school);
			if (old == null) {
				statement = connection.prepareStatement(
					"insert into subject(cd, name, school_cd) values(?, ?, ?)");
				statement.setString(1, subject.getCd());
				statement.setString(2, subject.getSchool().getCd());
				statement.setString(3, subject.getName());
			} else {
				statement = connection.prepareStatement(

					"update subject set name=? where cd=?");
				statement.setString(1, subject.getName());
				statement.setString(2, subject.getCd());
			}

			count = statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		if (count > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(Subject subject) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;

		try {
			statement = connection.prepareStatement(
				"delete from subject where cd=?");
			statement.setString(1, subject.getCd());

			count = statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		if (count > 0) {
			return true;
		} else {
			return false;
		}
	}

}

