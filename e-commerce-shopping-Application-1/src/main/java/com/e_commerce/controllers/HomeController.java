package com.e_commerce.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.e_commerce.models.Cart;
import com.e_commerce.models.CartProduct;
import com.e_commerce.models.Catagory;
import com.e_commerce.models.Orders;
import com.e_commerce.models.Product;
import com.e_commerce.models.User;
import com.e_commerce.services.AdminService;
import com.e_commerce.services.CartService;
import com.e_commerce.services.UserService;
import com.e_commerce.services.UtilServices;
import com.razorpay.RazorpayException;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.AddressException;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private AdminService aser;
	
	@Autowired
	private UtilServices userv;
	@Autowired
	private CartService cser;
	
	@RequestMapping("/")
	public String home(Model m,HttpSession session, @ModelAttribute("name") String s) throws AddressException, MessagingException {
		System.out.println(s);
		
		if(session.getAttribute("userId")!=null) {
			Cart cart = cser.getCart((Integer) session.getAttribute("userId"));
			if(cart!=null)
				m.addAttribute("cartSize",cart.getProducts().size());
			else
				m.addAttribute("cartSize",0);
		}
		List<Catagory> catagories=aser.getCatagories().stream().toList();
		List<Product> products =(List<Product>) aser.getProducts().stream().sorted((p1, p2) -> p2.getId().compareTo(p1.getId())).limit(16).toList();
		m.addAttribute("catagories", catagories);
		m.addAttribute("products", products);
		return "home";
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("/register")
	public String register() {
		
		return "register";
	}
	
	@RequestMapping("/user-register")
	public String userRegister(@ModelAttribute User user,Model m) {
		
		user=service.save(user);
		if(user!=null) {
			return "redirect:/login";
		}
		else {
			m.addAttribute("message","Registration fail Try Again");
		return "register";
		}
	}
	
	@RequestMapping("/signIn")
	public String userSignIn(@RequestParam("email") String email,@RequestParam("password") String pass,HttpSession session,Model m,RedirectAttributes attributes) {
		
		User user = service.getUser(email,pass);
		if(user!=null) {
		session.setAttribute("userId", user.getId());
		session.setAttribute("userName", user.getName());
		attributes.addFlashAttribute("name","teja");
		return "redirect:/";
		}
		else {
			m.addAttribute("message", "Plese Check Your Credentials");
		}
		return "login";
	}
	
	@RequestMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/product/{id}")
	public String viewProduct(@PathVariable("id") Integer id,Model m)
	{
		Product product = aser.getproduct(id).get();
		m.addAttribute("product", product);
		return "product";
	}
	
	@RequestMapping("/products")
	public String getAllproducts(Model m) {
		List<Product> products = aser.getProducts();
		m.addAttribute("products", products);
		return "products";
	}
	
	@RequestMapping("/catagorypage/{id}")
	public String catagoryWiseProduct(@PathVariable("id") Integer id,Model m){
		List<Product> products = service.getCatagoryProducts(id);
		
		m.addAttribute("products", products);
		
		if(products.size()!=0)
		m.addAttribute("catagoryName", products.get(0).getCategory());
		
		return "catagoryProducts";
	}
	
	@RequestMapping("/cartadd/{id}")
	public String cartAdd(@PathVariable Integer id,Model m) {
		
		Product pro = aser.getproduct(id).get();
		m.addAttribute("product", pro);
		return "cartadd";
	}
	@RequestMapping("/cart")
	public String productAdd(@ModelAttribute CartProduct product,HttpSession session) {
		//System.out.println((Integer) session.getAttribute("userId"));
		Cart cart = cser.findCart((Integer) session.getAttribute("userId"));
		List<CartProduct> pro = cart.getProducts();
		System.out.println(pro);
		if(pro!=null)
			pro.add(product);
		else {
			pro=new ArrayList<CartProduct>();
			pro.add(product);
		}
		cart.setProducts(pro);
		cser.addCart(cart);
		return "redirect:/";
	}
	@RequestMapping("/showcart/{id}")
	public String showCart(@PathVariable Integer id,Model m){
		Cart cart = cser.getCart(id);
		if(cart!=null) {
			m.addAttribute("products", cart.getProducts());
			m.addAttribute("cartId", cart.getId());
		}
		else {
			
		}
		return "showcart";
	}
	
	@RequestMapping("/buycart/{id}/{price}")
	public String buyCart(@PathVariable Integer id,@PathVariable Double price) {
		cser.buyCart(id,price);
		return "redirect:/";
	}
	
	@RequestMapping("/payment/{id}/{price}")
	public String paymnet(@PathVariable Integer id,@PathVariable Double price,Model m) {
		//cser.buyCart(id,price);
		m.addAttribute("id",id);
		m.addAttribute("price",price);
		
		return "payment";
	}
		
	
	
	
	@RequestMapping(value = "/createOrder", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Orders> createOrder(@ModelAttribute Orders orders) throws RazorpayException{
		Orders razorpayOrder = cser.createOrder(orders);
		return new ResponseEntity<>(razorpayOrder,HttpStatus.CREATED);
	}
	
	@RequestMapping("/paymentCallback")
	public String paymentCallback(@RequestParam Map<String, String> response) {
		System.out.println("called");
		 	cser.updateStatus(response);
		 	return "success";
		
	}
}
