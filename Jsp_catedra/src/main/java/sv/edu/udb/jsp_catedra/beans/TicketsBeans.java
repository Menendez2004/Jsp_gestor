package sv.edu.udb.jsp_catedra.beans;

import java.util.Date;

public class TicketsBeans {
    int idTicke;
    String code;
    String tittle;
    String description;
    String aguement;
    String depaCode;
    String statusCode;
    String pdfFile;
    String programerCode;
    String testerCode;
    String Date;
    String finalDate;

    public TicketsBeans(int idTicke, String code, String tittle, String description, String aguement, String depaCode,
                        String statusCode, String pdfFile, String programerCode, String testerCode, String date, String finalDate) {
        this.idTicke = idTicke;
        this.code = code;
        this.tittle = tittle;
        this.description = description;
        this.aguement = aguement;
        this.depaCode = depaCode;
        this.statusCode = statusCode;
        this.pdfFile = pdfFile;
        this.programerCode = programerCode;
        this.testerCode = testerCode;
        this.Date = date;
        this.finalDate = finalDate;
    }

    public int getIdTicke() {
        return idTicke;
    }

    public void setIdTicke(int idTicke) {
        this.idTicke = idTicke;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAguement() {
        return aguement;
    }

    public void setAguement(String aguement) {
        this.aguement = aguement;
    }

    public String getDepaCode() {
        return depaCode;
    }

    public void setDepaCode(String depaCode) {
        this.depaCode = depaCode;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getPdfFile() {
        return pdfFile;
    }

    public void setPdfFile(String pdfFile) {
        this.pdfFile = pdfFile;
    }

    public String getProgramerCode() {
        return programerCode;
    }

    public void setProgramerCode(String programerCode) {
        this.programerCode = programerCode;
    }

    public String getTesterCode() {
        return testerCode;
    }

    public void setTesterCode(String testerCode) {
        this.testerCode = testerCode;
    }

    public String getFinalDate() {
        return finalDate;
    }

    public void setFinalDate(String finalDate) {
        this.finalDate = finalDate;
    }

    public String getDate() {
        return Date;
    }

}


