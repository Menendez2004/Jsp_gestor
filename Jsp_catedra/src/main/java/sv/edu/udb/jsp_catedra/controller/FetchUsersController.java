package sv.edu.udb.jsp_catedra.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import sv.edu.udb.jsp_catedra.beans.UsersBeans;
import sv.edu.udb.jsp_catedra.utils.DBConenection;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "fetch-user", value = "/fetch-user")
public class FetchUsersController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UsersBeans> usuario = new ArrayList<>();

        try {
            String selectSql = "SELECT * FROM usuario";
            ResultSet subjResultSet = DBConenection.getConnection().createStatement().executeQuery(selectSql);
            while (subjResultSet.next()) {
                int id = subjResultSet.getInt("id");
                String code = subjResultSet.getString("codigo");
                String nombre = subjResultSet.getString("nombre");
                String apellido = subjResultSet.getString("apellido");
                String departamento = subjResultSet.getString("departamento");
                String tipoUser = subjResultSet.getString("tipoUsuario");
                String username = subjResultSet.getString("usuario");
                UsersBeans user = new UsersBeans(id,code,nombre,apellido,departamento,tipoUser,username, "");
                usuario.add(user);
            }
            request.setAttribute("usuarios", usuario);
            request.getRequestDispatcher("users_views.jsp").forward(request, response);
        } catch (SQLException e) {

            throw new ServletException("Error al obtener los casos de la base de datos", e);

        }catch (IOException e){
            System.out.println("No hay nada");
        }
    }
}
