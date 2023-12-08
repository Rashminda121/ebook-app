package com.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	public RegisterServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//values getting from the registration form names 
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);

			UserDAOImpl dao=new UserDAOImpl();
			boolean f=dao.userRegister(us);

			if (f){
				System.out.println("User Register Success... ");
			}else{
				System.out.println("Something went wrong... ");
			}



		} catch (Exception e) {
			e.getStackTrace();
		}

	}

}
