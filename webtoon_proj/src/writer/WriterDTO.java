package writer;

public class WriterDTO {
	String w_name;
	String w_realname;
	String w_mail;
	String w_phone;
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public String getW_realname() {
		return w_realname;
	}
	public void setW_realname(String w_realname) {
		this.w_realname = w_realname;
	}
	public String getW_mail() {
		return w_mail;
	}
	public void setW_mail(String w_mail) {
		this.w_mail = w_mail;
	}
	public String getW_phone() {
		return w_phone;
	}
	public void setW_phone(String w_phone) {
		this.w_phone = w_phone;
	}
	public WriterDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WriterDTO(String w_name, String w_realname, String w_mail, String w_phone) {
		super();
		this.w_name = w_name;
		this.w_realname = w_realname;
		this.w_mail = w_mail;
		this.w_phone = w_phone;
	}
	
	
}
