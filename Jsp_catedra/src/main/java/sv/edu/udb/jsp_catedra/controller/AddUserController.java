package sv.edu.udb.jsp_catedra.controller;

import java.io.*;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sv.edu.udb.jsp_catedra.beans.UsersBeans;
import sv.edu.udb.jsp_catedra.model.AddUserModel;
import sv.edu.udb.jsp_catedra.utils.Funtions;

@WebServlet(name = "AddUserController", value = "/add-user")
public class AddUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUser = 0;
        String first_name = request.getParameter("nombre");
        String last_name = request.getParameter("apellido");
        String department = request.getParameter("departamento");
        String typeUser = request.getParameter("tipo_usuario");
        String username = request.getParameter("usuario");
        String password = request.getParameter("contrasenia");

        AddUserModel addUserModel = new AddUserModel();
        Funtions fun = new Funtions();
        String code = fun.generateUserCode(first_name, last_name);
        UsersBeans usersBeans = new UsersBeans(idUser,code,first_name,last_name,department,typeUser,username,password);

        try {
            addUserModel.addUser(usersBeans);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/add_user.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());
        }
    }
}
