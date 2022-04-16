package DAO;

import Models.Message;
import Models.Post;

import java.util.List;

public interface Messages {

    List<Message> all();

    Long insert (Message message);

    List<Message> findBySender(String sent_user);

    List<Message> findByReceiver(String received_user);

}
