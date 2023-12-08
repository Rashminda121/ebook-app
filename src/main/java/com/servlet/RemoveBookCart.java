package com.servlet;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int  bid= Integer.parseInt(req.getParameter("bid"));
        int uid=Integer.parseInt(req.getParameter("uid"));

        CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
        boolean f=dao.deletebook(bid,uid);

        HttpSession sesssion=req.getSession();

        if(f){
            sesssion.setAttribute("success","Book Removed Successfully.");
            resp.sendRedirect("checkout.jsp");
        }else{
            sesssion.setAttribute("fail","Something Went Wrong");
            resp.sendRedirect("checkout.jsp");
        }

    }
}
