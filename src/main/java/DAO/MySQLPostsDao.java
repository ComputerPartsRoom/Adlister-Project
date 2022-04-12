package DAO;

import Models.Post;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLPostsDao implements Posts {
    private Connection connection = null;

    public MySQLPostsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }


    @Override
    public List<Post> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM posts");
            ResultSet rs = stmt.executeQuery();
            return createPostsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all posts.", e);
        }
    }

    public List<Post> findByTitle(String search) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM posts WHERE title LIKE ?");
            stmt.setString(1, "%" + search + "%");
            ResultSet rs = stmt.executeQuery();
            return createPostsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all posts.", e);
        }
    }

    public List<Post> sortByCategory(String sort) {
        System.out.println("sort = " + sort);
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM posts WHERE cat_id = ?");
            stmt.setString(1, sort);
            ResultSet rs = stmt.executeQuery();
            return createPostsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all posts.", e);
        }
    }


    @Override
    public Long insert(Post post) {
        try {
            String insertQuery = "INSERT INTO posts(user_id, title, content, price, cat_id, img) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, post.getUser_id());
            stmt.setString(2, post.getTitle());
            stmt.setString(3, post.getContent());
            stmt.setLong(4, post.getPrice());
            stmt.setLong(5, post.getCat_id());
            stmt.setString(6, post.getImg());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new post.", e);
        }
    }

    private Post extractPost(ResultSet rs) throws SQLException {
        return new Post(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("content"),
                rs.getInt("price"),
                rs.getLong("cat_id"),
                rs.getString("img")
        );
    }

    private List<Post> createPostsFromResults(ResultSet rs) throws SQLException {
        List<Post> posts = new ArrayList<>();
        while (rs.next()) {
            posts.add(extractPost(rs));
        }
        return posts;
    }


    public void update(Post post) {
        try {
            String updateQuery = "UPDATE posts SET title=?, content=?, price=?, img=?, cat_id=? WHERE id=?";

            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
            System.out.println("post.getId() = " + post.getId());
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setLong(3, post.getPrice());
            stmt.setString(4, post.getImg());
            stmt.setLong(5, post.getCat_id());
            stmt.setLong(6, post.getId());

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

            System.out.println("Post with id " + post.getId() + " was updated in DB with following details: " + "Title" + post.getTitle() + ",  Content" + post.getContent() + ",  Price" + post.getPrice() + ",  img" + post.getImg() + ",  Cat_id" + post.getCat_id());

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
