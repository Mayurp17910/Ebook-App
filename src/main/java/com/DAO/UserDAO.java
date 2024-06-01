package com.DAO;

import java.util.List;

import com.entity.BookDtls;
import com.entity.User;

public interface UserDAO {
public boolean userRegister(User us);
public User login(String email,String password);
public boolean checkPassword(int id,String ps);
public boolean updateProfile(User us);
public boolean checkUser(String email,String phno);
public List<User> getAllUsers() ;
public boolean UserDelete(int id);
public User getUserById(int id) ;

public boolean updateEditUser(User u);

}