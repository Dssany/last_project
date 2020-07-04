package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.MyimgDTO;
import com.project.service.MyimgService;
import com.project.service.cartService;

@Controller
public class DesignController {
	@Autowired
	private cartService cartservice;
	@Autowired
	private MyimgService myimgservice;
	
	@PostMapping("design")
	public String design(@RequestParam String imgname, @RequestParam String imgmoney, Model model) {
		model.addAttribute("img_name", imgname);
		model.addAttribute("img_money", imgmoney);
		return "design/design";
	}
	
	@RequestMapping("myimg")
	public String myimg(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<String> arr1 = new ArrayList<String>();
		List<MyimgDTO> z=myimgservice.select(session.getAttribute("id").toString());
		for(int i=0;i<z.size();i++) {
			arr1.add(z.get(i).getImg());
		}
		model.addAttribute("myimg_imglist",arr1);
		return "design/myimg";
	}

	@RequestMapping("tip")
	public String tip() {
		return "design/tip";
	}

	@RequestMapping(value = "userimg_insert", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String userimg_insert(HttpServletRequest request, @RequestParam String userimg_in,@RequestParam String imgname, @RequestParam String imgmoney) {
		System.out.println("userimg_in : " + userimg_in);
		System.out.println("imgname : " + imgname);
		System.out.println("imgmoney : " + imgmoney);
		cartservice.cart_insert(request, userimg_in, imgname, imgmoney);
		return "장바구니 저장 완료";
	}
}