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

    @Override
    public Long insert(Post post) {
        try {
            String insertQuery = "INSERT INTO posts(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, post.getUser_id());
            stmt.setString(2, post.getTitle());
            stmt.setString(3, post.getContent());
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
                rs.getString("content")
        );
    }

    private List<Post> createPostsFromResults(ResultSet rs) throws SQLException {
        List<Post> posts = new ArrayList<>();
        while (rs.next()) {
            posts.add(extractPost(rs));
        }
        return posts;
    }
}