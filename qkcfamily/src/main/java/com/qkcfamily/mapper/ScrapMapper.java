package com.qkcfamily.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ScrapMapper {

	

	
	 // 스크랩 여부 확인
    @Select("SELECT COUNT(*) FROM tb_scrap WHERE admin_id = #{adminId} AND pd_idx = #{productId}")
    int isScrapped(@Param("adminId") String adminId, @Param("productId") int productId);

    // 스크랩 추가
    @Insert("INSERT INTO tb_scrap (admin_id, pd_idx) VALUES (#{adminId}, #{productId})")
    void addScrap(@Param("adminId") String adminId, @Param("productId") int productId);

    // 스크랩 삭제
    @Delete("DELETE FROM tb_scrap WHERE admin_id = #{adminId} AND pd_idx = #{productId}")
    void removeScrap(@Param("adminId") String adminId, @Param("productId") int productId);
	
	
	
}
