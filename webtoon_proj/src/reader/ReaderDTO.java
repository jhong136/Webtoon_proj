package reader;

import java.util.Date;

public class ReaderDTO {
	private String r_nicknme;
	private String r_id;
	private String r_pwd;
	private String r_gender;
	private Date r_birth;
	private Date r_date;
	private int r_coin;
	
	public ReaderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReaderDTO(String r_nicknme, String r_id, String r_pwd, String r_gender, Date r_birth, Date r_date,
			int r_coin) {
		super();
		this.r_nicknme = r_nicknme;
		this.r_id = r_id;
		this.r_pwd = r_pwd;
		this.r_gender = r_gender;
		this.r_birth = r_birth;
		this.r_date = r_date;
		this.r_coin = r_coin;
	}

	public String getR_nicknme() {
		return r_nicknme;
	}

	public void setR_nicknme(String r_nicknme) {
		this.r_nicknme = r_nicknme;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_pwd() {
		return r_pwd;
	}

	public void setR_pwd(String r_pwd) {
		this.r_pwd = r_pwd;
	}

	public String getR_gender() {
		return r_gender;
	}

	public void setR_gender(String r_gender) {
		this.r_gender = r_gender;
	}

	public Date getR_birth() {
		return r_birth;
	}

	public void setR_birth(Date r_birth) {
		this.r_birth = r_birth;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getR_coin() {
		return r_coin;
	}

	public void setR_coin(int r_coin) {
		this.r_coin = r_coin;
	}
}
