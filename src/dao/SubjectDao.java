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

	private String baseSql = "select * from subject where school_cd=?";

	public Subject get (String cd, School school) throws Exception {

		Subject subject = new Subject();
		Connection connection = getConnection();
		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement("select * from subject where cd=? and school_cd=?");
		statement = connection.prepareStatement("select * from suject where cd=?");
			statement.setString(1, cd);
			ResultSet rSet = statement.executeQuery();
		SchoolDao schoolDao = new SchoolDao();

			if (rSet.next()) {
				subject.setCd(rSet.getString("cd"));
				subject.setName(rSet.getString("name"));
			subject.setSchool(schoolDao.get(rSet.getString("school")));
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
	public List<Subject> filter(School school) throws Exception{
		List<Subject> list = new ArrayList<>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
		String condition = "and cd=? and name=?";
		String order = " order by no asc";
		String conditionIsAttend = "";

		try {
			statement = connection.prepareStatement(baseSql + condition + conditionIsAttend + order);
			statement.setString(1, school.getCd());
			rSet = statement.executeQuery();

			while (rSet.next()) {
				Subject subject = new Subject();
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
		int count = 0;
		School school = new School();


		try {

			Subject old = get(subject.getCd(), school);
			if (old == null) {
				statement = connection.prepareStatement(
					"insert into subject(cd, school_cd, name) values(?, ?, ?)");
				statement.setString(1, subject.getCd());
				statement.setString(2, subject.getName());
				statement.setString(3, subject.getSchool().getCd());
			} else {
				statement = connection.prepareStatement(
					"update student set name=?, Cd=?, where no=?");
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

	public boolean delete(Subject subject) throws Exception{

	Connection connection = getConnection();
	PreparedStatement statement = null;
	int count = 0;


	try {

			statement = connection.prepareStatement(
				"delete from subject where cd = ?");
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



