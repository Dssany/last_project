package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.bannerDTO;

@Repository
public class bannerDAO {
   
   @Autowired private SqlSession sqlSession;
   
   public static final String namepasce="com.project.mybatis.myMapper";
   
   public List<bannerDTO> selectAll() {
      return sqlSession.selectList(namepasce+".bannerAll");
   }
   
}