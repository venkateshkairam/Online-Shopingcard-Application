package com.e_commerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.e_commerce.models.Catagory;
import java.util.List;
import java.util.Optional;


@Repository
public interface CatagoryRepo extends JpaRepository<Catagory, Integer> {
	
}
