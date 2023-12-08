package com.admin.servlet;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

import static jakarta.servlet.http.Part.*;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String bookName=req.getParameter("name");
            String author= req.getParameter("author");
            //Double price=Double.parseDouble(req.getParameter("price"));
            String price=req.getParameter("price");
            String categories=req.getParameter("categories");
            String status=req.getParameter("status");
            Part part=req.getPart("img");
            String fileName=part.getSubmittedFileName();

            BookDtls b=new BookDtls(bookName,author,price,categories,status,fileName,"admin");

            BookDAOimpl dao =new BookDAOimpl(DBConnect.getConn());

            /*String path=getServletContext().getRealPath("") + "book";
            //System.out.println(path);

            File f=new File(path);
            //Part.write(path+File.separator+fileName);
            try {
                part.write(path + File.separator + fileName);
            } catch (IOException e) {
                e.printStackTrace(); // Handle the exception appropriately
            }*/

            boolean f= dao.addBooks(b);

            HttpSession session=req.getSession();
            if (f){

                String path=getServletContext().getRealPath("") + "book";

                File file=new File(path);
                //Part.write(path+File.separator+fileName);
                try {
                    part.write(path + File.separator + fileName);
                } catch (IOException e) {
                    e.printStackTrace(); // Handle the exception appropriately
                }


                session.setAttribute("succMsg","Book Added successfully.");
                resp.sendRedirect("admin/add_books.jsp");
            }else{
                session.setAttribute("failMsg","Something Went Wrong.");
                resp.sendRedirect("admin/add_books.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
