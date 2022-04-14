//package Controllers;
//
//import DAO.DaoFactory;
//import Models.Category;
//import Models.Post;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet(name = "Controllers.categoryServlet", urlPatterns = "/profile/category")
//public class categoryServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
//
//        request.setAttribute("posts", DaoFactory.getPostsDao().all());
//
//
//        Integer id = Integer.parseInt(request.getParameter("catId"));
//        request.setAttribute("category", DaoFactory.getCategoriesDao().findById(id));
//
//
//    }
//}
