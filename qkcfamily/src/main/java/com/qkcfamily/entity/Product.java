package com.qkcfamily.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class Product {

	private int pd_idx;
	private String pd_name;
	private String pd_content;
	private BigDecimal price;
	private String pd_img;
	private String category;
	private Timestamp created_at;
	private String item;
	private String spec_carton;
	private String carton_size;
	private String load_qty;
	private String shelf_life;
	
	
	
	
	public Product(int pd_idx, String pd_name, String pd_content, BigDecimal price, String pd_img, String category,
			Timestamp created_at, String item, String spec_carton, String carton_size, String load_qty,
			String shelf_life) {
		super();
		this.pd_idx = pd_idx;
		this.pd_name = pd_name;
		this.pd_content = pd_content;
		this.price = price;
		this.pd_img = pd_img;
		this.category = category;
		this.created_at = created_at;
		this.item = item;
		this.spec_carton = spec_carton;
		this.carton_size = carton_size;
		this.load_qty = load_qty;
		this.shelf_life = shelf_life;
	}
	
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getSpec_carton() {
		return spec_carton;
	}
	public void setSpec_carton(String spec_carton) {
		this.spec_carton = spec_carton;
	}
	public String getCarton_size() {
		return carton_size;
	}
	public void setCarton_size(String carton_size) {
		this.carton_size = carton_size;
	}
	public String getLoad_qty() {
		return load_qty;
	}
	public void setLoad_qty(String load_qty) {
		this.load_qty = load_qty;
	}
	public String getShelf_life() {
		return shelf_life;
	}
	public void setShelf_life(String shelf_life) {
		this.shelf_life = shelf_life;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
