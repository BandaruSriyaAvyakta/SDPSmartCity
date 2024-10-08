package com.smartcity.service;

import com.smartcity.dao.UserDAO;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public boolean validateUser(String username, String password) {
        return userDAO.isValidUser(username, password);
    }
}
