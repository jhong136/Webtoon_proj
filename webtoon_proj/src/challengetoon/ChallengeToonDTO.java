package challengetoon;

public class ChallengeToonDTO {
	private String c_code;
	private String c_title;
	private String c_genre;
	private String c_intro;
	private String c_img;
	private String c_mark;
	private String r_nickName;
		
	public ChallengeToonDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChallengeToonDTO(String c_code, String c_title, String c_genre, String c_intro, String c_img, String c_mark,
			String r_nickName) {
		super();
		this.c_code = c_code;
		this.c_title = c_title;
		this.c_genre = c_genre;
		this.c_intro = c_intro;
		this.c_img = c_img;
		this.c_mark = c_mark;
		this.r_nickName = r_nickName;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_genre() {
		return c_genre;
	}

	public void setC_genre(String c_genre) {
		this.c_genre = c_genre;
	}

	public String getC_intro() {
		return c_intro;
	}

	public void setC_intro(String c_intro) {
		this.c_intro = c_intro;
	}

	public String getC_img() {
		return c_img;
	}

	public void setC_img(String c_img) {
		this.c_img = c_img;
	}

	public String getC_mark() {
		return c_mark;
	}

	public void setC_mark(String c_mark) {
		this.c_mark = c_mark;
	}

	public String getR_nickName() {
		return r_nickName;
	}

	public void setR_nickName(String r_nickName) {
		this.r_nickName = r_nickName;
	}
}
