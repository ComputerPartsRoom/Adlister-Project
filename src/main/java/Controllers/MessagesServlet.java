package Controllers;

import DAO.DaoFactory;
import Models.Category;
import Models.Message;
import Models.Post;
import Models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "Controllers.MessagesServlet", urlPatterns = "/messages")
public class MessagesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("messages", DaoFactory.getMessagesDao().all());

        request.setAttribute("posts", DaoFactory.getPostsDao().all());


        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
//            return;
        }
        request.getRequestDispatcher("/WEB-INF/Messages/index.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


//        request.setAttribute("messages", DaoFactory.getMessagesDao().all());
        request.getRequestDispatcher("/WEB-INF/Messages/index.jsp").forward(request, response);

        Message message = new Message(
                Integer.parseInt(request.getParameter("ReplyPostId")),
                request.getParameter("SendingUser"),
                request.getParameter("ReceivingUser"),
                request.getParameter("content"),
                Integer.parseInt(request.getParameter("SenderId")),
                Integer.parseInt(request.getParameter("ReceiverId"))
        );
        DaoFactory.getMessagesDao().insert(message);
        response.sendRedirect("/messages");

    }



}




