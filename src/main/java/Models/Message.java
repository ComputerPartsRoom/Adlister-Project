package Models;

public class Message {
    private Integer id;
    private String sent_user;
    private String received_user;
    private String content;

    public Message(){}

    public Message(Integer id){
        this.id = id;
    }

    public Message (Integer id, String sent_user, String received_user, String content){
        this.id = id;
        this.sent_user = sent_user;
        this.received_user = received_user;
        this.content = content;
    }





    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSent_user() {
        return sent_user;
    }

    public void setSent_user(String sent_user) {
        this.sent_user = sent_user;
    }

    public String getReceived_user() {
        return received_user;
    }

    public void setReceived_user(String received_user) {
        this.received_user = received_user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
