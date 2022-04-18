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

@WebServlet(name = "Controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/Login/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);


        boolean validAttempt = false;

        System.out.println("username = " + username);
        System.out.println("password = " + password);
        System.out.println("user = " + user);

        System.out.println("username.isEmpty() = " + username.isEmpty());
        System.out.println("password.isEmpty() = " + password.isEmpty());

        boolean isNull =
                user == null;

        if (isNull) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('User not found');");
            out.println("location='/login';");
            out.println("</script>");
        }


        boolean inputHasBlanks =
                username.isEmpty()
                        || password.isEmpty()
                        || (!password.equals(password));

        System.out.println("inputHasBlanks = " + inputHasBlanks);

        if (inputHasBlanks) {
            System.out.println("\"Hello?\" = " + "Hello?");
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Blank fields');");
            out.println("location='/login';");
            out.println("</script>");
        }
        boolean inputHasWrongData =
                !username.equals(user.getUsername())
                        || !password.equals(user.getPassword());


        System.out.println("inputHasWrongData = " + inputHasWrongData);


        if (inputHasWrongData) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username or Password Incorrect');");
            out.println("location='/login';");
            out.println("</script>");
        }
        if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
            validAttempt = true;
        }
        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        }


    }
}
