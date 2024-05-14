package sv.edu.udb.jsp_catedra.controller;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sv.edu.udb.jsp_catedra.beans.DepaBeans;
import sv.edu.udb.jsp_catedra.model.AddDepaModel;
import sv.edu.udb.jsp_catedra.utils.Funtions;

@WebServlet(name = "AddDepaControllerServlet", value = "/Add-depa")
public class AddDepaController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int Id = 0;
        String nombre = request.getParameter("nombre");

        Funtions fun = new Funtions();
        AddDepaModel adm = new AddDepaModel();
        String code = fun.generateDepaCode(nombre);
        DepaBeans depaBeans = new DepaBeans(Id, code, nombre);

        try {
            adm.addDepa(depaBeans);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/add_depa.jsp");
            rd.forward(request, response);
        }catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }

    }
}