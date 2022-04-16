package DAO;

import Models.Message;
import Models.Post;

import java.util.List;

public interface Messages {

    List<Message> all();

    Long insert (Message message);

    List<Message> findBySender(Integer sent_id);

    List<Message> findByReceiver(Integer received_id);

}
