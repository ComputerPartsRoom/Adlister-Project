package DAO;

import Models.Post;

import java.util.List;

public interface Posts {

    List<Post> all();

    Long insert(Post post);

    List<Post> findByTitle(String search);

    List<Post> findByUser(Integer id);

    List<Post> sortByCategory(String sort);

    void update(Post post);


    void delete(Post post);
}