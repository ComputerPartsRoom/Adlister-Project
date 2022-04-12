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

        User user = (User) request.getSession().getAttribute("user");

        request.setAttribute("posts", DaoFactory.getPostsDao().all());
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        User user = (User) request.getSession().getAttribute("user");

        Integer categoryOfPost = Integer.parseInt(request.getParameter("Category"));

        Post post = new Post(
                user.getId(),
                request.getParameter("title"),
                request.getParameter("content"),
                Integer.parseInt(request.getParameter("price")),
                categoryOfPost,
                request.getParameter("img")
        );

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