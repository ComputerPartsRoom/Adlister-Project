package Controllers;

import DAO.DaoFactory;
import Models.Post;
import Models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

@WebServlet(name = "Controllers.CreatePostServlet", urlPatterns = "/create")
public class CreatePostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }


        request.getRequestDispatcher("/WEB-INF/Create/Create.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User user = (User) request.getSession().getAttribute("user");

        String img = request.getParameter("condition");
        Long categoryOfPost = Long.parseLong(request.getParameter("Category"));

        Post post = new Post(
                user.getId(),
                request.getParameter("title"),
                request.getParameter("content"),
                Long.parseLong(request.getParameter("price")),
                img,
                categoryOfPost,
                user.getUsername()
        );




        DaoFactory.getPostsDao().insert(post);
        response.sendRedirect("/profile");
    }
}