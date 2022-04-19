package Controllers;

import DAO.DaoFactory;
import Models.Message;
import Models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Register/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String img = request.getParameter("img");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");


        // validate input
        boolean inputHasErrors =
                username.isEmpty()
                        || email.isEmpty()
                        || password.isEmpty()
                        || (!password.equals(passwordConfirmation));

        User user = DaoFactory.getUsersDao().findByUsername(username);
        User userEmail = DaoFactory.getUsersDao().findByEmail(email);


        if (inputHasErrors) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Blank fields');");
            out.println("location='/register';");
            out.println("</script>");
        } else if (user != null || userEmail != null) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Email or Username in use');");
            out.println("location='/register';");
            out.println("</script>");
        } else {
            User user1 = new User(username, email, password, img);
            DaoFactory.getUsersDao().insert(user1);



            response.sendRedirect("/login");
        }

    }
}