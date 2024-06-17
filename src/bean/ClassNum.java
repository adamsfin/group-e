package bean;

public class ClassNum implements java.io.Serializable {

	private School school;
	private String classNum;

	public void setSchool(School school){ this.school = school; }

	public School getSchool() { return school; }

	public void setClassNum(String classNum) { this.classNum = classNum; }

	public String getClassNum() { return classNum; }

}