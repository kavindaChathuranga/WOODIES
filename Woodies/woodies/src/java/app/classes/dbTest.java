

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbTest {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/woodies"; // Change to your DB name
        String user = "root"; // Change if you have a different MySQL username
        String password = ""; // Leave empty if there's no password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
            Connection conn = DriverManager.getConnection(url, user, password);

            if (conn != null) {
                System.out.println("✅ Database connection successful!");
            } else {
                System.out.println("❌ Database connection failed!");
            }

            conn.close(); // Close connection
        } catch (ClassNotFoundException e) {
            System.out.println("❌ MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Connection error!");
            e.printStackTrace();
        }
    }
}
