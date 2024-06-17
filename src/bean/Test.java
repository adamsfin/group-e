package bean;

import java.sql.Date;

public class Test implements java.io.Serializable {

	private Student student;
	private Subject subject;
	private School school;
	private Integer no;
	private Integer point;
	private String classNum;
	private Date updateDate;

	public void setStudent(Student student) { this.student = student; }

	public Student getStudent(){ return student; }

	public void setSubject(Subject subject) { this.subject = subject; }

	public Subject getSubject() { return subject; }

	public void setSchool(School school) { this.school = school; }

	public School getSchool() { return school; }

	public void setNo(Integer no) { this.no = no; }

	public Integer getNo(){ return no; }

	public void setPoint(Integer point) { this.point = point; }

	public Integer getPoint() { return point; }

	public void setClassNum(String classNum) { this.classNum = classNum; }

	public String ClassNum() { return classNum; }

	public void setUpdateDate(Date updateDate) { this.updateDate = updateDate; }

	public Date getUpdateDate() { return updateDate; }

}