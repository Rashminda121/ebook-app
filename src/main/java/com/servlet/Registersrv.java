package com.servlet;

import com.DAO.RegiterDao;
import com.entity.UserReg;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/registersrv")
public class Registersrv extends HttpServlet {


    public boolean f;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name=req.getParameter("fname");
        String email=req.getParameter("email");
        String phno=req.getParameter("phno");
        String password=req.getParameter("password");
        String check=req.getParameter("check");

        UserReg us=new UserReg(name,email,phno,password);

        HttpSession session =req.getSession();

        //if(check !=null){

            RegiterDao rdao=new RegiterDao();
            //String result=rdao.insert(us);
            //Boolean
            f=rdao.insert(us);

            if (f){
                //System.out.println("User Register Success... ");

                session.setAttribute("succMsg","User registerd successfully...");
                resp.sendRedirect("register.jsp");
            }else{
                //System.out.println("Something went wrong... ");

                session.setAttribute("failMsg","Something went wrong please try again");
                resp.sendRedirect("register.jsp");
            }
       // }
       // else{
           // System.out.println("Please check the confirm before register.");
        //}

        //resp.getWriter().println(result);
    }

    /*@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().append("Served at: ").append(req.getContextPath());
    }*/

    public String register=null;
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =req.getSession();
        RequestDispatcher rd=null;
        if (f){
            register="Registerd Successfuly";
            //req.setAttribute("status","User registerd successfully...");
            req.setAttribute("status","success");
             rd =req.getRequestDispatcher("register.jsp");
             rd.forward(req,resp);

        }else{
            register="Something went Wrong";
            //req.setAttribute("status","Something went wrong please try again");
            req.setAttribute("status","fail");
            rd =req.getRequestDispatcher("register.jsp");
            rd.forward(req,resp);
        }

    }
}
