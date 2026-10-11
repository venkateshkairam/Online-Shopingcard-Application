package com.e_commerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.e_commerce.models.Orders;


@Repository
public interface OrderRepo extends JpaRepository<Orders, Integer> {

	Orders findByRazorpayOrderId(String razorpayId);

}
