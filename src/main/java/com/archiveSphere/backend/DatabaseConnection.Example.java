package com.archiveSphere.backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/archivesphere_db";
    private static final String USER = "root";
    private static final String PASSWORD = "password";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void main(String[] args) {
        try (Connection connection = getConnection()) {
            if (connection != null) {
                System.out.println("Conexión exitosa a la base de datos archivesphere_db");
            } else {
                System.out.println("Fallo en la conexión a la base de datos archivesphere_db");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}