package com.project.service;


import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.DataListDAO;
import com.project.dao.UserDAO;
import com.project.dao.bannerDAO;
import com.project.dao.payDAO;
import com.project.dto.CommnuityDTO;
import com.project.dto.DataListDTO;
import com.project.dto.PayDTO;
import com.project.dto.UserDTO;

@Service
public class ProjectService {
   @Autowired
   private UserDAO userdao;
   @Autowired
   private payDAO dao;

   @Autowired
   private DataListDAO datalistdao;
   
   @Autowired
   private bannerDAO bannerdao;
   
   public void index(Model model) {
         
         String[] type = {"earring","bag","dress","phon"};
         ArrayList<String> product = new ArrayList<String>();
         ArrayList<Integer> price = new ArrayList<Integer>();
         ArrayList<String> img = new ArrayList<String>();
         
         for(int x=0;x<4;x++) {
            DataListDTO dto = new DataListDTO();
            dto.setType(type[x]);
            dto.setCnt("5");
            List<DataListDTO> arr = datalistdao.select_number_ran(dto);
            for(int i=0;i<arr.size();i++) {
               product.add(arr.get(i).getProduct());
               price.add(arr.get(i).getPrice());
               img.add(arr.get(i).getImg());
            }
         }
         model.addAttribute("product", product);
         model.addAttribute("img", img);
         model.addAttribute("price", price);
      }
   
   
   public void data(Model model, String type, String start, String end) {
         DataListDTO dto = new DataListDTO();
         dto.setType(type);
         dto.setStart(String.valueOf((Integer.valueOf(start) + 1)));
         dto.setEnd(end);

         ArrayList<String> arr = new ArrayList<String>();
         ArrayList<String> arr2 = new ArrayList<String>();
         ArrayList<String> arr3 = new ArrayList<String>();
         ArrayList<String> arr4 = new ArrayList<String>();
         List<DataListDTO> l=null;
         if(type.equals("all")) {
            l = datalistdao.select_all_number(dto);
            model.addAttribute("list_size", datalistdao.selectall_count(dto));
         }else {
            l = datalistdao.select_number(dto);
            model.addAttribute("list_size", datalistdao.select_count(dto));
         }
         for (int i = 0; i < l.size(); i++) {
            arr.add("'" + l.get(i).getImg() + "'");
            arr2.add("'" + l.get(i).getProduct() + "'");
            arr3.add("'" + l.get(i).getPrice() + "'");
            arr4.add("'" + l.get(i).getCount() + "'");
         }
         

         model.addAttribute("list_img", arr);
         model.addAttribute("list_product", arr2);
         model.addAttribute("list_price", arr3);
         model.addAttribute("list_count", arr4);
         model.addAttribute("list_type", type);
         model.addAttribute("list_last", end);
      }

   public void insert(UserDTO dto) {
         UserDTO newdto = new UserDTO();
         Sha sha = new Sha();
         newdto.setId(dto.getId());
         try {
            newdto.setPw(sha.sha256(dto.getPw()));
         } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         newdto.setName(dto.getName());
         newdto.setAddr1(dto.getAddr1());
         newdto.setAddr2(dto.getAddr2());
         newdto.setAddr3(dto.getAddr3());
         newdto.setPhon(dto.getPhon());
         newdto.setEmail(dto.getEmail());
         userdao.insert(newdto);
      }
   public void delete(String num) {
      userdao.delete(num);
   }
      public void update(UserDTO dto) {
            Sha sha = new Sha();
            try {
               dto.setPw(sha.sha256(dto.getPw()));
               userdao.update(dto);
            } catch (NoSuchAlgorithmException e) {
               e.printStackTrace();
            }
         }
   public void select(Model model,UserDTO dto) {
      model.addAttribute("listAll",userdao.selectAll(dto));
      model.addAttribute("list_size",userdao.user_count());
     
       model.addAttribute("list_last", dto.getEnd());
      
   }

