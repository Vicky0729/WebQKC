package com.qkcfamily.mapper;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.qkcfamily.entity.Product;

@Mapper
public interface ProductMapper {

	public ArrayList<Product> productSearch(String search_str);

	@Select("select * from tb_product where category = '버섯류'")
	public ArrayList<Product> allMushroom();

	@Select("select * from tb_product where category = '식료품'")
	public ArrayList<Product> allFoodStuffs();

	@Select("select * from tb_product where category = '제과류'")
	public ArrayList<Product> allSnack();

	@Select("select * from tb_product where category = '수입품'")
	public ArrayList<Product> allImport();

	@Select("select * from tb_product where category = '기타'")
	public ArrayList<Product> allEtc();

	@Select("select * from tb_product where pd_idx = #{pd_idx}")
	public Product EditProduct(int pd_idx);
	
	
	
	public void updateProduct(Product product);
	
	public void InsertProduct(Product product);
	
	   @Select("select * from tb_product")
	   public ArrayList<Product> getSnackList();

	   @Select("select * from tb_product where pd_idx = #{pd_idx}")
	   public Product getDetail(int pd_idx);
	   
	   // 페이징을 위한 제과 제품 리스트 가져오기
	    @Select("SELECT * FROM tb_product ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	    List<Product> getPagedSnackList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	    
	    // 전체 제과 제품 개수 가져오기 (페이징 계산을 위해 필요)
	    @Select("SELECT COUNT(*) FROM tb_product")
	    int getTotalSnackCount();
	
}
