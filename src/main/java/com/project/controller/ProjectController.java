package com.project.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.project.dto.UserDTO;
import com.project.dao.DataListDAO;
import com.project.dto.CookieDTO;
import com.project.dto.DataListDTO;
import com.project.dto.PayDTO;
import com.project.dto.buyDTO;
import com.project.service.CookieUtils;
import com.project.service.ProjectService;
import com.project.service.cartService;

@Controller
public class ProjectController {
   @Autowired
   private ProjectService service;
   @Autowired
   private cartService cartservice;
   @Autowired
   private DataListDAO datalistdao;
   


      @RequestMapping("index")
      public String index_run(Model model, HttpServletRequest request) {
         service.index(model);
         CookieDTO dto = new CookieDTO();
         CookieUtils cook = new CookieUtils();
         List<DataListDTO> img_list;

         ArrayList<String> newarr = new ArrayList<String>();
         ArrayList<String> newtype = new ArrayList<String>();
         ArrayList<String> newprice = new ArrayList<String>();
         ArrayList<String> newproduct = new ArrayList<String>();
         try {
            List<String> arr = cook.getValueList("text1", request);
            if (arr.size() == 1) {
               dto.setProduct1(arr.get(0));
               img_list = datalistdao.select_cookie_one(dto);
            } else if (arr.size() == 2) {
               dto.setProduct1(arr.get(0));
               dto.setProduct2(arr.get(1));
               img_list = datalistdao.select_cookie_two(dto);
            } else if (arr.size() == 3) {
               dto.setProduct1(arr.get(0));
               dto.setProduct2(arr.get(1));
               dto.setProduct3(arr.get(2));
               img_list = datalistdao.select_cookie_three(dto);
            } else if (arr.size() == 4) {
               dto.setProduct1(arr.get(0));
               dto.setProduct2(arr.get(1));
               dto.setProduct3(arr.get(2));
               dto.setProduct4(arr.get(3));
               img_list = datalistdao.select_cookie_four(dto);
            } else {
               img_list = new ArrayList<DataListDTO>();
            }
            for (int x = 0; x < img_list.size(); x++) {
               System.out.println(img_list.get(x).getImg());
               newarr.add("'" + img_list.get(x).getImg() + "'");
               newtype.add("'" + img_list.get(x).getType() + "'");
               newprice.add("'" + img_list.get(x).getPrice() + "'");
               newproduct.add("'" + img_list.get(x).getProduct() + "'");
            }
            model.addAttribute("newsee_list", newarr);
            model.addAttribute("newsee_type", newtype);
            model.addAttribute("newsee_price", newprice);
            model.addAttribute("newsee_product", newproduct);
         } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         return "default/index";
      }

   @RequestMapping("error")
   public String error(@RequestParam String num,Model model) {
      switch (num) {
      case "1":
         model.addAttribute("num",num);
         return "login&join/alert";
      case "2":
         model.addAttribute("num",num);
         return "login&join/alert";
      default:
         break;
      }
      return "login&join/alert";
   }

   @RequestMapping("loginchk")
   public String loginch(@RequestParam String id, @RequestParam String pw,HttpServletRequest request,RedirectAttributes redirectattributer) {
      boolean chk = service.loginch(id,pw);
      if(chk==true) {
         if(id.equals("admin")) {
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            session.setAttribute("pw", pw);

            return "redirect:adminpage";
         }else {
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            session.setAttribute("pw", pw);
            return "redirect:index";
         }

      }else {
         return "redirect:error?num=1";
      }
   }

   @RequestMapping("joinok")
   public String joinok(UserDTO dto) {
      try {
         service.insert(dto);
      } catch (Exception e) {
         System.out.println("동일한 아이디존재합니다");
         return "redirect:error?num=2";
      }

      return "redirect:index";
   }

   @RequestMapping("join")
   public String join() {
      return "login&join/join";
   }

   @RequestMapping("idch")
   public String idch(Model model, @RequestParam String id) {
      service.idch(model, id);
      return "login&join/join";
   }


   @RequestMapping("cart")
   public String cart(Model model,HttpServletRequest request) {
      HttpSession session = request.getSession();
      List<PayDTO> arr = cartservice.cart_select(model,session.getAttribute("id").toString());
      ArrayList<Object> arrz= new ArrayList<Object>();
      for(int i=0;i<arr.size();i++) {
         String[] z=new String[8];
         z[0]=arr.get(i).getImg();
         z[1]=arr.get(i).getId();
         z[2]=arr.get(i).getProduct();
         z[3]=arr.get(i).getStatus();
         z[4]=arr.get(i).getPrice();
         z[5]=String.valueOf(i);
         z[6]=arr.get(i).getCount();
         z[7]=arr.get(i).getRno();
         arrz.add(z);
      }
      model.addAttribute("cartlist",arrz);
      return "shop/cart";
   }
   @RequestMapping("listdel")
   public String cart_delect(HttpServletRequest request, @RequestParam String img, @RequestParam String rno) {
      System.out.println("img : " + img);
      String[] c = img.split("/");
      String m="";
      for(int i=4;i<c.length;i++) {
         m+=c[i];
         if(c.length-1!=i) {
            System.out.println(m);
            m+="/";
         }
      }
      System.out.println("m : "+m);
      cartservice.cart_delete(request,img   ,rno);
      return "redirect:cart";
   }


