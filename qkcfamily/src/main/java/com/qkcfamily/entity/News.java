package com.qkcfamily.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
@Getter
@Setter
public class News {

	
	private int news_idx;
	private String news_title;
	private String news_content;
	private String news_img;
	private String created_at;
}
