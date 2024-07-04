import user.User;
import user.UserDAO;
import book.Book;
import book.BookDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/getData")
public class DataServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();
    private BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        List<User> users = userDAO.getUsers();
        List<Book> books = bookDAO.getBooks();

        // 显示用户信息和对应的书籍信息
        out.println("<style>");
        out.println("select {");
        out.println("    background-color: white;"); // 设置背景色为白色
        out.println("    opacity: 1;"); // 设置不透明
        out.println("}");
        out.println("</style>");

        out.println("<table border='1'>");
        out.println("<tr><th>用户名</th><th>书名</th><th>单价</th></tr>");

        for (User user : users) {
            boolean userHasBooks = false; // 标记该用户是否有书籍

            for (Book book : books) {
                if (user.getName().equals(book.getUsername())) {
                    userHasBooks = true;
                    out.println("<tr><td>" + user.getName() + "</td><td>" + book.getBookName() + "</td><td>" + book.getPrice() + "</td></tr>");
                }
            }

            // 如果该用户没有书籍，则显示空行
            if (!userHasBooks) {
                out.println("<tr><td>" + user.getName() + "</td><td colspan='2'>暂无书籍</td></tr>");
            }
        }
        out.println("</table>");

        out.close();
    }
}

