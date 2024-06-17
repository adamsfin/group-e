package bean;

public class Subject implements java.io.Serializable {

	private String cd;
	private String name;
	private School school;

	public void setCd(String cd) { this.cd = cd; }

	public String getCd(){ return cd; }

	public void setName(String name) { this.name = name; }

	public String getName() { return name; }

	public void setSchool(School school) { this.school = school; }

	public School getSchool() { return school; }

}