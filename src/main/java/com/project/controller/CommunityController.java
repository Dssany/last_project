package com.project.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;
import com.project.dto.ReplyDTO;
import com.project.service.AdminService;
import com.project.service.CommunityService;
import com.project.service.ReplyService;

@Controller
public class CommunityController {
   
   @Autowired
   CommunityService service;
   
   @Autowired
   private ReplyService replyService;
   
   @Autowired
   private AdminService serviceAdm;
   
   @RequestMapping("list")
   public String list(CommnuityDTO dto, Model model) {
      service.listAll(dto,model);
      return "community/list";
   }
   
   @RequestMapping("view")
   public String view(CommnuityDTO dto, Model model, HttpServletRequest request) {
      service.count(dto);
      service.view(dto,model);
      System.out.println(dto.getBno());
      HttpSession session = request.getSession();
      
      if(session.getAttribute("id")==null) {
          model.addAttribute("logstart","로그인 해주세요");
          return "login&join/login";
       }else {
      model.addAttribute("id", session.getAttribute("id").toString());
      return "community/view";
       }
   }
   
   @RequestMapping("reply")
   @ResponseBody
   public int reply(@RequestParam int bno,@RequestParam String writer,@RequestParam String content,Model model) {
      ReplyDTO dto = new ReplyDTO();
      
      
      System.out.println(bno);
      System.out.println(content);
      System.out.println(writer);
      dto.setBno(Integer.valueOf(bno));
      dto.setContent(content.replaceAll("\\r\\n","<br>"));
      dto.setWriter(writer);
      dto.setBrno(0);
      
      return replyService.insert(dto);
   }

   
   @RequestMapping("commentlist") //댓글 리스트
   @ResponseBody
   private List<ReplyDTO> mCommentServiceList(Model model,@RequestParam int bno) throws Exception{
       return replyService.select(bno);
   }

   
   @RequestMapping("write")
   public String write() {
      return "community/write";
   }
   @RequestMapping("save_write")
   public String save_write(CommnuityDTO dto) {
      service.save_write(dto);
      return "redirect:list";
   }
   
   @RequestMapping("update")
   public String update(CommnuityDTO dto,Model model) {
      service.update(dto,model);
      return "community/update";
   }
   
   @RequestMapping("update_save")
   public String update_sava(CommnuityDTO dto, HttpServletRequest request) {
      service.update_save(dto);
      HttpSession session = request.getSession();
      
      if(session.getAttribute("id").equals("admin")) {
         
         return "forward:viewBoard"; 
      }
      return "redirect:list";
   }
   
   @RequestMapping("delete")
   public String delete(CommnuityDTO dto, HttpServletRequest request) {
      service.delete(dto);
      HttpSession session = request.getSession();
      
      if(session.getAttribute("id").equals("admin")) {
         return "redirect:acboard";
      }
      
      return "redirect:list";
   }
   
   
   @RequestMapping("notice")
   public String notice(AdminNoticeDTO dto,Model model) {
      serviceAdm.listAll(dto, model);
      return "community/notice";
   }
   @RequestMapping("noticeview")
   public String noticeview(AdminNoticeDTO dto, Model model,@RequestParam("num") Integer num ,@RequestParam("maxSize") Integer maxSize) {
      System.out.println(dto.getNum());
      System.out.println(maxSize);
      model.addAttribute("maxSize", maxSize);
//      System.out.println(bno + "bno check");
      dto.setNum(num);
      serviceAdm.count(dto);
      serviceAdm.view(dto,model);
      return "community/noticeview";
   }
   
   @RequestMapping(value="search", method = RequestMethod.POST)
   public String title_search(CommnuityDTO dto, Model model, @RequestParam String type_result,@RequestParam String search_result,
         @RequestParam String start_result,@RequestParam String end_result) {
     service.title_search(dto,model,type_result,search_result,start_result,end_result);
      return "community/list";
   }
   @RequestMapping(value="notice_search", method = RequestMethod.POST)
   public String notice_search(CommnuityDTO dto, Model model, @RequestParam String type_result,@RequestParam String search_result,
         @RequestParam String start_result,@RequestParam String end_result) {
     service.notice_search(dto,model,type_result,search_result,start_result,end_result);
      return "community/notice";
   }
   
   @RequestMapping(value="replydel", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void reply_del(@RequestParam int rno, @RequestParam(required = false) String brno) {
      if(brno==null) {
         replyService.delete(rno);
      }else {
         replyService.delete_Add(rno,brno);
      }

   }
   
   @RequestMapping(value="replych", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void replych(ReplyDTO dto) {
      replyService.update(dto);
   }
   @RequestMapping("replyupdate") //댓글 수정  
   @ResponseBody
   private int mCommentServiceUpdateProc(@RequestParam int rno,@RequestParam(required = false) String brno, @RequestParam String content) throws Exception{
      if(brno==null) {
         ReplyDTO dto = new ReplyDTO();
          dto.setP_rno(rno);
          dto.setContent(content.replaceAll("\n","<br>"));
          return replyService.update(dto);
      }else {
         ReplyDTO dto = new ReplyDTO();
          dto.setP_rno(rno);
          dto.setBrno(Integer.valueOf(brno));
          dto.setContent(content.replaceAll("\n","<br>"));
          
          return replyService.update_Add(dto);
      }
      
     
   }
   @RequestMapping(value="replyAddInsert",method = RequestMethod.POST,produces = "application/text; charset=utf8") 
   @ResponseBody
   private String replyAddInsert(@RequestParam int rno,@RequestParam int bno,@RequestParam String content,@RequestParam String writer) throws Exception{
       
      ReplyDTO dto = new ReplyDTO();
      dto.setBno(bno);
      dto.setContent(content);
      dto.setP_rno(rno);
      dto.setWriter(writer);
      System.out.println(dto.getWriter());
      System.out.println(dto.getBno());
      System.out.println(dto.getContent());
      System.out.println(dto.getP_rno());
      
      
      return String.valueOf(replyService.insertAddRe(dto));
   }
}