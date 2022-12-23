package com.clubsportif.app.services;

import com.clubsportif.app.entities.User;
import com.clubsportif.app.exceptions.UserNotFoundException;
import com.clubsportif.app.repositories.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    //CREATE
    public User addUser(User user){
        return userRepository.save(user);
    }

    //UPDATE
    public User updateUser(User user){
        return userRepository.save(user);
    }

    //DELETE
    public void deleteUser(Integer id){
        userRepository.deleteById(id);
    }

    //READ
    public List<User> findAllUsers(){
        return userRepository.findAll();
    }

    public User findUserById(Integer id){
        return userRepository.findById(id).orElseThrow(() -> new UserNotFoundException("User avec l'id " + id + " n'existe pas"));
    }
}
