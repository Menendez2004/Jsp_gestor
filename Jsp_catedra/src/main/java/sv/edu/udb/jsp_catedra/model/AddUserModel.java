package sv.edu.udb.jsp_catedra.model;

import sv.edu.udb.jsp_catedra.beans.UsersBeans;
import sv.edu.udb.jsp_catedra.utils.DBConenection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class AddUserModel {

    public void addUser(UsersBeans usersBeans) {
        PreparedStatement ps;
        ResultSet rs;
        int affectedRows = 0;

        try (Connection conn = DBConenection.getConnection()) {

            String SQLINSERT = "INSERT INTO usuario(codigo, nombre, apellido, departamento, tipoUsuario, usuario, contrasenia) VALUES(?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(SQLINSERT);
            ps.setString(1, usersBeans.getCode());
            ps.setString(2, usersBeans.getFirst_name());
            ps.setString(3, usersBeans.getLast_name());
            ps.setString(4, usersBeans.getDepartment());
            ps.setString(5, usersBeans.getTypeUser());
            ps.setString(6, usersBeans.getUsername());
            ps.setString(7, usersBeans.getPassword());
            affectedRows = ps.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

    }

}
