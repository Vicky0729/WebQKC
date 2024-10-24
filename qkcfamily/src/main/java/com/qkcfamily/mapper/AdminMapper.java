package com.qkcfamily.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.qkcfamily.entity.Admin;
import com.qkcfamily.entity.Popup;

@Mapper
public interface AdminMapper {

	
	   @Select("SELECT * FROM tb_admin WHERE admin_id = #{admin_id} AND admin_pw = #{admin_pw}")
	   public Admin loginAdmin(@Param("admin_id") String admin_id, @Param("admin_pw") String admin_pw);


	   @Select("select * from tb_admin")
	   public ArrayList<Admin> getAdminList();

	   @Insert("insert into tb_admin values(#{admin_id},#{admin_name},#{admin_pw},#{admin_email},default)")
	   public void addAdmin(Admin admin);

	   @Select("select case when count(*)>0 then 1 else 0 end result from tb_admin where admin_id=#{admin_id} ") 
	   public int checkId(String admin_id);
	   
	   @Select("SELECT * FROM tb_admin WHERE admin_id = #{admin_id}")
	    public Admin getAdminById(String admin_id);

	   @Update("UPDATE tb_admin SET admin_pw=#{admin_pw}, admin_name=#{admin_name}, admin_email=#{admin_email} where admin_id = #{admin_id}")
	   public void updateAdmin(Admin admin);
	   
	   
	   @Delete("DELETE FROM tb_admin WHERE admin_id = #{admin_id}")
	   public int deleteAdminById(String admin_id);
	   
	   @Select("select * from tb_popup")
	   public ArrayList<Popup> getPopupList();
	
	   @Insert("insert into tb_popup (pop_title, start_date, end_date, pop_img, created_at) values (#{pop_title},#{start_date},#{end_date},#{pop_img},default)")
	   public void addPopup(Popup popup);
	   
	   @Update("UPDATE tb_popup SET pop_title=#{pop_title}, start_date=#{start_date}, end_date=#{end_date}, pop_img=#{pop_img} where pop_idx = #{pop_idx}")
	   public void updatePopup(Popup popup);
	   
	   @Delete("DELETE FROM tb_popup WHERE pop_idx = #{popup_idx}")
	   public int deletePopupById(String pop_idx);
	//추상 메소드 추가
	
}
