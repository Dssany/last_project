package com.project.dto;

public class chartDTO {
   private int earringPrice;
   private int dressPrice;
   private int bagPrice;
   private int phonPrice;
   private int totalPrice;
   
   public chartDTO() {
      earringPrice =0;
      dressPrice =0;
      bagPrice =0;
      phonPrice =0;
   }
   
   
   public int getPhonPrice() {
   return phonPrice;
}


public void setPhonPrice(int phonPrice) {
   this.phonPrice = phonPrice;
}


public int getEarringPrice() {
      return earringPrice;
   }
   public void setEarringPrice(int earringPrice) {
      this.earringPrice = earringPrice;
   }
   public int getDressPrice() {
      return dressPrice;
   }
   public void setDressPrice(int dressPrice) {
      this.dressPrice = dressPrice;
   }
   public int getBagPrice() {
      return bagPrice;
   }
   public void setBagPrice(int bagPrice) {
      this.bagPrice = bagPrice;
   }
   public int getTotalPrice() {
      return totalPrice;
   }
   public void setTotalPrice(int totalPrice) {
      this.totalPrice = totalPrice;
   }
   
   public String toString() {
      return  earringPrice + "," +bagPrice + "," + dressPrice +","+phonPrice;
   }
   
}