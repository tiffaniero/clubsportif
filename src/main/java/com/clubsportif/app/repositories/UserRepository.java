package com.clubsportif.app.repositories;

import com.clubsportif.app.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
}
