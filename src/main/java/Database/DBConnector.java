package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConnector{
    public static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/studentmanagement";
    public static final String USER_NAME = "root";
    public static final String PASSWORD = "your_mysql_password";

public static Connection getConnection() {
    Connection con = null;
    try {
        Class.forName(DRIVER_NAME);
        System.out.println("Driver loaded successfully.");
        con = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
        System.out.println("Connection established: " + con);
    } catch (ClassNotFoundException e) {
        System.err.println("JDBC Driver not found: " + e.getMessage());
        e.printStackTrace();
    } catch (SQLException e) {
        System.err.println("SQL Exception: " + e.getMessage());
        e.printStackTrace();
    }
    return con;
}
public static void closeConnection(Connection con) {
    try {
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

}