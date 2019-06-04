package challengetoon;

public class CEpisodeDTO {
	private String c_code;
	private int c_no;
	private String c_name;
	private int c_grade;
	private String c_content;
	
	public CEpisodeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CEpisodeDTO(String c_code, int c_no, String c_name, int c_grade, String c_content) {
		super();
		this.c_code = c_code;
		this.c_no = c_no;
		this.c_name = c_name;
		this.c_grade = c_grade;
		this.c_content = c_content;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_grade() {
		return c_grade;
	}

	public void setC_grade(int c_grade) {
		this.c_grade = c_grade;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
}
