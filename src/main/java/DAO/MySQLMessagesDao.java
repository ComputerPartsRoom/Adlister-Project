package DAO;

import Models.Message;

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
            throw new RuntimeException("Error retrieving all messages.", e);
        }
    }


    private Message extractMessage(ResultSet rs) throws SQLException {
        return new Message(
                rs.getInt("id"),
                rs.getString("sent_user"),
                rs.getString("received_user"),
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
//
//    public Long firstMessage(Message message){
//        try {
//            String insertQuery = "INSERT INTO messages(id, sent_user, received_user, content) VALUES (?, ?, ?, ?);";
//            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
//            stmt.setInt(1, (int) (Math.random() * 1000) + 900);
//            stmt.setString(2, message.getSent_user());
//            stmt.setString(3, message.getReceived_user());
//            stmt.setString(4, message.getContent());
//            stmt.executeUpdate();
//            ResultSet rs = stmt.getGeneratedKeys();
//            rs.next();
//            return rs.getLong(1);
//        } catch (SQLException e) {
//            throw new RuntimeException("Error creating a new message.", e);
//        }
//    }

    public Long insert(Message message) {
        try {
            String insertQuery = "INSERT INTO messages(id, sent_user, received_user, content) VALUES (?, ?, ?, ?);";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, message.getId());
            stmt.setString(2, message.getSent_user());
            stmt.setString(3, message.getReceived_user());
            stmt.setString(4, message.getContent());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new message.", e);
        }
    }

    public List<Message> findById(Integer id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM messages WHERE messages.id LIKE ?;");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            return createMessagesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving messages by sender.", e);
        }
    }

    public List<Message> findBySender(String sent_user) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM messages WHERE messages.sent_user LIKE ?;");
            stmt.setString(1, sent_user);
            ResultSet rs = stmt.executeQuery();
            return createMessagesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving messages by sender.", e);
        }
    }

    public List<Message> findByReceiver(String received_user) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM messages WHERE messages.received_user LIKE ?;");
            stmt.setString(1, received_user);
            ResultSet rs = stmt.executeQuery();
            return createMessagesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving messages by receiver.", e);
        }
    }

    public void delete(Message message) {
        try {
            String updateQuery = "DELETE FROM messages WHERE id = ?;";
            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, message.getId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();

            System.out.println("Message with id " + message.getId() + " has been deleted");

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


//    public void update(Message message) {
//        try {
//            String updateQuery = "UPDATE messages SET sent_user=?, received_user=? WHERE sent_user=?;";
//
//            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
//            stmt.setString(1, message.getSent_user());
//            stmt.setString(2, message.getReceived_user());
//            stmt.setString(3, message.getSent_user());
//
//            stmt.executeUpdate();
//            ResultSet rs = stmt.getGeneratedKeys();
//            rs.next();
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new RuntimeException(e);
//        }
//
//
//    }
}