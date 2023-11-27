package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.Job;

public class DepartLocaDao extends DBConnection{
   
	public DepartLocaDao(ServletContext application) {
		super(application);
	}
	
	public List<Job> getList() {
		List<Job> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from job");
			while(rs.next()) {
			 Job job = new Job();	
			job.setJobCode( rs.getString(1) );
			job.setJobName( rs.getString(2) );
			
			list.add(job);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
