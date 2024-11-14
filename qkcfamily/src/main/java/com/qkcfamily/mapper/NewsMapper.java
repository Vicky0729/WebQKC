package com.qkcfamily.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.qkcfamily.entity.News;

@Mapper
public interface NewsMapper {


   @Select("select * from tb_news")
   public List<News> getAllNews();
   
   @Select("select * from tb_news ORDER BY created_at DESC LIMIT #{offset}, #{pageSize}")
   public List<News> getAllNewsP(@Param("offset") int offset, @Param("pageSize") int pageSize);
   
   @Select("SELECT * FROM tb_news WHERE news_idx = #{news_idx}")
   public News getNewsById(int news_idx);
   
   @Update("UPDATE tb_news SET news_title = #{news_title}, news_content = #{news_content}, news_img = #{news_img} WHERE news_idx = #{news_idx}")
   public void updateNews(News news);
   
   @Insert("INSERT INTO tb_news (news_title, news_content, news_img, created_at) " +
            "VALUES (#{news_title}, #{news_content}, #{news_img}, NOW())")
   public void insertNews(News news);

    @Delete("DELETE FROM tb_news WHERE news_idx = #{news_idx}")
    public void deleteNewsById(int newsIdx);

}
