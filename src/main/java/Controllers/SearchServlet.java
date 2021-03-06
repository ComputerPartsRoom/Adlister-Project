package Controllers;

import DAO.DaoFactory;
import Models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/posts/search")

public class SearchServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        String search = request.getParameter("search");

        request.setAttribute("posts", DaoFactory.getPostsDao().findByTitle(search));
        request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);
    }

}
