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

@WebServlet(name = "Controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Register/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
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
            out.println("location='/profile';");
            out.println("</script>");
        } else {
            User user1 = new User(username, email, password);
            DaoFactory.getUsersDao().insert(user1);
            response.sendRedirect("/login");
        }


//         }  else if(email.equalsIgnoreCase(userEmail.getEmail())){
//             PrintWriter out = response.getWriter();
//             response.setContentType("text/html");
//             out.println("<script type=\"text/javascript\">");
//             out.println("alert('Email in use');");
//             out.println("location='/register';");
//             out.println("</script>");
    }
}


//        User userEmail = DaoFactory.getUsersDao().findByEmail(email);
//
//        if (userEmail == null) {
//            User verifiedEmail = new User(username, email, password);
//            DaoFactory.getUsersDao().insert(verifiedEmail);
//            response.sendRedirect("/login");
//        } else if (email.equalsIgnoreCase(userEmail.getEmail())) {
//            PrintWriter out = response.getWriter();
//            response.setContentType("text/html");
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Email in use');");
//            out.println("location='/register';");
//            out.println("</script>");
//        }


//        boolean usernameInput = username.matches(username);
//        boolean emailInput = email.matches(email);
//        boolean passwordInput = password.matches(passwordConfirmation);

//        if (usernameInput) {

//        } else {
//            PrintWriter out = response.getWriter();
//            response.setContentType("text/html");
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Account Created!');");
//            out.println("location='/login';");
//            out.println("</script>");
//        }

//        if (emailInput) {
//
//            PrintWriter out = response.getWriter();
//            response.setContentType("text/html");
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Email in use');");
//            out.println("location='/register';");
//            out.println("</script>");
//            return;
//        } else {
//            PrintWriter out = response.getWriter();
//            response.setContentType("text/html");
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Email available');");
//            out.println("location='/login';");
//            out.println("</script>");
//            return;
//        }
//            response.sendRedirect("/"); // change to user profile page?
//            return;

//        if (inputHasErrors) {
//            response.sendRedirect("/profile"); // change to user profile page?
//            return;
//        } else () { // pop up with redirect
//            PrintWriter out = response.getWriter();
//            response.setContentType("text/html");
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('User or password incorrect');");
//            out.println("location='/register';");
//            out.println("</script>");
//        }


//        try {
//            // create and save a new user

//            DaoFactory.getUsersDao().insert(user);
//            response.sendRedirect("/login");
//        } catch (Exception e ){
//           request.getRequestDispatcher("WEB-INF/UserExists/index.jsp").forward(request,response);
//        }
