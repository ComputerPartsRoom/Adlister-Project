package Controllers;

import DAO.DaoFactory;
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


//        try {
//            boolean validAttempt = false;
//
//            // validate input
//            boolean inputHasBlanks =
//                    username.isEmpty()
//                            || password.isEmpty()
//                            || (!password.equals(password));
//            boolean inputHasWrongData =
//                    username == user.getUsername()
//                            || password == user.getPassword();
//
//            if (inputHasBlanks) {
//                PrintWriter out = response.getWriter();
//                response.setContentType("text/html");
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Blank fields');");
//                out.println("location='/login';");
//                out.println("</script>");
//            }
//            if (inputHasWrongData) {
//                PrintWriter out = response.getWriter();
//                response.setContentType("text/html");
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Username or Password Incorrect');");
//                out.println("location='/login';");
//                out.println("</script>");
//            }
//            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
//                validAttempt = true;
//            }
//            if (validAttempt) {
//                request.getSession().setAttribute("user", user);
//                response.sendRedirect("/profile");
//            }
//        } catch (Exception e) {
////            response.sendRedirect("/login");
//            PrintWriter out = response.getWriter();
//            response.setContentType("text/html");
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('User Doesn't Exist');");
//            out.println("location='/login';");
//            out.println("</script>");
//        }
        try {
            if (user.getPassword().equals(password)) {
                validAttempt = true;
            }
            if (validAttempt) {

                request.getSession().setAttribute("user", user);
                response.sendRedirect("/profile");
            } else {
                response.sendRedirect("/login");
            }
        } catch (Exception e) {
            request.getRequestDispatcher("WEB-INF/UserDoesntExist/index.jsp").forward(request, response);
        }
    }
}
