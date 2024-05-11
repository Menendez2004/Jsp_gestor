package sv.edu.udb.jsp_catedra.beans;

public class TypeUser {
    public int id_type;
    public String code;
    public String position ;

    public TypeUser(int id_type, String code, String position) {
        this.id_type = id_type;
        this.code = code;
        this.position = position;
    }
    public TypeUser() {}

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

}
