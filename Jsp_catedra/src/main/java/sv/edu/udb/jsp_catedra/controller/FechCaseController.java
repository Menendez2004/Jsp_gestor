package sv.edu.udb.jsp_catedra.controller;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sv.edu.udb.jsp_catedra.beans.TicketsBeans;
import sv.edu.udb.jsp_catedra.beans.UsersBeans;
import sv.edu.udb.jsp_catedra.utils.DBConenection;

@WebServlet(name = "fetch-case", value = "/fetch-case")
public class FechCaseController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TicketsBeans> ticket = new ArrayList<>();

        try {
            String selectSql = "SELECT * FROM tickets";
            ResultSet subjResultSet = DBConenection.getConnection().createStatement().executeQuery(selectSql);
            while (subjResultSet.next()) {
                int id = subjResultSet.getInt("Id");
                String tkCode = subjResultSet.getString("codigo");
                String title = subjResultSet.getString("titulo");
                String description = subjResultSet.getString("descripcion");
                String argument = subjResultSet.getString("argumentos");
                String department = subjResultSet.getString("codDepa");
                String status = subjResultSet.getString("codEstado");
                String pdf = subjResultSet.getString("archivoPdf");
                String programer = subjResultSet.getString("codProgramador");
                String tester = subjResultSet.getString("codTester");
                String date = subjResultSet.getString("fechaEmision");
                TicketsBeans tk = new TicketsBeans(id,tkCode,title,description,argument,department,status,pdf,programer,
                        tester,date, "");
                ticket.add(tk);
            }
            request.setAttribute("tickets", ticket);
            request.getRequestDispatcher("cases_views.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error al obtener usuarios de la base de datos", e);

        }catch (IOException e){
            System.out.println("No hay nada");
        }
    }
}