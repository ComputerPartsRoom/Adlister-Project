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

@WebServlet(name = "Controllers.PostsIndexServlet", urlPatterns = "/posts")
public class PostsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("posts", DaoFactory.getPostsDao().all());
        request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);

        String username = request.getParameter("username");
        request.setAttribute("user", DaoFactory.getUsersDao().findByUsername(username));

//        User user = (User) request.getSession().getAttribute("user");

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

//        User user = (User) request.getSession().getAttribute("user");

        String search = request.getParameter("search");

        request.setAttribute("posts", DaoFactory.getPostsDao().findByTitle(search));
        request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);


//        String sort = request.getParameter("sort");
//        if (sort != null) {
//            request.setAttribute("posts", DaoFactory.getPostsDao().sortByCategory(sort));
//            System.out.println("sort = " + sort);
//            request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);
//        }
    }

}