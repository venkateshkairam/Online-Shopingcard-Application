package com.e_commerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.e_commerce.models.CartProduct;
import com.e_commerce.repositories.ProductRepo;

@Service
public class UtilServices {
	
	@Autowired
	private JavaMailSender mail;
	
	@Autowired
	private ProductRepo repo;
	
	public void  sendMail(String to, List<CartProduct> list, Double price) {
			
		String s="your cart with following products";
		
		for(CartProduct c:list) {
			s+=" "+repo.findById(c.getPid()).get().getName()+" ";
		}
		s+="with total price"+price+"is success full";
			SimpleMailMessage message=new SimpleMailMessage();
			message.setFrom("malampallitejababu@gmail.com");
			message.setTo(to);
			message.setSubject("Cart Successfull");
			message.setText(s);
			mail.send(message);
		}
	
	public void hello() {
		System.out.println("hello world");
	}
}
