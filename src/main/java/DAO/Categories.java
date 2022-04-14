package DAO;

import Models.Category;
import Models.Post;

import java.util.List;


public interface Categories {

    List<Category> all();

    Category findById(Long id);
}
