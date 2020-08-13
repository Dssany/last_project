package com.project.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.project.service.CookieUtils;
import com.project.service.MyimgService;
import com.project.service.ProjectService;
import com.project.service.cartService;

@Controller
public class DesignController {
   @Autowired
   private cartService cartservice;
   @Autowired
   private MyimgService myimgservice;
   @Autowired
   private ProjectService service;
   
   @PostMapping("design")
   public String design(@RequestParam String imggoods,@RequestParam String imgname, @RequestParam String imgmoney, Model model,HttpServletRequest request, HttpServletResponse response) {
      CookieUtils cook = new CookieUtils();
      try {
      cook.setCookie("text1", imgname, 1, request, response);
   } catch (UnsupportedEncodingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
   }
      if(!imggoods.equals("earring")) {
         model.addAttribute("img_name", imgname);
          model.addAttribute("img_money", imgmoney);
          model.addAttribute("img_goods", imggoods);
         return "design/design";
      }
      else {
         service.earring_list(model,imgname);
         model.addAttribute("img_goods", imggoods);
         return "design/earring";
      }
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
   public String userimg_insert(Model model,HttpServletRequest request, @RequestParam String userimg_in,@RequestParam String imgname, @RequestParam String imgmoney, @RequestParam String type) {
      if(request.getSession().getAttribute("id")==null) {
          model.addAttribute("logstart","로그인 해주세요");
          return "login&join/login";
       }else {
         cartservice.cart_insert(request, userimg_in, imgname, imgmoney,type);
         return "장바구니 저장 완료";
       }
   }
   
   @RequestMapping(value = "myimg_delect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public String myimg_delete(Model model,HttpServletRequest request, @RequestParam String img) {
      HttpSession session = request.getSession();
      myimgservice.myimg_delete(session.getAttribute("id").toString(), img);
      return "내 이미지 삭제 완료";
   }
   @RequestMapping(value = "change", method = {RequestMethod.GET, RequestMethod.POST})
   public String change(Model model, @RequestParam String change_val,@RequestParam String start,@RequestParam String end) {
      service.data(model,change_val,start,end);
      return "design/change";
   }
   
   @RequestMapping("delivery")
   public String delivery() {
      return "design/delivery";
   }
   
   @RequestMapping("quality")
   public String quality() {
      return "design/quality";
   }
}