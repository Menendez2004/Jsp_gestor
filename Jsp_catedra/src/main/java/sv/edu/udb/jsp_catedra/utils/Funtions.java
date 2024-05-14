package sv.edu.udb.jsp_catedra.utils;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Random;

public class Funtions {


    public String generateUserCode(String firstName, String lastName) {
        // Obtener las dos primeras letras del nombre y apellido
        String code = "";
        if (firstName.length() >= 2 && lastName.length() >= 2) {
            code = firstName.substring(0, 2).toUpperCase() + lastName.substring(0, 2).toUpperCase();

            // Generar dos números aleatorios
            Random random = new Random();
            int randomNumber1 = random.nextInt(10);
            int randomNumber2 = random.nextInt(10);

            // Agregar los números aleatorios al código
            code += randomNumber1 + "" + randomNumber2;
        } else {
            // Si el nombre o el apellido son demasiado cortos, asignar "ERROR" como código
            code = "ERROR";
        }
        return code;
    }


    public String generateDepaCode(String name) {
        // Obtener las cuatro primeras letras del primer nombre
        String code = "";
        if (name.length() >= 4) {
            code = name.substring(0, 4);

            // Agregar "404" como números al código
            code += "404";
        } else {
            // Si el primer nombre es demasiado corto, asignar "ERROR" como código
            code = "ERROR:";
        }
        return code;
    }




}
