package Controllers;

import DAO.DaoFactory;
import Models.Message;
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


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User user = (User) request.getSession().getAttribute("user");


        request.setAttribute("posts", DaoFactory.getPostsDao().all());
        request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);

        Integer id = Integer.parseInt(request.getParameter("postId"));
        String sender = request.getParameter("sender_id");
        String receiver = request.getParameter("receiver_id");
        String content = request.getParameter("content");
        Integer user_id = Integer.parseInt(request.getParameter("user_id"));
        Integer receivedId = Integer.parseInt(request.getParameter("receivedId"));


        Message message = new Message(
                id,
                sender,
                receiver,
                content,
                user_id,
                receivedId
        );

        DaoFactory.getMessagesDao().insert(message);
        response.sendRedirect("/messages");


    }

}