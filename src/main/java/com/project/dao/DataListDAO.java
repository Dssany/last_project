package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.CookieDTO;
import com.project.dto.DataListDTO;

@Repository
public class DataListDAO {
	@Autowired private SqlSession sqlSession;
	public static final String namepasce="com.project.mybatis.myMapper";

	public List<DataListDTO> selectAll2() {
		return sqlSession.selectList(namepasce+".dataselectAll_List2");
	}


	public List<DataListDTO> selectAll() {
		return sqlSession.selectList(namepasce+".dataselectAll_List");
	}
	public List<DataListDTO> select(DataListDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namepasce+".dataselect_List",dto);
	}

	public void updateQuantity(DataListDTO dto) {
		sqlSession.update(namepasce + ".updateQuantity",dto);
	}

	public List<DataListDTO> selectPick(DataListDTO dto){
			return sqlSession.selectList(namepasce + ".selectPick",dto);

	}
	public List<DataListDTO> select_number_ran(DataListDTO dto) {
		return sqlSession.selectList(namepasce + ".select_number_ran",dto);
	}
	public List<DataListDTO> select_number(DataListDTO dto) {
		return sqlSession.selectList(namepasce + ".select_number",dto);
	}
	public List<DataListDTO> select_name_Pick(DataListDTO dto) {
		return sqlSession.selectList(namepasce + ".select_name_Pick",dto);
	}
	public String select_count(DataListDTO dto) {
		return sqlSession.selectOne(namepasce + ".select_count",dto);
	}

	public List<DataListDTO>  select_cookie_two(CookieDTO dto) {
		return sqlSession.selectList(namepasce + ".select_cookie_two",dto);
	}
	public List<DataListDTO>  select_cookie_one(CookieDTO dto) {
		return sqlSession.selectList(namepasce + ".select_cookie_one",dto);
	}
	public List<DataListDTO>  select_cookie_three(CookieDTO dto) {
		return sqlSession.selectList(namepasce + ".select_cookie_three",dto);
	}
	public List<DataListDTO> select_cookie_four(CookieDTO dto) {
		return sqlSession.selectList(namepasce + ".select_cookie_four",dto);
	}
	public String select_price(String product) {
		return sqlSession.selectOne(namepasce + ".select_price", product);
	}
	public List<DataListDTO> select_all_number(DataListDTO dto) {
		return sqlSession.selectList(namepasce + ".select_all_number",dto);
	}

	public String selectall_count(DataListDTO dto) {
		return sqlSession.selectOne(namepasce + ".selectall_count",dto);
	}
}