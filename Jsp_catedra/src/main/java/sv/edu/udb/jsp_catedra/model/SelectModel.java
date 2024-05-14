package sv.edu.udb.jsp_catedra.model;

import sv.edu.udb.jsp_catedra.beans.DepaBeans;
import sv.edu.udb.jsp_catedra.beans.TypeUser;
import sv.edu.udb.jsp_catedra.beans.UsersBeans;
import sv.edu.udb.jsp_catedra.utils.DBConenection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SelectModel {
    Connection conn;

    public ArrayList<DepaBeans> showDepa() {
        ArrayList<DepaBeans> lista = new ArrayList<>();
        try {
            conn = DBConenection.getConnection();
            String SQLSELECT = "SELECT * FROM departamentos";
            PreparedStatement ps = conn.prepareStatement(SQLSELECT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DepaBeans dp = new DepaBeans();
                dp.setCode(rs.getString(2));
                dp.setNombre(rs.getString(3));
                lista.add(dp);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("Error al renderizar las opciones");

        }
        return lista;
    }

    public ArrayList<TypeUser> showTypeUser() {
        ArrayList<TypeUser> list = new ArrayList<>();
        try {
            conn = DBConenection.getConnection();
            String SQLSELECT = "SELECT * FROM tipo_usuario";
            PreparedStatement ps = conn.prepareStatement(SQLSELECT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TypeUser tu = new TypeUser();
                tu.setCode(rs.getString(2));
                tu.setPosition(rs.getString(3));
                list.add(tu);
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
            System.out.println("Error al renderizar las opciones");

        }
        return list;
    }

    public  ArrayList<UsersBeans> showProgramers() {
        ArrayList<UsersBeans> userList = new ArrayList<>();

        try {
            conn = DBConenection.getConnection();
            String SQLSELECT = "SELECT * FROM usuario WHERE tipoUsuario LIKE '%pro%'";
            PreparedStatement ps = conn.prepareStatement(SQLSELECT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UsersBeans u = new UsersBeans();
                u.setCode(rs.getString(2));
                u.setUsername(rs.getString(7));
                userList.add(u);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    public  ArrayList<UsersBeans> showTester() {
        ArrayList<UsersBeans> userList = new ArrayList<>();

        try {
            conn = DBConenection.getConnection();
            String SQLSELECTEST = "SELECT * FROM usuario WHERE tipoUsuario LIKE '%tes%'";
            PreparedStatement ps = conn.prepareStatement(SQLSELECTEST);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UsersBeans u = new UsersBeans();
                u.setCode(rs.getString(2));
                u.setUsername(rs.getString(7));
                userList.add(u);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

}
