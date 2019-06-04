package manager;

public class ManagerDTO {
	String m_code;
	String m_name;
	String m_id;
	String m_pwd;
	String m_mail;
	String m_phone;
	
	public ManagerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ManagerDTO(String m_code, String m_name, String m_id, String m_pwd, String m_mail, String m_phone) {
		super();
		this.m_code = m_code;
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_mail = m_mail;
		this.m_phone = m_phone;
	}
	
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_mail() {
		return m_mail;
	}
	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
}
