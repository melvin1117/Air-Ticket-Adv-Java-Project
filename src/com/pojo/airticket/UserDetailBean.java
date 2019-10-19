package com.pojo.airticket;

public class UserDetailBean {
	private String name,username,email,mobile,gender,city,status,role;
	
	public UserDetailBean()
	{
		
	}

	public UserDetailBean(String name, String username, String email, String mobile, String gender, String city,String status,String role) {
		super();
		this.name = name;
		this.username = username;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.city = city;
		this.status=status;
		this.role=role;
	}
	

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
