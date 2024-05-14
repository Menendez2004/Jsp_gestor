package sv.edu.udb.jsp_catedra.controller;

import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sv.edu.udb.jsp_catedra.utils.DBConenection;

@WebServlet(name = "DeleteUser", value = "/delete")
public class DeleteUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        String id = request.getParameter("id");
        String sqlDelete;


        if (tipo != null) {
            if (tipo.equalsIgnoreCase("usuario")) {
                sqlDelete = "DELETE FROM usuario WHERE id = ?";
            } else if (tipo.equalsIgnoreCase("ticket")) {
                sqlDelete = "DELETE FROM tickets WHERE id = ?";
            } else {

                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tipo de entidad no válido.");
                return;
            }

            try (PreparedStatement stmt = DBConenection.getConnection().prepareStatement(sqlDelete)) {
                stmt.setString(1, id);


                if (tipo.equalsIgnoreCase("usuario")) {
                    response.sendRedirect("users_views.jsp");
                } else if (tipo.equalsIgnoreCase("ticket")) {
                    response.sendRedirect("cases_views.jsp");
                }
            } catch (SQLException e) {

                throw new RuntimeException("Error al eliminar entidad: " + e.getMessage(), e);
            }
        } else {

            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetro 'tipo' no especificado.");
        }
    }
}
