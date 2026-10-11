package com.e_commerce.controllers;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

import org.hibernate.query.sqm.tree.SqmDeleteOrUpdateStatement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.HttpHeaders;

import com.e_commerce.models.Admin;
import com.e_commerce.models.Catagory;
import com.e_commerce.models.Product;
import com.e_commerce.services.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService ser;

	@RequestMapping("/")
	public String home(HttpSession session,Model m) {
		
		if(session.getAttribute("adminId")!=null) {
			return "admin/home";
		}
		return "admin/login";
		
	
	}
	
	@RequestMapping("/login")
	public String login(@ModelAttribute Admin admin,HttpSession session,Model m) { 
		
		
		Admin a=ser.getAdmin(admin);
		
		if(a!=null) {
			session.setAttribute("adminId", a.getId());
			return "redirect:/admin/";
		}
		m.addAttribute("error", "please Check Your Credentials");
		return "admin/login";

	}
	@RequestMapping("/logout")
	public String logOut(HttpSession session) {
		session.setAttribute("adminId", null);
		
		return "redirect:/admin/";
	}
	
	@RequestMapping("/addproduct")
	public String addProduct(Model m) { 
		
		List<Catagory> catagories = ser.getCatagories();
		List<String> catNames = catagories.stream().map((cat)-> cat.getName()).toList();
		m.addAttribute("catnames",catNames);
		return "admin/addproduct";
	}
	
	@RequestMapping("/saveproduct")
	public String saveProduct(@ModelAttribute Product p,@RequestPart("") MultipartFile file,Model m) {
		List<Catagory> catagories = ser.getCatagories();
		List<String> catNames = catagories.stream().map((cat)-> cat.getName()).toList();
		m.addAttribute("catnames",catNames);
		try {
			Product pro = ser.saveProduct(p,file);
			System.out.println(pro);
			
			m.addAttribute("pmessage", "Product Added Successfully");
		} catch (IOException e) {

			m.addAttribute("pmessage", "Product Adding is Failed");
		}
		return "admin/addproduct";
	}
	@RequestMapping("/addcatagory")
	public String addCatagory() {
		
		return "admin/addcatagory";
	}
	
	@RequestMapping("/saveCatagory")
	public String saveCatagory(@RequestParam("name") String name, @RequestPart("file") MultipartFile file,HttpSession session,Model m) {
		
		try {
		ser.saveCatagory(name, file,(Integer)session.getAttribute("adminId"));
		m.addAttribute("message", "SuccessFully Catagory Added");
		}catch(IOException e) {
			m.addAttribute("message", "failed by io exception");
		}catch(NumberFormatException e) {
			m.addAttribute("message", "failed by numbermissmatch");
		}
		return "admin/addcatagory";
	}
	
	@RequestMapping("/viewcatagory")
	public String viewCatagory(Model m) {
		
		List<Catagory> catagories = ser.getCatagories();
		m.addAttribute("catagories",catagories);
		return "admin/viewcatagory";
	}
	
	@RequestMapping("/viewproduct")
	public String viewProduct(Model m) {
		List<Product> products = ser.getProducts();
		m.addAttribute("products", products);
		return "admin/viewproducts";
	}
	@RequestMapping("image/{id}")
	public ResponseEntity<byte[]> getImage(@PathVariable("id") Integer id){
		
		Catagory c=ser.image(id);
		
		ResponseEntity<byte[]> res = ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE,c.getType()).body(c.getImage());
	
		return res;
	}
	
	@RequestMapping("pimage/{id}")
	public ResponseEntity<byte[]> getPimage(@PathVariable("id") Integer id){
		
		Product c=ser.pImage(id);
		
		ResponseEntity<byte[]> res = ResponseEntity.ok().body(c.getImage());
	
		return res;
	}
	
	@RequestMapping("pdelete/{id}")
	public String pdelete(@PathVariable Integer id){
		
		ser.pdelete(id);
		
		return "redirect:/admin/viewproduct";
	}
	
	@RequestMapping("pupdate/{id}")
	public String updateProduct(@PathVariable Integer id,Model m) {
		List<Catagory> catagories = ser.getCatagories();
		List<String> catNames = catagories.stream().map((cat)-> cat.getName()).toList();
		Optional<Product> p = ser.getproduct(id);
		m.addAttribute("catnames",catNames);
		m.addAttribute("product", p.get());
		return "admin/updateproduct";
	}
	
	@RequestMapping("/updateproduct")
	public String productUpdate(@ModelAttribute Product pro,@RequestPart("file") MultipartFile file) throws IOException {
		
		if(file.isEmpty()) {
			Optional<Product> p = ser.updateProduct(pro);
			System.out.println(p.get());
		}
		else {
			Product pr = ser.saveProduct(pro, file);
			System.out.println(pr);
		}
		
		return "redirect:/admin/viewproduct";
	}
}
