package sv.edu.udb.jsp_catedra.model;

import sv.edu.udb.jsp_catedra.beans.DepaBeans;
import sv.edu.udb.jsp_catedra.beans.UsersBeans;
import sv.edu.udb.jsp_catedra.utils.DBConenection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginModel {

    public boolean verifyUser(UsersBeans usersBeans) {
        Connection conn;
        PreparedStatement ps;
        ResultSet rs;
        try {
            conn = DBConenection.getConnection();
            String SQLVERIFYUSER = "SELECT COUNT(*) AS count FROM usuario WHERE usuario = ? AND contrasenia = ?";
            ps = conn.prepareStatement(SQLVERIFYUSER);
            ps.setString(1, usersBeans.getUsername());
            ps.setString(2, usersBeans.getPassword());
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }


    public String obtenerCodigoUsuario(String username) {
        Connection conn;
        PreparedStatement ps;
        ResultSet rs;

        try {
            conn = DBConenection.getConnection();
            String query = "SELECT codigo FROM usuario WHERE usuario = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("codigo");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public String obtenerURLRedireccion(String codigoUsuario) {
        String codigo = codigoUsuario.substring(0, 3);
        switch (codigo) {
            case "adm":
                return "admin.jsp";
            case "pro":
                return "add_depa.jsp";
            default:
                return "error404.jsp";
        }
    }


}

