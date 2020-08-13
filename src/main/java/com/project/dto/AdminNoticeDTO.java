package com.project.dto;

import java.sql.Date;

public class AdminNoticeDTO {

   private int bno;
   private String title;
   private String content;
   private String writer;
   private Date regdate;
   private int viewcnt;
   private String start;
   private String end;
   private int num;
   
   

   public int getNum() {
   return num;
}

public void setNum(int num) {
   this.num = num;
}

public String getStart() {
      return start;
   }

   public void setStart(String start) {
      this.start = start;
   }

   public String getEnd() {
      return end;
   }

   public void setEnd(String end) {
      this.end = end;
   }

   public int getBno() {
      return bno;
   }

   public void setBno(int bno) {
      this.bno = bno;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public Date getRegdate() {
      return regdate;
   }

   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }

   public int getViewcnt() {
      return viewcnt;
   }

   public void setViewcnt(int viewcnt) {
      this.viewcnt = viewcnt;
   }

}