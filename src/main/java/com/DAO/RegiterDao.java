package com.DAO;

import com.entity.UserReg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegiterDao {

   private String dburl = "jdbc:mysql://localhost:3306/ebook-app";
   private String dbuser = "root";
   private String dbpassword = "1234";
   private String dbdriver = "com.mysql.jdbc.Driver";


   public void loadDriver(String dbdriver){
      try {
         Class.forName(dbdriver);
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      }
   }

   public Connection getConnection(){
      Connection conn=null;
      try {
        conn= DriverManager.getConnection(dburl,dbuser,dbpassword);
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return conn;
   }

   public Boolean insert (UserReg us){

      boolean f=true;

      loadDriver(dbdriver);

      Connection conn=getConnection();

      //String result="Data entered successfully. ";

      String sql="insert into user (name,email,phno,password) values(?,?,?,?)";


      try {
         PreparedStatement ps=conn.prepareStatement(sql);
         ps.setString(1,us.getName());
         ps.setString(2,us.getEmail());
         ps.setString(3,us.getPhno());
         ps.setString(4,us.getPassword());

         ps.executeUpdate();

      } catch (SQLException e) {
         e.printStackTrace();
         //result="Data not entered successfully. ";
         f=false;
      }

      //return result;
      return f;
   }
}