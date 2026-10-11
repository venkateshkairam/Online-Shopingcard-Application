package com.e_commerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.e_commerce.models.Product;
import java.util.List;


@Repository
public interface ProductRepo extends JpaRepository<Product, Integer> {

	List<Product> findByCategory(String category);
}
