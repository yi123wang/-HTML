import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 连接数据库验证用户名和密码
        boolean isValid = validateUser(username, password);

        if (isValid) {
            // 如果用户名和密码正确，重定向到 mysql.jsp
            response.sendRedirect("mysql.jsp");
        } else {
            // 如果用户名和密码不正确，设置错误消息并重定向回登录页面
            request.setAttribute("errorMsg", "用户名或密码错误");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    private boolean validateUser(String username, String password) {
        // 在这里实现验证用户名和密码的逻辑
        // 这是一个简单的示例，你需要根据自己的数据库结构和验证逻辑进行调整
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb", "root", "123456");

            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            boolean isValid = resultSet.next();

            resultSet.close();
            statement.close();
            connection.close();

            return isValid;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
