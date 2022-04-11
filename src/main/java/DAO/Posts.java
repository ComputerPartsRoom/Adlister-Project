package DAO;

import Models.Post;

import java.util.List;

public interface Posts {

    List<Post> all();

    Long insert(Post post);

//    Post findByTitle(String search);

    List<Post> all2(String search);
}