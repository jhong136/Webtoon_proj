package webtoon;

public class WebtoonDTO {
	private String t_code;
	private String t_title;
	private String t_genre;
	private String t_intro;
	private String t_img;
	private String t_age;
	int nDays;
	private String[] days;
	int nWriters;
	private String[] writers;
	
	public WebtoonDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public WebtoonDTO(String t_code, String t_title, String t_genre, String t_intro, String t_img, String t_age,
			int nDays, String[] days, int nWriters, String[] writers) {
		super();
		this.t_code = t_code;
		this.t_title = t_title;
		this.t_genre = t_genre;
		this.t_intro = t_intro;
		this.t_img = t_img;
		this.t_age = t_age;
		this.days = days;
		this.nDays = nDays;
		this.writers = writers;
		this.nWriters = nWriters;
	}
	
	public String getT_code() {
		return t_code;
	}
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}
	public String getT_title() {
		return t_title;
	}
	public void setT_title(String t_title) {
		this.t_title = t_title;
	}
	public String getT_genre() {
		return t_genre;
	}
	public void setT_genre(String t_genre) {
		this.t_genre = t_genre;
	}
	public String getT_intro() {
		return t_intro;
	}
	public void setT_intro(String t_intro) {
		this.t_intro = t_intro;
	}
	public String getT_img() {
		return t_img;
	}
	public void setT_img(String t_img) {
		this.t_img = t_img;
	}
	public String getT_age() {
		return t_age;
	}
	public void setT_age(String t_age) {
		this.t_age = t_age;
	}
	public int getnDays() {
		return nDays;
	}
	public void setnDays(int nDays) {
		this.nDays = nDays;
	}
	public String[] getDays() {
		return days;
	}
	public void setDays(String[] days) {
		this.days = days;
	}
	public int getnWriters() {
		return nWriters;
	}
	public void setnWriters(int nWriters) {
		this.nWriters = nWriters;
	}
	public String[] getWriters() {
		return writers;
	}
	public void setWriters(String[] writers) {
		this.writers = writers;
	}
}
