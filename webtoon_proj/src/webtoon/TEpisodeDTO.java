package webtoon;

public class TEpisodeDTO {
	private String t_code;
	private int t_no;
	private String t_name;
	private int t_grade;
	private String t_content;
	
	
	public TEpisodeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TEpisodeDTO(String t_code, int t_no, String t_name, int t_grade, String t_content) {
		super();
		this.t_code = t_code;
		this.t_no = t_no;
		this.t_name = t_name;
		this.t_grade = t_grade;
		this.t_content = t_content;
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public int getT_grade() {
		return t_grade;
	}

	public void setT_grade(int t_grade) {
		this.t_grade = t_grade;
	}

	public String getT_content() {
		return t_content;
	}

	public void setT_content(String t_content) {
		this.t_content = t_content;
	}
}
