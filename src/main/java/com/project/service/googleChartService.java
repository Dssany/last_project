package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.googleChartDAO;
import com.project.dto.PayDTO;
import com.project.dto.chartDTO;

@Service
public class googleChartService {

   @Autowired
   private googleChartDAO dao;
   

   public void Chart(PayDTO dto, Model model,@RequestParam String yer) {
      List<PayDTO> list = dao.Chart(dto);
      
      for(int j=1; j<13; j++ ) {
         chartDTO ch = new chartDTO();
            for(   int i=0; i<list.size(); i++) {
               if(list.get(i).toString().contains(yer)) {
               
               if(j <10) {
                  if(list.get(i).toString().contains("-0"+j+"-")) {
//                        System.out.println(j+"월" +ch.toString());
                        if(list.get(i).toString().contains("earring")) { ch.setEarringPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getEarringPrice()); }
                        if(list.get(i).toString().contains("bag")) { ch.setBagPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getBagPrice()); }
                        if(list.get(i).toString().contains("dress")) { ch.setDressPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getDressPrice()); }
                        if(list.get(i).toString().contains("phon")) { ch.setPhonPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getPhonPrice()); }
                         ch.setTotalPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getTotalPrice());
                     
//                         System.out.println(j+"월" +ch.toString());
                         
                        
                        
                  }
               }else if(j >=10){
                  if(list.get(i).toString().contains("-"+j+"-")) {
                     if(list.get(i).toString().contains("earring")) { ch.setEarringPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getEarringPrice()); }
                     if(list.get(i).toString().contains("bag")) { ch.setBagPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getBagPrice()); }
                     if(list.get(i).toString().contains("dress")) { ch.setDressPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getDressPrice()); }
                     if(list.get(i).toString().contains("phon")) { ch.setPhonPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getPhonPrice()); }
                     ch.setTotalPrice(Integer.parseInt(list.get(i).getPrice())  + ch.getEarringPrice());
                     
                     
                  }
               }

            }
               
               
               
         }
            model.addAttribute("chart"+j+"mon", ch.toString());
            model.addAttribute("chart"+j+"mont", ch.getTotalPrice());
            System.out.println(j+"월" +ch.toString());
      }
            model.addAttribute("yer", yer);
   }
}

   //      model.addAttribute("Chartlist", dao.Chart(dto));

