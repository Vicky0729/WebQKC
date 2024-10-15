package com.qkcfamily.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.qkcfamily.entity.Popup;

@Mapper
public interface PopupMapper {

	   @Select("SELECT * FROM tb_popup WHERE NOW() BETWEEN start_date AND end_date")
	   public Popup getPopup();
	   
	
	
	
	
}
