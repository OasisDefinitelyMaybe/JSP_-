package com.momo.dto;

public class DepartLocaDto {
    private String dept_id;
    private String dept_title;
    private String location_id;
    private String location_code;
    private String national_code;
    private String local_name;
    
    @Override
    public String toString() {
    	// TODO Auto-generated method stub
    	return super.toString();
    }
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_title() {
		return dept_title;
	}
	public void setDept_title(String dept_title) {
		this.dept_title = dept_title;
	}
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
	public String getLocation_code() {
		return location_code;
	}
	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}
	public String getNational_code() {
		return national_code;
	}
	public void setNational_code(String national_code) {
		this.national_code = national_code;
	}
	public String getLocal_name() {
		return local_name;
	}
	public void setLocal_name(String local_name) {
		this.local_name = local_name;
	}
}
