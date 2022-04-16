package Models;

public class Message {

    private Integer sent_id;
    private Integer received_id;
    private String content;

    public Message(){}

    public Message (Integer sent_id, Integer received_id, String content){
        this.sent_id = sent_id;
        this.received_id = received_id;
        this.content = content;
    }


    public Integer getSent_id() {
        return sent_id;
    }

    public void setSent_id(Integer sent_id) {
        this.sent_id = sent_id;
    }

    public Integer getReceived_id() {
        return received_id;
    }

    public void setReceived_id(Integer received_id) {
        this.received_id = received_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
