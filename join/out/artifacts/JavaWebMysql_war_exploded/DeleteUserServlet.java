import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteUserServlet", value = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "123456");

            // 删除 user 表中的用户记录
            String deleteUserSql = "DELETE FROM user WHERE username = ?";
            PreparedStatement deleteUserStatement = connection.prepareStatement(deleteUserSql);
            deleteUserStatement.setString(1, username);
            deleteUserStatement.executeUpdate();

            // 删除 book 表中的用户相关记录
            String deleteBookSql = "DELETE FROM book WHERE username = ?";
            PreparedStatement deleteBookStatement = connection.prepareStatement(deleteBookSql);
            deleteBookStatement.setString(1, username);
            deleteBookStatement.executeUpdate();

            // 关闭 PreparedStatement
            deleteUserStatement.close();
            deleteBookStatement.close();

            // 关闭数据库连接
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 重定向到 mysql.jsp
        response.sendRedirect("mysql.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
