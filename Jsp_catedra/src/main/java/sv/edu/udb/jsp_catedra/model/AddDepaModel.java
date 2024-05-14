package sv.edu.udb.jsp_catedra.model;

import sv.edu.udb.jsp_catedra.beans.DepaBeans;
import sv.edu.udb.jsp_catedra.utils.DBConenection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddDepaModel {

    public void addDepa(DepaBeans depaBeans){
        Connection conn;
        PreparedStatement ps;
        int RowsAffected=0;

        try {
            conn= DBConenection.getConnection();
            String SQLINSERT = "INSERT INTO departamentos( codigo, nombre) VALUE (?,?)";
            ps = conn.prepareStatement(SQLINSERT);
            ps.setString(1, depaBeans.getCode());
            ps.setString(2, depaBeans.getNombre());
            RowsAffected=ps.executeUpdate();
            System.out.println(RowsAffected);
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());

        }

    }
}
