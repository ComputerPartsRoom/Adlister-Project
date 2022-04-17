package DAO;

import Models.Post;
import Models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
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
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }


    @Override
    public User findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password")
        );
    }
//    JOIN a on c.username = a.sent_user AND c.username = a.received_user
//JOIN b ON c.username = b.username


    public void update(User user) {
        try {
            String updateQuery = "UPDATE messages a, posts b, users c  JOIN a on c.username = a.sent_user AND c.username = a.received_user JOIN b ON c.username = b.username SET b.username=?, c.username=?, a.sent_user=?, a.received_user=? WHERE c.id =?;";

            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getUsername());
            stmt.setLong(5, user.getId());

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

    @Override
    public void delete(User user) {
        try {
            String updateQuery = "DELETE FROM posts WHERE user_id=?;";
            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, user.getId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();


            String updateQuery4 = "DELETE FROM messages WHERE sent_user=?;";
            PreparedStatement stmt4 = connection.prepareStatement(updateQuery4, Statement.RETURN_GENERATED_KEYS);
            stmt4.setString(1, user.getUsername());
            stmt4.executeUpdate();
            ResultSet rs4 = stmt.getGeneratedKeys();
            rs4.next();


            String updateQuery2 = "DELETE FROM users WHERE id=?;";
            PreparedStatement stmt2 = connection.prepareStatement(updateQuery2, Statement.RETURN_GENERATED_KEYS);
            stmt2.setLong(1, user.getId());
            stmt2.executeUpdate();
            ResultSet rs2 = stmt2.getGeneratedKeys();
            rs2.next();




        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }
}
