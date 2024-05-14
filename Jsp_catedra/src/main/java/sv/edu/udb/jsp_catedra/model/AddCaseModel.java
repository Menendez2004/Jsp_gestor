package sv.edu.udb.jsp_catedra.model;

import sv.edu.udb.jsp_catedra.beans.TicketsBeans;

import sv.edu.udb.jsp_catedra.utils.DBConenection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class AddCaseModel extends DBConenection {

    public void insertCase(TicketsBeans tk) {
        PreparedStatement ps;
        Connection conn;
        ResultSet rs;
        int affectedRows = 0;
        String status = "Espera";

        try {
            conn = getConnection();
            String INSERT = "INSERT INTO tickets(codigo, titulo, descripcion, argumentos, codDepa, codEstado, " +
                    "archivoPdf, codProgramador, codTester) VALUES(?,?,?,?,?,?,?,?,?)";

            ps = conn.prepareStatement(INSERT);
            ps.setString(1, tk.getCode());
            ps.setString(2, tk.getTittle());
            ps.setString(3, tk.getDescription());
            ps.setString(4, tk.getAguement());
            ps.setString(5, tk.getDepaCode());
            ps.setString(6, status);
            ps.setString(7, tk.getPdfFile());
            ps.setString(8, tk.getProgramerCode());
            ps.setString(9, tk.getTesterCode());
            affectedRows = ps.executeUpdate();
            System.out.println(affectedRows);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("no se pudo insertar");

        }

    }

    public int getRandomNumber() {
        Random random = new Random();
        return random.nextInt(900) + 100; // Genera un número aleatorio entre 100 y 999
    }

    private String getDeptPrefix(String deptCode) {
        return deptCode.substring(0, 2).toUpperCase();
    }
    public String getCurrentDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MMdd");
        return dateFormat.format(new Date());
    }


    // Método para combinar los datos obtenidos en uno solo
    public String generateCaseCode(String deptCode) {
        String deptPrefix = getDeptPrefix(deptCode);
        String currentDate = getCurrentDate();
        int randomNumber = getRandomNumber();
        return deptPrefix + currentDate  + randomNumber;
    }
}
