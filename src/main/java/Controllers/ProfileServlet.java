package Controllers;

import DAO.DaoFactory;
import Models.Category;
import Models.Message;
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

        request.setAttribute("messages", DaoFactory.getMessagesDao().all());

        request.setAttribute("posts", DaoFactory.getPostsDao().all());


        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/Profile/index.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        String username = request.getParameter("username");
//        User user = DaoFactory.getUsersDao().findByUsername(username);
//        User user0 = (User) request.getSession().getAttribute("user");

        String receiver = request.getParameter("username");
        request.setAttribute("messages", DaoFactory.getMessagesDao().findByReceiver(receiver));




        String updateOrDelete = request.getParameter("updateOrDelete").toUpperCase();
        if (updateOrDelete.equalsIgnoreCase("delete")) {
            Post post = new Post(
                    Integer.parseInt(request.getParameter("id")),
                    Integer.parseInt(request.getParameter("Userid")),
                    request.getParameter("title"),
                    request.getParameter("content"),
                    Integer.parseInt(request.getParameter("price")),
                    Integer.parseInt(request.getParameter("category")),
                    request.getParameter("img"),
                    request.getParameter("name"),
                    request.getParameter("username")
            );

            request.setAttribute("update", "delete");
            Integer id = Integer.parseInt(request.getParameter("id"));

            Message message = new Message(
                    id
            );
            DaoFactory.getMessagesDao().delete(message);
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
                    request.getParameter("img"),
                    request.getParameter("name"),
                    request.getParameter("username")
            );
            DaoFactory.getPostsDao().update(post);
            response.sendRedirect("/profile");

        } else if (updateOrDelete.equalsIgnoreCase("updateProfile")){

            User user2 = new User(
                    Integer.parseInt(request.getParameter("EditId")),
                    request.getParameter("username"),
                    request.getParameter("email"),
                    request.getParameter("password"),
                    request.getParameter("img")
            );
            System.out.println("Integer.parseInt(request.getParameter(\"EditId\")) = " + Integer.parseInt(request.getParameter("EditId")));
            System.out.println("request.getParameter(\"username\") = " + request.getParameter("username"));
            System.out.println("request.getParameter(\"email\") = " + request.getParameter("email"));
            System.out.println("request.getParameter(\"password\") = " + request.getParameter("password"));
            System.out.println("request.getParameter(\"img\") = " + request.getParameter("img"));

            DaoFactory.getUsersDao().update(user2);

            response.sendRedirect("/login");


        }else if(updateOrDelete.equalsIgnoreCase("deleteProfile")){
            User user3 = new User(
                    Integer.parseInt(request.getParameter("EditId")),
                    username,
                    request.getParameter("email"),
                    request.getParameter("password"),
                    request.getParameter("img")
            );
            DaoFactory.getUsersDao().delete(user3);
            request.getSession().invalidate();
            response.sendRedirect("/register");
        }
    }
}
