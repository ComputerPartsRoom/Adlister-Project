package Controllers;

import DAO.DaoFactory;
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

        User user = (User) request.getSession().getAttribute("user");

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


        Post post = new Post(
                Integer.parseInt(request.getParameter("id")),
                Integer.parseInt(request.getParameter("Userid")),
                request.getParameter("title"),
                request.getParameter("content"),
                Integer.parseInt(request.getParameter("price")),
                Integer.parseInt(request.getParameter("category")),
                request.getParameter("img")
        );
        System.out.println(request.getParameter("id"));
        System.out.println(request.getParameter("title"));
        System.out.println(request.getParameter("content"));
        System.out.println(request.getParameter("price"));
        System.out.println(request.getParameter("category"));
        System.out.println(request.getParameter("img"));
//        String update = request.getParameter("update");

//        if (update.equalsIgnoreCase("update") && update != null) {
//
//        }

        String updateOrDelete = request.getParameter("updateOrDelete").toUpperCase();
        System.out.println(updateOrDelete);
        if (updateOrDelete.equalsIgnoreCase("delete")) {
            request.setAttribute("update", "delete");
            DaoFactory.getPostsDao().delete(post);
            response.sendRedirect("/profile");
            System.out.println("post.getId() = " + post.getId());
        } else if (updateOrDelete.equalsIgnoreCase("updatePost")) {
            DaoFactory.getPostsDao().update(post);
            response.sendRedirect("/profile");
        } else if (updateOrDelete.equalsIgnoreCase("updateProfile")){
            DaoFactory.getUsersDao().update(user2);
            response.sendRedirect("/profile");
        }

    }
}
