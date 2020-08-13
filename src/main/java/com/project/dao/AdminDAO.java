package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;
import com.project.dto.DataListDTO;
import com.project.dto.ReplyDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	public static final String namepasce="com.project.mybatis.myMapper";

	public List<AdminNoticeDTO> adminList(AdminNoticeDTO dto) {
		return sqlSession.selectList(namepasce+".select_adminList",dto);
	}
	
	public List<AdminNoticeDTO> listAll(AdminNoticeDTO dto) {
		return sqlSession.selectList(namepasce+".selectAll_Notice",dto);
	}
	public AdminNoticeDTO view(AdminNoticeDTO dto) {
		return sqlSession.selectOne(namepasce+".view_Notice",dto);
	}
	
	public CommnuityDTO viewBoard(CommnuityDTO dto) {
		return sqlSession.selectOne(namepasce+".view_Board",dto);
	}

	public void count(AdminNoticeDTO dto) {
		sqlSession.update(namepasce+".count_Notice",dto);

	}
	public void save_write(AdminNoticeDTO dto) {
		if(dto.getWriter().equals("admin")) {
			String title="<b style='color:black;'>[공지]  "+dto.getTitle()+"</b>";
			dto.setTitle(title);
			sqlSession.insert(namepasce+".insert_Notice",dto);
		}else {
			sqlSession.insert(namepasce+".insert_Notice",dto);
		}

	}
	public void delete(int num) {
		sqlSession.delete(namepasce+".delete_Notice",num);
	}
	
	public void deleteQA(int num) {
		List<ReplyDTO> arr =sqlSession.selectList(namepasce+".select_reply",num);
		  for(int i=0;i<arr.size();i++) {
			  ReplyDTO reply = new ReplyDTO();
			  reply.setBno(arr.get(i).getBno());
			  reply.setRno(arr.get(i).getRno());
			  sqlSession.delete(namepasce+".delete_reply", reply);
		  }
		sqlSession.delete(namepasce+ ".delete_QA",num);
	}
	
	public void save_Modify(AdminNoticeDTO dto) {
		sqlSession.update(namepasce+".update_Notice",dto);
	}
	
	public void save_writeBoard(CommnuityDTO dto) {
	      sqlSession.insert(namepasce+".Adinsert_Commnuity",dto);
	      
	   }
	
	public void AddProduct(DataListDTO dto) {
		sqlSession.insert(namepasce+".AddProduct",dto);
	}
	
	public int DelProduct(String product) {
		return sqlSession.delete(namepasce+ ".DelProduct",product);
	}

	 public String notice_select_count() {
	      return sqlSession.selectOne(namepasce + ".notice_select_count");
	   }
	 
}
