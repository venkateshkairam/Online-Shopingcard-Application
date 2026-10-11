package com.e_commerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.e_commerce.models.Admin;
import java.util.List;


@Repository
public interface AdminRepo extends JpaRepository<Admin, Integer> {

	public List<Admin> findByNameAndPassword(String name, String password);

}
