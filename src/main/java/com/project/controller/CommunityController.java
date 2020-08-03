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
   public String list(CommnuityDTO dto, Model model,ReplyDTO redto) {
      service.listAll(dto,model);
      service.adminview(dto,model);
      
      return "community/list";
   }
   
   @RequestMapping("view")
   public String view(CommnuityDTO dto, Model model, HttpServletRequest request) {
      service.count(dto);
      service.view(dto,model);
      HttpSession session = request.getSession();
      
      if(session.getAttribute("id")==null) {
          model.addAttribute("logstart","로그인 해주세요");
          return "login&join/login";
       }else {
      model.addAttribute("id", session.getAttribute("id").toString());
      return "community/view2";
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
      
      return replyService.insert(dto);
   }

   
   @RequestMapping("commentlist") //댓글 리스트
   @ResponseBody
   private List<ReplyDTO> mCommentServiceList(Model model,@RequestParam int bno) throws Exception{
//	   List<ReplyDTO> arr = 
			   
//	   for (ReplyDTO value : arr) {
//		String change = value.getContent().replaceAll("\n","<br>");
//		value.setContent(change);
//	}
	   
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
      serviceAdm.adminList(dto, model);
      return "community/notice";
   }
   @RequestMapping("noticeview")
   public String noticeview(AdminNoticeDTO dto, Model model,@RequestParam("bno") Integer bno) {
      System.out.println(dto.getBno());

      System.out.println(bno + "bno check");
      dto.setBno(bno);
      serviceAdm.count(dto);
      serviceAdm.view(dto,model);
      return "community/noticeview";
   }
   
   @RequestMapping(value="search", method = RequestMethod.POST)
   public String title_search(CommnuityDTO dto, Model model, @RequestParam String type_result,@RequestParam String search_result) {
     service.title_search(dto,model,type_result,search_result);
      return "community/list";
   }
   
   @RequestMapping(value="replydel", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void reply_del(ReplyDTO dto) {
      replyService.delete(dto);
   }
   
   @RequestMapping(value="replych", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void replych(ReplyDTO dto) {
      replyService.update(dto);
   }
   
   @RequestMapping("replyupdate") //댓글 수정  
   @ResponseBody
   private int mCommentServiceUpdateProc(@RequestParam int rno, @RequestParam String content) throws Exception{
	   ReplyDTO dto = new ReplyDTO();
       dto.setRno(rno);
       dto.setContent(content.replaceAll("\\r\\n","<br>"));
       
       return replyService.update(dto);
   }


   
   
   
   
   
   
   
}