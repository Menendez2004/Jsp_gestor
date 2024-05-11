package sv.edu.udb.jsp_catedra.beans;

public class DepaBeans {
    public int idDepa;
    public String code;
    public String nombre;

    public DepaBeans(int idDepa, String code, String nombre) {
        this.idDepa = idDepa;
        this.code = code;
        this.nombre = nombre;
    }

    public DepaBeans(){}

    public int getIdDepa() { return idDepa; }
    public void setIdDepa(int idDepa) { this.idDepa = idDepa; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
}
