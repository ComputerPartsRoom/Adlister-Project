package Controllers;

import DAO.DaoFactory;
import Models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Controllers.PostsIndexServlet", urlPatterns = "/posts")
public class PostsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("posts", DaoFactory.getPostsDao().all());
        request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String search = request.getParameter("search");

            request.setAttribute("posts", DaoFactory.getPostsDao().all2(search));
            request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);


    }

}