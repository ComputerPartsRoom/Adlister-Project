package Models;

public class Message {
    private Integer id;
    private String sent_user;
    private String received_user;
    private String content;
    private Integer user_id;
    private Integer received_id;

    public Message(){}

    public Message(Integer id){
        this.id = id;
    }

//    public Message(String sent_user){
//        this.sent_user = sent_user;
//    }

    public Message (Integer id, String sent_user, String received_user, String content, Integer user_id, Integer received_id){
        this.id = id;
        this.sent_user = sent_user;
        this.received_user = received_user;
        this.content = content;
        this.user_id = user_id;
        this.received_id = received_id;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getReceived_id() {
        return received_id;
    }

    public void setReceived_id(Integer received_id) {
        this.received_id = received_id;
    }
}
