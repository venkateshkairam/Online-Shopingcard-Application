package com.e_commerce.services;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.e_commerce.models.Admin;
import com.e_commerce.models.Catagory;
import com.e_commerce.models.Product;
import com.e_commerce.repositories.AdminRepo;
import com.e_commerce.repositories.CatagoryRepo;
import com.e_commerce.repositories.ProductRepo;

@Service
public class AdminService {
	
	@Autowired
	private AdminRepo arepo;
	
	@Autowired
	private CatagoryRepo crepo;
	@Autowired
	private ProductRepo prepo;
	
	public Admin getAdmin(Admin a) {
		
		List<Admin> admin=arepo.findByNameAndPassword(a.getName(), a.getPassword());
		
		if(admin.size()!=0)
			return admin.get(0);
		return null;
	}
	
	public void saveCatagory(String name,MultipartFile f,Integer aid) throws IOException {
		
		Catagory catagory=new Catagory();
		
		catagory.setName(name);
		catagory.setAdminId(aid);
		catagory.setType(f.getContentType());
		catagory.setImage(f.getByte  s());
		
		crepo.save(catagory);
	}
	
	public List<Catagory> getCatagories() {
		List<Catagory> catagories = crepo.findAll();
		
		return catagories;
	}
	
	public Catagory image(Integer id) {
		Optional<Catagory> cata = crepo.findById(id);
		
		if(cata.isPresent()) {
			return cata.get();
		}
		
		return new Catagory();
	}
	
	public Product saveProduct(Product p, MultipartFile file) throws IOException {
		p.setImage(file.getBytes());
		
		Product pro=prepo.save(p);
		return pro;
	}
	
	public List<Product> getProducts(){
		
		return prepo.findAll();
	}
	public Product pImage(Integer id) {
		Optional<Product> cata = prepo.findById(id);
		
		if(cata.isPresent()) {
			return cata.get();
		}
		
		return new Product();
	}

	public void pdelete(Integer id) {
		
		prepo.deleteById(id);
		
	}

	public Optional<Product> getproduct(Integer id) {
		
		return prepo.findById(id);
		
	}
	
	public Optional<Product> updateProduct(Product p){
		
		if(p.getImage()==null) {
			p.setImage(getproduct(p.getId()).get().getImage());
		}
		Product pro = prepo.save(p);
		
		System.out.println(pro);
		return Optional.of(pro);
	}
}
