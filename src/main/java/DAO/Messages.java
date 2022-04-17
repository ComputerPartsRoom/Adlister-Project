package DAO;

import Models.Message;
import Models.Post;

import java.util.List;

public interface Messages {

    List<Message> all();

    List<Message> findById(Integer id);

    Long insert (Message message);

    void delete (Message message);

    List<Message> findBySender(String sent_user);

    List<Message> findByReceiver(String received_user);

}
