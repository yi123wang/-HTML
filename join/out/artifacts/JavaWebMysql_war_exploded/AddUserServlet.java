import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "AddUserServlet", value = "/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String bookName = request.getParameter("bookName");
        double price = Double.parseDouble(request.getParameter("price"));

        Connection connection = null;
        PreparedStatement insertUserStatement = null;
        PreparedStatement insertBookStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "123456");

            // 关闭自动提交
            connection.setAutoCommit(false);

            // 插入 user 表
            String insertUserSql = "INSERT INTO user (username, password) VALUES (?, ?)";
            insertUserStatement = connection.prepareStatement(insertUserSql);
            insertUserStatement.setString(1, username);
            insertUserStatement.setString(2, password);
            insertUserStatement.executeUpdate();

            // 插入 book 表
            String insertBookSql = "INSERT INTO book (username, bookName, price) VALUES (?, ?, ?)";
            insertBookStatement = connection.prepareStatement(insertBookSql);
            insertBookStatement.setString(1, username);
            insertBookStatement.setString(2, bookName);
            insertBookStatement.setDouble(3, price);
            insertBookStatement.executeUpdate();

            // 提交事务
            connection.commit();

        } catch (Exception e) {
            if (connection != null) {
                try {
                    // 回滚事务
                    connection.rollback();
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            try {
                if (insertUserStatement != null) insertUserStatement.close();
                if (insertBookStatement != null) insertBookStatement.close();
                if (connection != null) connection.close();
            } catch (Exception closeEx) {
                closeEx.printStackTrace();
            }
        }

        response.sendRedirect("mysql.jsp");
    }
}
