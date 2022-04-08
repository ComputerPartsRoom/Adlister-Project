package DAO;

public class Config {

    public Config (){}

    public String getUrl() {
        return "jdbc:mysql://localhost:3306/ComputerPartsRoom_db?allowPublicKeyRetrieval=true&useSSL=false";
    }
    public String getUser() {
        return "root";
    }
    public String getPassword() {
        return "codeup";
    }

}
