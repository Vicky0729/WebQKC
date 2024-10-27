package com.qkcfamily.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Import {

	private int ip_idx;
	private String ip_name;
	private String ip_country;
	private String ip_img;
	private String import_date;
	private String created_at;
	
	
	
}
