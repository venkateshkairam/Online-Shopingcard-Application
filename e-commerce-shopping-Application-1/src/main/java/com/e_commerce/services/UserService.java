package com.e_commerce.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_commerce.models.Catagory;
import com.e_commerce.models.Product;
import com.e_commerce.models.User;
import com.e_commerce.repositories.CatagoryRepo;
import com.e_commerce.repositories.ProductRepo;
import com.e_commerce.repositories.UserRepo;

@Service
public class UserService {
	
	@Autowired
	private UserRepo repo;
	@Autowired
	private CatagoryRepo crepo;
	
	@Autowired
	private ProductRepo prepo;
	
	public User save(User u) {
		
		User res=repo.save(u);
		
		return res;
	}
	
	public User getUser(String email, String pass) {
		
		Optional<User> user = repo.findByEmailAndPassword(email, pass);
			if(user.isPresent())
				return user.get();
			
		return null;
	}

	public List<Product> getCatagoryProducts(Integer id) {
		Catagory cat = crepo.findById(id).get();
		
		List<Product> products = prepo.findByCategory(cat.getName());
	
		return products;
	}
}
