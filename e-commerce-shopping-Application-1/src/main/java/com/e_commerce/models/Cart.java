package com.e_commerce.models;

import java.util.List;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Transient;

@Entity
public class Cart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private Integer uid;
	
	@ElementCollection
	private List<CartProduct> products;
	
	@Transient
	private Double totalPrice;
	
	private String status;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
	
	public List<CartProduct> getProducts() {
		return products;
	}

	public void setProducts(List<CartProduct> products) {
		this.products = products;
	}

	
	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", uid=" + uid + ", products=" + products + ", totalPrice=" + totalPrice + ", status="
				+ status + "]";
	}
	
	
}
