package sv.edu.udb.jsp_catedra.controller;

import java.io.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sv.edu.udb.jsp_catedra.utils.DBConenection;

@WebServlet(name = "editCase", value = "/editCase")
public class EditCaseController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idTicket = request.getParameter("casoId"); // Corrected parameter name
        String argumento = request.getParameter("argumentos");
        String codEstado = request.getParameter("codEstado");
        String codProgramador = request.getParameter("codProgramador");
        String codTester = request.getParameter("codTester");
        String date = request.getParameter("date");

        try {
            String SQLUPDATE = "UPDATE tickets SET argumentos = ?, codEstado = ?, codProgramador = ?, codTester = ?, fechaEmision=? WHERE Id = ? ";
            PreparedStatement stTicket = DBConenection.getConnection().prepareStatement(SQLUPDATE);
            stTicket.setString(1, argumento);
            stTicket.setString(2, codEstado);
            stTicket.setString(3, codProgramador);
            stTicket.setString(4, codTester);
            stTicket.setString(5, date);
            stTicket.setString(6, idTicket); // Corrected parameter index
            stTicket.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("magment_cases.jsp").forward(request, response);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}