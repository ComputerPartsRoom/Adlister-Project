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

//        User user = (User) request.getSession().getAttribute("user");

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User user = (User) request.getSession().getAttribute("user");

        String search = request.getParameter("search");

        request.setAttribute("posts", DaoFactory.getPostsDao().findByTitle(search));
        request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);

        Integer id = Integer.parseInt(request.getParameter("postId"));
        String sender = request.getParameter("sender_id");
        String receiver = request.getParameter("receiver_id");
        String content = request.getParameter("content");
        Integer user_id = Integer.parseInt(request.getParameter("user_id"));
        Integer receivedId = Integer.parseInt(request.getParameter("receivedId"));


        System.out.println("request.getParameter(\"sender_id\") = " + request.getParameter("sender_id"));
        System.out.println("request.getParameter(\"receiver_id\") = " + request.getParameter("receiver_id"));
        System.out.println("request.getParameter(\"content\") = " + request.getParameter("content"));
        System.out.println("request.getParameter(\"user_id\") = " + request.getParameter("user_id"));
        System.out.println("request.getParameter(\"receivedId\") = " + request.getParameter("receivedId"));


        Message message = new Message(
                id,
                sender,
                receiver,
                content,
                user_id,
                receivedId
        );

        System.out.println("id " + id);
        System.out.println("sender " + sender);
        System.out.println("receiver " + receiver);
        System.out.println("content " + content);
        System.out.println("user ID " + user_id);
        System.out.println("receive ID " + receivedId);

        DaoFactory.getMessagesDao().insert(message);


        response.sendRedirect("/messages");


//        String sort = request.getParameter("sort");
//        if (sort != null) {
//            request.setAttribute("posts", DaoFactory.getPostsDao().sortByCategory(sort));
//            System.out.println("sort = " + sort);
//            request.getRequestDispatcher("/WEB-INF/Posts/index.jsp").forward(request, response);
//        }
    }

}