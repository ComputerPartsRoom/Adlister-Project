package Controllers;

import DAO.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.indexServlet", urlPatterns = "/")
public class indexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("posts", DaoFactory.getPostsDao().all());
        request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);
    }
}

