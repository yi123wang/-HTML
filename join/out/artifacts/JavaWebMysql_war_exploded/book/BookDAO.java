package book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/javaweb";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    public List<Book> getBooks() {
        List<Book> books = new ArrayList<>();
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("数据库连接成功!");
            statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT id, username, bookName, price FROM book"); // 将查询的字段名 account 改为 username
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username"); // 将字段名 account 改为 username
                String bookName = resultSet.getString("bookName");
                double price = resultSet.getDouble("price");
                Book book = new Book(id, username, bookName, price); // 将字段名 account 改为 username
                books.add(book);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return books;
    }
}
