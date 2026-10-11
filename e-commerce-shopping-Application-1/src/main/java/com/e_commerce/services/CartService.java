package com.e_commerce.services;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.e_commerce.models.Cart;
import com.e_commerce.models.Orders;
import com.e_commerce.models.User;
import com.e_commerce.repositories.CartRepo;
import com.e_commerce.repositories.OrderRepo;
import com.e_commerce.repositories.UserRepo;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import jakarta.annotation.PostConstruct;

@Service
public class CartService {
	
	@Autowired
	private CartRepo repo;
	
	@Autowired
	private UserRepo urepo;
	
	@Autowired
	private OrderRepo Orepo;
	@Autowired
	private UtilServices utilser;
	
	
	@Value("${razorpay.key.id}")
	private String razorpayId;
	@Value("${razorpay.key.secret}")
	private String razorpaySecret;
	
private RazorpayClient razorpayCLient;
	
	@PostConstruct
	public void init() throws RazorpayException {
		System.out.println("creation started");
		
		System.out.println(razorpayCLient);
	}
	
	public void addCart(Cart cart) {
		Cart c = repo.save(cart);
		
		System.out.println(c);
	}
	
	public Cart findCart(Integer uid) {
		
		List<Cart> carts = repo.findByUid(uid);
		//System.out.println(carts);
		Cart cart = carts.size()!=0?carts.get(carts.size()-1).getStatus().equalsIgnoreCase("pending")?carts.get(carts.size()-1):new Cart():new Cart();
		cart.setStatus("pending");
		cart.setUid(uid);
		return cart;
	}
	
	public Cart getCart(Integer id) {
		List<Cart> carts = repo.findByUid(id);
		
		Cart cart=carts.size()!=0?carts.get(carts.size()-1).getStatus().equalsIgnoreCase("pending")?carts.get(carts.size()-1):null:null;
		
		return cart;
	}
	public void buyCart(Integer id, Double price) {
		 Cart cart = repo.findById(id).get();
		 User user = urepo.findById(cart.getUid()).get();
		 utilser.sendMail(user.getEmail(),cart.getProducts(),price);
		 cart.setStatus("completed");
		 repo.save(cart);
	}
	
	public Orders createOrder(Orders order) throws RazorpayException {
		Order razorpayOrder = null;
		this.razorpayCLient = new RazorpayClient(razorpayId, razorpaySecret);
        JSONObject options = new JSONObject();
        options.put("amount", order.getAmount() * 100); // amount in paise
        options.put("currency", "INR");
        options.put("receipt", order.getEmail());
        try {
        razorpayOrder = razorpayCLient.orders.create(options);
        }catch(Exception e){
        	e.printStackTrace();
        }
        
        if(razorpayOrder != null) {
        order.setRazorpayOrderId(razorpayOrder.get("id"));
        order.setOrderStatus(razorpayOrder.get("status"));
        }
        
        return Orepo.save(order);
    }

	public Orders updateStatus(Map<String, String> map) {
    	String razorpayId = map.get("razorpay_order_id");
    	Orders order = Orepo.findByRazorpayOrderId(razorpayId);
    	order.setOrderStatus("PAYMENT DONE");
    	Orders orders = Orepo.save(order);
    	return orders;
    }
}
