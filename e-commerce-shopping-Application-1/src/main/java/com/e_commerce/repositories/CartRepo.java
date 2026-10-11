package com.e_commerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.e_commerce.models.Cart;
import java.util.List;


@Repository
public interface CartRepo extends JpaRepository<Cart, Integer>{

	public List<Cart> findByUid(Integer uid);
}