   // 회원가입시 ID 확인
   public void idch(Model model,String id) {
      if(userdao.select(id).getId().equals(id)) {
         model.addAttribute("id_result",userdao.select(id).getId());
      }else {
         model.addAttribute("id_result","");
      }
   }

   // 로그인시 ID, PW 확인
   public boolean loginch(String id, String pw) {
         Sha sha = new Sha();
         try {
            if (userdao.select(id) != null && userdao.select(id).getId().equals(id)
                  && userdao.select(id).getPw().equals(sha.sha256(pw))) {
               return true;
            }
         } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         return false;
      }

   public void myinfo(Model model,HttpServletRequest request) {
      HttpSession session = request.getSession();
      model.addAttribute("myinfo_list",userdao.select(session.getAttribute("id").toString()));
   }

   public String header_review_list() {
      List<DataListDTO> arr = datalistdao.selectAll();
      return arr.get(0).getProduct();
   }

   public UserDTO buyInfo(String id) {

      return userdao.select(id);
   }
    public void orderlist(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        PayDTO dto = new PayDTO();
        System.out.println(session.getAttribute("id").toString());
        dto.setId(session.getAttribute("id").toString());
        ArrayList<PayDTO> paydto = (ArrayList<PayDTO>) dao.order_list(dto);
     
        model.addAttribute("order_list", paydto);
        

     }

      public void earring_list(Model model,String imgname) {
            List<DataListDTO> arr=datalistdao.selectAll2();
            ArrayList<String> newarr1=new ArrayList<String>();
            ArrayList<String> newarr2=new ArrayList<String>();
            ArrayList<String> newarr3=new ArrayList<String>();
            for(int i=0;i<arr.size();i++) {
               String[] cut = imgname.split("/");
               String ss="";
               for(int x=0;x<cut.length;x++) {
                  ss+=cut[x];
                  if(x!=cut.length-1) {
                     ss+="_";
                  }
               }
               if(arr.get(i).getImg().split("/")[3].contains("png") 
                     && arr.get(i).getImg().split("/")[3].contains(ss)) {
                  arr.get(i).setProduct(ss);
                  newarr1.add("'"+arr.get(i).getImg()+"'");
                  newarr2.add("'"+arr.get(i).getProduct()+"'");
                  newarr3.add("'"+arr.get(i).getPrice()+"'");
               }
            }
            model.addAttribute("earring_list_img",newarr1);
            model.addAttribute("earring_list_price",newarr3);
            model.addAttribute("earring_list_product",newarr2);
         }


   public String select_price(Model model, String product) {
      String a = datalistdao.select_price(product);
      model.addAttribute("price", a);
      return a;
   }


   public void bannerAll(Model model) {
      model.addAttribute("banner_list", bannerdao.selectAll());
      
   }
   
   public void user_search(UserDTO dto, Model model, String type_result,String search_result,String start_result,String end_result) {
	      List<UserDTO> arr = null;
	      String s=null;
	      dto.setStart(start_result);
	      dto.setEnd(end_result);
	      System.out.println(search_result);
	     if(type_result.equals("id")){
	        dto.setId(search_result);
	        arr=userdao.listSearch_id(dto);
	        s=userdao.listSearch_id_count(dto);
	      }else if(type_result.equals("name")) {
	         dto.setName(search_result);
	         arr=userdao.listSearch_name(dto);
	         s=userdao.listSearch_name_count(dto);
	      }else {
	         dto.setPhon(search_result);
	         arr=userdao.listSearch_phon(dto);
	         s=userdao.listSearch_phon_count(dto);
	      }
	     if(s==null) {
	        model.addAttribute("list_size", 0);
	     }else {
	        model.addAttribute("list_size", s);
	     }
	     model.addAttribute("listAll", arr);
	     model.addAttribute("list_last", dto.getEnd());
	     model.addAttribute("list_type_result", type_result);
	     model.addAttribute("list_search_result", search_result);
	   }

}