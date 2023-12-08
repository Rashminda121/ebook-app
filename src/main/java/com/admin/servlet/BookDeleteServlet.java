package com.admin.servlet;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete")
public class BookDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id= Integer.parseInt(req.getParameter("id"));

            BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
            boolean f= dao.deleteBooks(id);

            HttpSession session=req.getSession();

            if(f){

                session.setAttribute("succMsg","Book Deleted Successfully.");
                resp.sendRedirect("admin/all_books.jsp");

            }else{
                session.setAttribute("fail","Something went Wrong.");
                resp.sendRedirect("admin/all_books.jsp");
            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
