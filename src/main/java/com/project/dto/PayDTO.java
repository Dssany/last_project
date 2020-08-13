package com.project.dto;

public class PayDTO {
   private String id;
   private String order_id;
   private String img;
   private String product;
   private String type;
   private String count;
   private String price;
   private String day;
   private String totalprice;
   private String method;
   private String status;
   private String addr1;
   private String addr2;
   private String addr3;
   private String company;
   private String delivery_status;
   private String review_ch;
   private String rno;
   private String start;
   private String end;
   private String num;
   
   
   
   public String getNum() {
   return num;
}

public void setNum(String num) {
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

   public String getRno() {
      return rno;
   }

   public void setRno(String rno) {
      this.rno = rno;
   }

   public String getReview_ch() {
      return review_ch;
   }

   public void setReview_ch(String review_ch) {
      this.review_ch = review_ch;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getOrder_id() {
      return order_id;
   }

   public void setOrder_id(String order_id) {
      this.order_id = order_id;
   }

   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }

   public String getProduct() {
      return product;
   }

   public void setProduct(String product) {
      this.product = product;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getCount() {
      return count;
   }

   public void setCount(String count) {
      this.count = count;
   }

   public String getPrice() {
      return price;
   }

   public void setPrice(String price) {
      this.price = price;
   }

   public String getDay() {
      return day;
   }

   public void setDay(String day) {
      this.day = day;
   }

   public String getTotalprice() {
      return totalprice;
   }

   public void setTotalprice(String totalprice) {
      this.totalprice = totalprice;
   }

   public String getMethod() {
      return method;
   }

   public void setMethod(String method) {
      this.method = method;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getAddr1() {
      return addr1;
   }

   public void setAddr1(String addr1) {
      this.addr1 = addr1;
   }

   public String getAddr2() {
      return addr2;
   }

   public void setAddr2(String addr2) {
      this.addr2 = addr2;
   }

   public String getAddr3() {
      return addr3;
   }

   public void setAddr3(String addr3) {
      this.addr3 = addr3;
   }

   public String getCompany() {
      return company;
   }

   public void setCompany(String company) {
      this.company = company;
   }

   public String getDelivery_status() {
      return delivery_status;
   }

   public void setDelivery_status(String delivery_status) {
      this.delivery_status = delivery_status;
   }

   @Override
   public String toString() {
      return "[" + type + "," + day + "," + status + "," + price + "]";
   }
}