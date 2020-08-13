package com.project.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.payDAO;
import com.project.dto.PayDTO;

@Service
public class cartService {
	@Autowired
	private payDAO dao;
	public void cart_insert(HttpServletRequest request,@RequestParam String userimg_in,@RequestParam String imgname,@RequestParam String imgmoney
			,@RequestParam String type) {

		HttpSession session = request.getSession();
		PayDTO dto = new PayDTO();
		dto.setId(session.getAttribute("id").toString());
		dto.setPrice(imgmoney);
		if(type.equals("earring")) {
			dto.setImg(userimg_in);
		}else {
			dto.setImg("img/"+userimg_in);
		}
		dto.setProduct(imgname);
		dto.setStatus("대기");
		dto.setType(type);
		dao.insert(dto);
	}
	public List<PayDTO> cart_select(Model model,String id) {
		List<PayDTO> arr = dao.select(id);
		return arr;
	}
	public void cart_delete(HttpServletRequest request,String img, String rno) {
		PayDTO dto = new PayDTO();
		HttpSession session = request.getSession();
		dto.setId(session.getAttribute("id").toString());
		dto.setRno(rno);
		dao.delete(dto);
		// 삭제할 파일 경로
		File file = new File("D:\\jang\\0717\\last_project\\src\\main\\webapp\\resources\\userimg\\"+img.split("/")[1]); 
		if( file.exists() ){ 
			if(file.delete()) { 
				System.out.println("파일삭제 성공"); 
			}else{ 
				System.out.println("파일삭제 실패"); 
			} 
		}else{ 
			System.out.println("파일이 존재하지 않습니다."); 
		}

	}

	public void cart_update(String id ,int num, String product) {
		PayDTO dto = new PayDTO();
		dto.setId(id);
		dto.setCount(Integer.toString(num));
		dto.setProduct(product);
		dao.update_Count(dto);
	}

	public void cart_update2(String id ,int num, String product) {
		PayDTO dto = new PayDTO();
		dto.setId(id);
		dto.setCount(Integer.toString(num));
		dto.setProduct(product);
		dao.update_Countd(dto);
	}
	public void update(PayDTO dto) {
		dao.update(dto);
	}

}