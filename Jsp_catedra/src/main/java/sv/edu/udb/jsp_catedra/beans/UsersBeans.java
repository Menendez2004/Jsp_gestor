package sv.edu.udb.jsp_catedra.beans;

public class UsersBeans {
    public int id_user;
    public String code;
    public String first_name;
    public String last_name;
    public String department;


    public String typeUser;
    public String Username;
    public String Password;

    public UsersBeans() {}

    public UsersBeans(int id_user, String code, String first_name, String last_name, String department, String typeUser,
                      String Username, String Password){
        this.id_user = id_user;
        this.code = code;
        this.first_name = first_name;
        this.last_name = last_name;
        this.department = department;
        this.typeUser = typeUser;
        this.Username = Username;
        this.Password = Password;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getTypeUser() {
        return typeUser;
    }

    public void setTypeUser(String typeUser) {
        this.typeUser = typeUser;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }
}


