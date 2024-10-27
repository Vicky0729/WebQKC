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
	private int scrapped;
	
	
	
	
	public Product(int pd_idx, String pd_name, String pd_content, BigDecimal price, int scrapped) {
		super();
		this.pd_idx = pd_idx;
		this.pd_name = pd_name;
		this.pd_content = pd_content;
		this.price = price;
		this.scrapped = scrapped;
	}




	public Product(int pd_idx, String pd_img) {
		super();
		this.pd_idx = pd_idx;
		this.pd_img = pd_img;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
