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
            stmt = connection.prepareStatement("SELECT posts.id, posts.user_id, posts.title, posts.content, posts.price, posts.img, posts.cat_id, categories.name, posts.username\n" +
                    "FROM posts\n" +
                    "         INNER JOIN categories on posts.cat_id = categories.id;");
            ResultSet rs = stmt.executeQuery();
            return createPostsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all posts.", e);
        }
    }

    public List<Post> findByTitle(String search) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM posts WHERE title LIKE ?;");
            stmt.setString(1, "%" + search + "%");
            ResultSet rs = stmt.executeQuery();
            return createPostsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all posts.", e);
        }
    }

    public List<Post> findByUser(Integer user_id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM posts WHERE posts.user_id LIKE ?;");
            stmt.setInt(1, user_id);
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
            stmt = connection.prepareStatement("SELECT * FROM posts WHERE cat_id = ?;");
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
            String insertQuery = "INSERT INTO posts(user_id, title, content, price, img, cat_id, username) VALUES (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, post.getUser_id());
            stmt.setString(2, post.getTitle());
            stmt.setString(3, post.getContent());
            stmt.setLong(4, post.getPrice());
            stmt.setString(5, post.getImg());
            stmt.setLong(6, post.getCat_id());
            stmt.setString(7, post.getUsername());

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
                rs.getString("img"),
                rs.getString("name"),
                rs.getString("username")
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
            String updateQuery = "UPDATE posts SET title=?, content=?, price=?, img=?, cat_id=?, username=? WHERE id=?;";

            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setLong(3, post.getPrice());
            stmt.setString(4, post.getImg());
            stmt.setLong(5, post.getCat_id());
            stmt.setString(6, post.getUsername());
            stmt.setLong(7, post.getId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

            System.out.println("Post with id " + post.getId() + " was updated in DB with following details: " + "Title" + post.getTitle() + ",  Content" + post.getContent() + ",  Price" + post.getPrice() + ",  img" + post.getImg() + ",  Cat_id" + post.getCat_id());

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }


    }
    public void delete(Post post) {
        try {
            String updateQuery = "DELETE FROM posts WHERE id = ?;";

            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, post.getId());

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

            System.out.println("Post with id " + post.getId() + "has been deleted");

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
