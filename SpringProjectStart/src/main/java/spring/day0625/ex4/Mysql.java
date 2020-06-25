package spring.day0625.ex4;

public class Mysql {
	private String driver;
	private String url;
	private String user;
	private String password;
	
	public Mysql(String driver, String url) {
		this.driver=driver;
		this.url=url;
		
		// TODO Auto-generated constructor stub
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	//toString method
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Mysql :\ndriver: "+driver+"\nurl: "+url+"\nuser: "+user+"\npassword: "+password;
	}
}
