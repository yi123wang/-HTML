package book;

public class Book {
    private int id;
    private String username; // 将 account 改为 username
    private String bookName;
    private double price;

    // 默认构造函数
    public Book() {
    }

    // 带参数的构造函数
    public Book(int id, String username, String bookName, double price) {
        this.id = id;
        this.username = username;
        this.bookName = bookName;
        this.price = price;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() { // 将 getAccount 改为 getUsername
        return username;
    }

    public void setUsername(String username) { // 将 setAccount 改为 setUsername
        this.username = username;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
