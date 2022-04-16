package DAO;

import Models.Message;

import Models.Post;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLMessagesDao implements Messages {
    private Connection connection = null;

    public MySQLMessagesDao(Config config) {
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

    public List<Message> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM messages");
            ResultSet rs = stmt.executeQuery();
            return createMessagesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all posts.", e);
        }
    }

    private Message extractMessage(ResultSet rs) throws SQLException {
        return new Message(
                rs.getInt("sent_id"),
                rs.getInt("received_id"),
                rs.getString("content")
        );
    }

    private List<Message> createMessagesFromResults(ResultSet rs) throws SQLException {
        List<Message> messages = new ArrayList<>();
        while (rs.next()) {
            messages.add(extractMessage(rs));
        }
        return messages;
    }


    public Long insert(Message message) {
        try {
            String insertQuery = "INSERT INTO messages(sent_id, received_id, content) VALUES (?, ?, ?);";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, message.getSent_id());
            stmt.setInt(2, message.getReceived_id());
            stmt.setString(3, message.getContent());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new message.", e);
        }
    }


    public List<Message> findBySender(Integer sent_id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM messages WHERE messages.sent_id LIKE ?;");
            stmt.setInt(1, sent_id);
            ResultSet rs = stmt.executeQuery();
            return createMessagesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving messages by sender.", e);
        }
    }

    public List<Message> findByReceiver(Integer received_id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM messages WHERE messages.received_id LIKE ?;");
            stmt.setInt(1, received_id);
            ResultSet rs = stmt.executeQuery();
            return createMessagesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving messages by receiver.", e);
        }
    }


}