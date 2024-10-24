package com.qkcfamily.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {

	private int pd_idx;
	private String pd_name;
	private String pd_content;
	private BigDecimal price;
	private String pd_img;
	private String category;
	private String category_d;
	private Timestamp created_at;
	private String item;
	private String spec_carton;
	private String carton_size;
	private String load_qty;
	private String shelf_life;
	
	
	public Product(String pd_name, String pd_content, BigDecimal price, String pd_img, String category_d,
			String spec_carton, String carton_size, String load_qty, String shelf_life) {
		super();
		this.pd_name = pd_name;
		this.pd_content = pd_content;
		this.price = price;
		this.pd_img = pd_img;
		this.category_d = category_d;
		this.spec_carton = spec_carton;
		this.carton_size = carton_size;
		this.load_qty = load_qty;
		this.shelf_life = shelf_life;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
