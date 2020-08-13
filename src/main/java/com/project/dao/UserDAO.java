package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.CommnuityDTO;
import com.project.dto.UserDTO;

@Repository
public class UserDAO {
	@Autowired private SqlSession sqlSession;
	public static final String namepasce="com.project.mybatis.myMapper";
	public List<UserDTO> selectAll(UserDTO dto) {
		return sqlSession.selectList(namepasce+".selectAll_User",dto);
	}
	public UserDTO select(String num) {
		return sqlSession.selectOne(namepasce+".select_User",num);
	}
	public int insert(UserDTO dto) {

		return sqlSession.insert(namepasce+".insert_User",dto);
	}
	public int delete(String num) {
		return sqlSession.delete(namepasce+".delete_User", num);
	}
	public int update(UserDTO dto) {
		return sqlSession.update(namepasce+".update_User", dto);
	}
	public List<UserDTO> selectid(UserDTO dto){
		return sqlSession.selectList(namepasce+".select_UserId", dto);
	}
	public List<UserDTO> selectpw(UserDTO dto){
		return sqlSession.selectList(namepasce+".select_UserPw", dto);
	}
	public int pw_update(UserDTO dto) {
	      return sqlSession.update(namepasce+".update_User_pw", dto);
	   }
	public String user_count() {
		return sqlSession.selectOne(namepasce+".select_user_count");
	}
	
	public List<UserDTO> listSearch_id(UserDTO dto) {
		return sqlSession.selectList(namepasce + ".listSearch_id", dto);
	}

	public List<UserDTO> listSearch_name(UserDTO dto) {
		return sqlSession.selectList(namepasce + ".listSearch_name", dto);
	}

	public List<UserDTO> listSearch_phon(UserDTO dto) {
		return sqlSession.selectList(namepasce + ".listSearch_phon", dto);
	}
	public String listSearch_id_count(UserDTO dto) {
		return sqlSession.selectOne(namepasce + ".listSearch_id_count",dto);
	}
	public String listSearch_name_count(UserDTO dto) {
		return sqlSession.selectOne(namepasce + ".listSearch_name_count",dto);
	}
	public String listSearch_phon_count(UserDTO dto) {
		return sqlSession.selectOne(namepasce + ".listSearch_phon_count",dto);
	}
}
