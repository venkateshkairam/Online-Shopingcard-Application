package com.e_commerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.e_commerce.models.User;
import java.util.List;
import java.util.Optional;


@Repository
public interface UserRepo extends JpaRepository<User, Integer> {

	public Optional<User> findByEmailAndPassword(String email, String password);
}
