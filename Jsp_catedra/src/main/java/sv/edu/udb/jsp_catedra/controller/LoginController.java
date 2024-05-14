package sv.edu.udb.jsp_catedra.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import sv.edu.udb.jsp_catedra.beans.UsersBeans;
import sv.edu.udb.jsp_catedra.model.LoginModel;

@WebServlet(name = "LoginController", value = "/login-users")
public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("usuario");
        String password = request.getParameter("contrasenia");

        try {
            UsersBeans user = new UsersBeans();
            user.setUsername(username);
            user.setPassword(password);

            LoginModel loginModel = new LoginModel();
            boolean isValidUser = loginModel.verifyUser(user);

            if (isValidUser) {
                String codigoUsuario = loginModel.obtenerCodigoUsuario(username);

                if (codigoUsuario != null) {

                    String urlRedireccion = loginModel.obtenerURLRedireccion(codigoUsuario);

                    response.sendRedirect(urlRedireccion);
                } else {
                    // Manejar caso donde no se encuentra el código de usuario
                    response.sendRedirect("error404.jsp");
                }
            } else {
                response.sendRedirect("error404.jsp");
                System.out.println("nada");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
