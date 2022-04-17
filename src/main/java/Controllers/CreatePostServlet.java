package Controllers;

import DAO.DaoFactory;
import Models.Post;
import Models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        User user = (User) request.getSession().getAttribute("user");

        Integer categoryOfPost = Integer.parseInt(request.getParameter("Category"));

        Post post = new Post(
                user.getId(),
                request.getParameter("title"),
                request.getParameter("content"),
                Integer.parseInt(request.getParameter("price")),
                categoryOfPost,
                request.getParameter("img"),
                request.getParameter("name"),
                user.getUsername()
        );


        File img = new File(request.getParameter("img"));
        System.out.println(img);
        String absolutePath = request.getServletContext().getRealPath("");
        System.out.println(absolutePath);


        DaoFactory.getPostsDao().insert(post);
        response.sendRedirect("/profile");
    }
}