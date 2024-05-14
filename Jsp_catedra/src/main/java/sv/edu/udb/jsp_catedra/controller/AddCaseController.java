package sv.edu.udb.jsp_catedra.controller;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import sv.edu.udb.jsp_catedra.beans.TicketsBeans;
import sv.edu.udb.jsp_catedra.model.AddCaseModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AddCaseController", value = "/request-case")
@MultipartConfig
public class AddCaseController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idTicket = 0;
        String title = request.getParameter("titulo");
        String description = request.getParameter("descripcion");
        Part pdfPart = request.getPart("pdf");
        String pdfFileName = pdfPart.getSubmittedFileName();
        String depaCode = request.getParameter("depaCode");
        String statusCode = request.getParameter("statusCode");
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = dateFormat.format(date);

        AddCaseModel model = new AddCaseModel();
        String caseCode = model.generateCaseCode(depaCode);

        TicketsBeans ticket = new TicketsBeans(idTicket, caseCode, title, description, "", depaCode, statusCode,
                pdfFileName, "", "", currentDate, "");

        model.insertCase(ticket);

        response.sendRedirect("admin.jsp");
    }

}
