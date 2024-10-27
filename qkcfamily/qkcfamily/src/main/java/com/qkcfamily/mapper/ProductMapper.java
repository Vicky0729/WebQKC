package com.qkcfamily.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.qkcfamily.entity.Product;

@Mapper
public interface ProductMapper {

	public ArrayList<Product> productSearch(String searchProduct);
	
	@Select("SELECT COUNT(*) FROM tb_product WHERE pd_name LIKE CONCAT('%', #{searchProduct}, '%')")
	public int SearchCount(String searchProduct);

	// 버섯류 제품 리스트 가져오기
	// 버섯류 제품 개수 가져오기

	// 식료품 제품 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='식료품' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getGroceriesList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// 식료품 제품 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='식료품'")
	public int getGroceriesCount();

	
	// "상온" 식료품 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='식료품' and category_d='상온' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getAmbientList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// "상온" 식료품 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='식료품' and category_d='상온'")
	public int getAmbientCount();

	
	// "냉동" 식료품 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='식료품' and category_d='냉동' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getFrozenList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// "냉동" 식료품 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='식료품' and category_d='냉동'")
	public int getFrozenCount();

	
	// "냉장" 식료품 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='식료품' and category_d='냉장' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getFreshList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// "냉장" 식료품 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='식료품' and category_d='냉장'")
	public int getFreshCount();

	
	// 제과 제품 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='제과' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getSnackList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// 제과 제품 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='제과'")
	public int getTotalSnackCount();

	
	// "쿠키류" 제과 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='제과' and category_d='쿠키류' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getCookiesList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// "쿠키류" 제과 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='제과' and category_d='쿠키류'")
	public int getCookiesCount();
	

	// "스낵류" 제과 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='제과' and category_d='스낵류' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getSnacksList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// "스낵류" 제과 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='제과' and category_d='스낵류'")
	public int getSnacksCount();

	
	// "비스켓류" 제과 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='제과' and category_d='비스켓류' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getBiscuitsList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// "비스켓류" 제과 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='제과' and category_d='비스켓류'")
	public int getBiscuitsCount();

	// 기타 제품 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='기타' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getEtcList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// 기타 제품 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='기타'")
	public int getEtcCount();

	// 수입 제품 리스트 가져오기
	@Select("SELECT * FROM tb_product where category='수입품' ORDER BY pd_idx DESC LIMIT #{offset}, #{pageSize}")
	public List<Product> getImportList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	// 수입 제품 개수 가져오기
	@Select("SELECT COUNT(*) FROM tb_product where category='수입품'")
	public int getImportCount();

	public ArrayList<Product> allMushroom(String admin_id);

	
	public ArrayList<Product> allFoodStuffs(String admin_id);

	
	public ArrayList<Product> allSnack(String admin_id);


	public ArrayList<Product> allImport(String admin_id);

	
	public ArrayList<Product> allEtc(String admin_id);

	@Select("select * from tb_product where pd_idx = #{pd_idx}")
	public Product SelectById(int pd_idx);
	
	public void updateProduct(Product product);

	public void InsertProduct(Product product);

	@Delete("delete from tb_product where pd_idx=#{pd_idx}")
	public void deleteProduct(int pd_idx);

	@Select("select * from tb_product where pd_idx = #{pd_idx}")
	public Product getDetail(int pd_idx);
	
	
	@Delete("delete from tb_scrap where pd_idx=#{pd_idx} and admin_id=#{admin_id}")
	public void deleteScrap(@Param("pd_idx") int pd_idx, @Param("admin_id") String admin_id);
	
	@Insert("INSERT INTO tb_scrap (pd_idx, admin_id) VALUES (#{pd_idx}, #{admin_id})")
	public void addScrap(@Param("pd_idx") int pd_idx, @Param("admin_id") String admin_id);
	
	public ArrayList<Product> bestProduct();
	
	
}
