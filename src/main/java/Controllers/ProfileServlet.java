package Controllers;

import DAO.DaoFactory;
import Models.Category;
import Models.Post;
import Models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Controllers.ProfileServlet", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());

        request.setAttribute("posts", DaoFactory.getPostsDao().all());



        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/Profile/index.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        String username = request.getParameter("username");
        User user = DaoFactory.getUsersDao().findByUsername(username);
        request.getSession().setAttribute("user", user);

        Integer catId = Integer.parseInt(request.getParameter("catId"));
        System.out.println(catId);
        Category category = DaoFactory.getCategoriesDao().findById(catId);
        request.getSession().setAttribute("category", category);
        System.out.println(category.getName());



        String updateOrDelete = request.getParameter("updateOrDelete").toUpperCase();
        if (updateOrDelete.equalsIgnoreCase("delete")) {
            Post post = new Post(
                    Integer.parseInt(request.getParameter("id")),
                    Integer.parseInt(request.getParameter("Userid")),
                    request.getParameter("title"),
                    request.getParameter("content"),
                    Integer.parseInt(request.getParameter("price")),
                    Integer.parseInt(request.getParameter("category")),
                    request.getParameter("img")
            );
            request.setAttribute("update", "delete");
            DaoFactory.getPostsDao().delete(post);
            response.sendRedirect("/profile");
        } else if (updateOrDelete.equalsIgnoreCase("updatePost")) {
            Post post = new Post(
                    Integer.parseInt(request.getParameter("id")),
                    Integer.parseInt(request.getParameter("Userid")),
                    request.getParameter("title"),
                    request.getParameter("content"),
                    Integer.parseInt(request.getParameter("price")),
                    Integer.parseInt(request.getParameter("category")),
                    request.getParameter("img")
            );
            DaoFactory.getPostsDao().update(post);
            response.sendRedirect("/profile");
        } else if (updateOrDelete.equalsIgnoreCase("updateProfile")){

            User user2 = new User(
                    Integer.parseInt(request.getParameter("EditId")),
                    username,
                    request.getParameter("email"),
                    request.getParameter("password")
            );
            DaoFactory.getUsersDao().update(user2);
            response.sendRedirect("/profile");
        }else if(updateOrDelete.equalsIgnoreCase("deleteProfile")){
            User user2 = new User(
                    Integer.parseInt(request.getParameter("EditId")),
                    username,
                    request.getParameter("email"),
                    request.getParameter("password")
            );
            DaoFactory.getUsersDao().delete(user2);
            request.getSession().invalidate();
            response.sendRedirect("/register");
        }
    }
}
