package Controllers;

import DAO.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/posts/sort")

public class SortServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sort = request.getParameter("sort");
        if (sort != null) {
            request.setAttribute("posts", DaoFactory.getPostsDao().sortByCategory(sort));
            System.out.println("sort = " + sort);
            request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);
        }


        response.sendRedirect("/posts");
    }

}