   @RequestMapping(value ="orderForm", method = {RequestMethod.GET, RequestMethod.POST})
   public String orderForm(Model model, HttpServletRequest request, @RequestParam(value="fpro", required=false) String fpro, @RequestParam(value="total", required=false) String total
         , @RequestParam(value="sum", required=false) String sum) {
//      Date date = new Date();
//      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
      HttpSession session = request.getSession();
      //      System.out.println(session.getAttribute("id"));
      List<PayDTO> userimglist = new ArrayList<PayDTO>();
      userimglist = cartservice.cart_select(model, session.getAttribute("id").toString());
      model.addAttribute("userInfo", service.buyInfo(session.getAttribute("id").toString()));
      model.addAttribute("list", userimglist);
      //      System.out.println(fpro);
      //      System.out.println(total);
      //      System.out.println(sum);
      //      model.addAttribute("fpro", fpro);
//      String key="";
//      String[] keylist = {"1","2","3","4","5","6","7","8","9",
//            "Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
//            "q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"};
//      Random random = new Random();

//      for(int i=0;i<15;i++) {
//         key += keylist[random.nextInt(keylist.length)];
//      }
//      model.addAttribute("order_id", key);
//      model.addAttribute("date", format.format(date));
      
      model.addAttribute("total", total);
      model.addAttribute("sum", sum);   
      return "shop/orderForm";
   }

   @RequestMapping(value="buy", method =  RequestMethod.POST)
   public String buy(Model model,buyDTO buydto) {
      Date date = new Date();
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
      System.out.println(buydto.getName());
      System.out.println(buydto.getAddr1());
      System.out.println(buydto.getAddr2());
      System.out.println(buydto.getAddr3());
      System.out.println(buydto.getEmail());
      System.out.println(buydto.getPhon());
      System.out.println(buydto.getTotal());
      System.out.println(buydto.getSum());
      System.out.println(buydto.getDelRequest());
      System.out.println(buydto.getProRequest());
      System.out.println(buydto.getlPro());
      String[] spType = buydto.getType().split(",");
      buydto.setType(spType[0]);
      System.out.println(buydto.getType());
      model.addAttribute("buydto",buydto);
      String key="";
      String[] keylist = {"1","2","3","4","5","6","7","8","9",
            "Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
            "q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"};
      Random random = new Random();

      for(int i=0;i<15;i++) {
         key += keylist[random.nextInt(keylist.length)];
      }
      model.addAttribute("order_id", key);
      model.addAttribute("date", format.format(date));
      return "shop/buy";
   }

   @RequestMapping(value="header_review", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public String header_review() {
      return service.header_review_list();
   }

   @RequestMapping("myinfo")
   public String myinfo(Model model,HttpServletRequest request) {
      service.myinfo(model, request);
      return "login&join/myinfo";
   }
   @RequestMapping("info_change")
   public String info_change(UserDTO dto) {
      service.update(dto);
      return "redirect:index";
   }

   @RequestMapping("data")
      public String data(Model model, @RequestParam String type, @RequestParam String start, @RequestParam String end,
            HttpServletRequest request) {
         CookieDTO dto = new CookieDTO();
         CookieUtils cook = new CookieUtils();
         List<DataListDTO> img_list;

         ArrayList<String> newarr = new ArrayList<String>();
         ArrayList<String> newtype = new ArrayList<String>();
         ArrayList<String> newprice = new ArrayList<String>();
         ArrayList<String> newproduct = new ArrayList<String>();
         try {
            List<String> arr = cook.getValueList("text1", request);
            if (arr.size() == 1) {
               dto.setProduct1(arr.get(0));
               img_list = datalistdao.select_cookie_one(dto);
            } else if (arr.size() == 2) {
               dto.setProduct1(arr.get(0));
               dto.setProduct2(arr.get(1));
               img_list = datalistdao.select_cookie_two(dto);
            } else if (arr.size() == 3) {
               dto.setProduct1(arr.get(0));
               dto.setProduct2(arr.get(1));
               dto.setProduct3(arr.get(2));
               img_list = datalistdao.select_cookie_three(dto);
            } else if (arr.size() == 4) {
               dto.setProduct1(arr.get(0));
               dto.setProduct2(arr.get(1));
               dto.setProduct3(arr.get(2));
               dto.setProduct4(arr.get(3));
               img_list = datalistdao.select_cookie_four(dto);
            } else {
               img_list = new ArrayList<DataListDTO>();
            }
            for (int x = 0; x < img_list.size(); x++) {
               System.out.println(img_list.get(x).getImg());
               newarr.add("'" + img_list.get(x).getImg() + "'");
               newtype.add("'" + img_list.get(x).getType() + "'");
               newprice.add("'" + img_list.get(x).getPrice() + "'");
               newproduct.add("'" + img_list.get(x).getProduct() + "'");
            }
            model.addAttribute("newsee_list", newarr);
            model.addAttribute("newsee_type", newtype);
            model.addAttribute("newsee_price", newprice);
            model.addAttribute("newsee_product", newproduct);
         } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         service.data(model, type, start, end);
         return "default/data";
      }
   
   @RequestMapping("orderList")
   public String orderList(Model model,HttpServletRequest request) {
      service.orderlist(model,request);
      return "shop/orderList";
   }
   
    @RequestMapping("company_profile")
    public String company_profile() {
       return "default/company_profile";
    }
   
    @RequestMapping("Banner")
    public String banner(Model model) {
       service.bannerAll(model);
       return "default/Banner";
    }
    
//   @RequestMapping("All")
//   public String listAll(Model model,@RequestParam String start,@RequestParam String end) {
//      service.data(model, type, start, end);
//      service.listAll();
//      return "data";
//   }
}