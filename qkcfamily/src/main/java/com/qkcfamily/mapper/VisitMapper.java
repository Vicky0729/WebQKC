package com.qkcfamily.mapper;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.qkcfamily.entity.Visit;

@Mapper
public interface VisitMapper {

	 // 오늘의 방문자 수 조회   
    @Select("SELECT * FROM tb_visit WHERE visit_date = #{visit_date}")
    Visit selectVisitByDate(@Param("visit_date") java.sql.Date visit_date);


    // 새로운 날짜로 방문자 수 추가
    @Insert("INSERT INTO tb_visit (visit_date, visit_count) VALUES (#{visit_date}, #{visit_count})")
    void insertVisit(Visit visit);

    // 방문자 수 업데이트
    @Update("UPDATE tb_visit SET visit_count = #{visit_count} WHERE visit_date = #{visit_date}")
    void updateVisitCount(@Param("visit_date") Date visit_date, @Param("visit_count") int visit_count);
    
	
    @Select("SELECT visit_date AS date, visit_count AS count " +
            "FROM tb_visit " +
            "WHERE visit_date BETWEEN #{startDate} AND #{endDate} " +
            "ORDER BY visit_date")
    List<Map<String, Object>> getVisitorsByDateRange(@Param("startDate") String startDate, @Param("endDate") String endDate);
    
    @Select("SELECT SUM(visit_count) FROM tb_visit")
    Integer getTotalVisitCount();

}
