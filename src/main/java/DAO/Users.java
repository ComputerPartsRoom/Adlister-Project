package DAO;

import Models.User;

public interface Users {
    User findByUsername(String username);

    Long insert(User user);
}

