package DAO;

import Models.Post;

import java.util.List;

public interface Posts {

    List<Post> all();

    Long insert(Post post);

    List<Post> findByTitle(String search);

    List<Post> sortByCategory(String sort);
}