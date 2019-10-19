package com.dao.airticketbooking;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JOptionPane;
public class MySqlConnect {
	Connection conn=null;
	public static Connection ConnectDB (){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/air_ticket_db","root","");
			return conn;
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}
	}

}
