<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
var cookie_type=${newsee_type}
var cookie_price=${newsee_price}
var cookie_product=${newsee_product}
function data_movee(d) {
         $("#index_imggoods_text").val(cookie_type[d]);
         $("#index_imgname_text").val(cookie_product[d]);
         $("#index_imgmoney_text").val(cookie_price[d]);
         index_form.submit();
      }
var cookie_img=${newsee_list}
$(function() {
      for(i=0;i<cookie_img.length;i++){
         $("#index_cookie_ul").append("<li style='list-style: none;'>"
          +"<a href='javascript:data_movee(\""+i+"\")' style='float: left; text-decoration: none; color: #000;'>"
          +"<img style='width: 64px; height: 80px; padding: 2px 2px 2px 2px; text-align: center; border: none; vertical-align: top;'"
          +"src='"+cookie_img[i]+"'></a>"
          +"</li>");
      }
   });
var menucount=0;
function menubar_open() {
if(menucount==0)
   $("#menubar").animate({right: "-160"}, 1000);
else
   $("#menubar").animate({right: "0"}, 1000);
menucount++;
if(menucount==2)
   menucount=0;

}
</script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet">
<style>
   .scrolltop {
        display: none;
        position: fixed;
        right: 30px;
        bottom: 100px;
        z-index: 1030;
        font-size: 1.875rem;
        color: #868e96;
        transition: all 0.5s ease-in-out;
        opacity: 0.8;
      }
      .scrolltop:hover,
      .scrolltop:focus {
        color: #dc3545;
        transition: all 0.5s ease-in-out;
      }
   
</style>
</head>
<body>

 <!--    top버튼 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
      jQuery(document).ready(function () {
        $(window).scroll(function () {
          if ($(this).scrollTop() > 100) {
            $('#backToTop').fadeIn(500);
          } else {
            $('#backToTop').fadeOut('slow');
          }
        });
        $('#backToTop').click(function (e) {
          e.preventDefault();
          $('html, body').animate({scrollTop: 0}, 200);
        });
      });
    </script>
   <!--    옆에 메뉴바 -->
   <div style="position: fixed; width: 160px; height: 100%; background-color: #eeeeee; top: 0; right: 0; box-shadow: 0px 0px 2px #d8d8d8;
            margin: 0px; padding: 0px; z-index: 99999; right: 0px;" id="menubar">
      <div style="float: left; width: 160px; margin: 70px 0 30px 0; padding: 0 0 px 0px 0;">
         <ul style="display: block; list-style-type: disc;">
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer;" onclick="data_move('bag')">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">
                  <b style="font-weight: bold;">Bag</b></a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer" onclick="data_move('dress')">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">
                  <b style="font-weight: bold;">Dress</b></a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer" onclick="data_move('earring')">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">
                  <b style="font-weight: bold;">Earring</b></a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer;" onclick="data_move('phon')">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">
                  <b style="font-weight: bold;">Phon</b></a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer" onclick="location.href='notice'">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">Notice</a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer" onclick="location.href='list'">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">Q &amp; A</a></li>
         </ul>
      </div>

      <div style="display: block; border: 0px solid #d5d5d5; border-top: 0; text-align: center;">
         <h2 style="padding: 4px 0 4px 0; font: 400 11px 'Lato',sans-serif; letter-spacing: 1.3px; text-align: center; color: #111111; text-decoration: none;">
            <span><b style="font-weight: bold;"><font style="color: rgb(255, 75, 120); font-size: medium;">TODAY VIEW</font></b></span>
         </h2>
         <ul id="index_cookie_ul" style="width: 140px; margin: 0 auto; clear: both; overflow: hidden; padding: 0px 0px 0px 2px;">
         </ul>
      </div>




      <script>
    (function(d) {
var options = {
imageUrl : 'http://ekwjd3928.diskn.com/0mnpk37r56', // 버튼아이콘 URL (첨부파일)
           size : 50, // 버튼 사이즈. PC에서는 50, 모바일에서는 56 권장
right : 80, // 버튼 위치. 화면 오른쪽에서의 거리
bottom : 20, // 버튼 위치. 화면 아래에서의 거리
circle : true, // 버튼 둥글게
shadow : true // 그림자 효과<d
}
var img = document.createElement('img');
img.src = options.imageUrl;
img.width = options.size ;
img.height = options.size;
img.style.bottom = options.bottom + 'px';
img.style.right = options.right + 'px';
img.style.position = 'fixed';
img.style.zIndex = 99999;
img.style.cursor = 'pointer';
img.style.borderRadius = options.circle ? '50%' : '';
img.style.boxShadow = options.shadow ? '0 0 4px rgba(0,0,0,.16), 0 4px 4px rgba(0,0,0,.24)' : '';
img.onclick = function(e) {
   window.open('https://open.kakao.com/o/swBlNxoc', 'talktalk', 'scrollbars=1, resizable=1, width='+window.screen.width+', height='+window.screen.height+'');
}
d.getElementsByTagName('html')[0].appendChild(img);
})(document);
</script>

<script>
    (function(d) {
var options = {
partnerId : 'wcbpes', // 톡톡 파트너계정 아이디
imageUrl : 'http://ekwjd3928.diskn.com/37BkVNVMb0', // 버튼아이콘 URL (첨부파일)
           size : 50, // 버튼 사이즈. PC에서는 50, 모바일에서는 56 권장
right : 20, // 버튼 위치. 화면 오른쪽에서의 거리
bottom : 20, // 버튼 위치. 화면 아래에서의 거리
circle : true, // 버튼 둥글게
shadow : true // 그림자 효과<d
}
var img = document.createElement('img');
img.src = options.imageUrl;
img.width = options.size ;
img.height = options.size;
img.style.bottom = options.bottom + 'px';
img.style.right = options.right + 'px';
img.style.position = 'fixed';
img.style.zIndex = 99999;
img.style.cursor = 'pointer';
img.style.borderRadius = options.circle ? '50%' : '';
img.style.boxShadow = options.shadow ? '0 0 4px rgba(0,0,0,.16), 0 4px 4px rgba(0,0,0,.24)' : '';
img.onclick = function(e) {
      window.open('https://talk.naver.com/W4UJZ0', 'talktalk', 'scrollbars=1, resizable=1, width='+window.screen.width+', height='+window.screen.height+'');
   }
d.getElementsByTagName('html')[0].appendChild(img);
})(document);
</script>
      <div style="position: absolute; width: 35px; height: 70px; top: 30%; left: -35px; margin-top: 0; cursor: pointer; z-index: 2;">
         <img style="border: none; vertical-align: top;" onclick="menubar_open()"
         src="resources/img/menubar.png">
      </div>
      </div>

   <script src="resources/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">
      var size= ${list_size}
      var ssize;
      var zxc=1;
      function number_click(age) {
         zxc=age;
         $("#start"+age).val((parseInt(age)*9)-9);
         $("#last"+age).val(parseInt(age)*9);
         $("#numbtn"+age).trigger("click");
      }
      function number_onedown() {
        
        if('${Integer.valueOf(list_last/9)-1>1}')
        number_click('${Integer.valueOf(list_last/9)-1}');
     }
      function number_oneup() {
         var m;
         if('${list_size%9>0}'=='true'){
              m='${Integer.valueOf(list_size/9)+2}';
           }else{
              m='${Integer.valueOf(list_size/9+1)}';
           }
         if(parseInt('${Integer.valueOf(list_last/9)+1}')<parseInt(m))
         number_click('${Integer.valueOf(list_last/9)+1}');
     }
      function number_up() {
         if('${list_size%9>0}'=='true'){
            number_click('${Integer.valueOf(list_size/9)+1}');
         }else{
            number_click('${Integer.valueOf(list_size/9)}');
         }
     }
      function number_down() {
         number_click(1);
     }
      var y=${list_type}
      if(size>9){
         $(function (){
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_down()'><<</div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_onedown()'><</div> ");
            if('${list_size%9>0}'=='true'){
               ssize='${Integer.valueOf(list_size/9)+1}';
           }else{
              ssize='${Integer.valueOf(list_size/9)}';
           }
            for(i=0;i<ssize;i++){
               $('#num').append("<div id='a"+(i+1)+"' style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_click("+(i+1)+")'>"+(i+1)+"</div>");
               $("#num").append("<form action='data' method='post' name='numbtn"+(i+1)+"'>"
                       +"<input type='hidden' value='${select_type}' name='type'>"
                       +"<input type='hidden' name='start' id='start"+(i+1)+"'>"
                       +"<input type='hidden' name='end' id='last"+(i+1)+"'>"
                       +"<input type='submit' style='display:none;' id='numbtn"+(i+1)+"'>"
                     +"</form>");
               if(i+1=='${Integer.valueOf(list_last/9)}'){
                  $("#a"+(i+1)).css("background-color","#383838f2");
                  $("#a"+(i+1)).css("color","#fff");
               }
            }
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='javascript:number_oneup();' style='text-decoration: none;'>></a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='javascript:number_up();' style='text-decoration: none;'>>></a></div>");
         });
      }else{
         $(function (){
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'><<</a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'><</a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>1</a></div>");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>></a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>>></a></div>");
         });
      }
      
      $(function () {
         
          c=0
          a=0
          l=${list_img}
          r=${list_product}
          u=${list_price}
          z=${list_count}
          size=${list_img.size()}
          for(i=0;i<size;i++){
             s=l[i]   //이미지
             p=r[i]   //상품이름
             uu=u[i]   //가격
             zz=z[i]   //리뷰
                a++;
                if(i%3==0) {
                   c++;
                   $('#table').append("<tr style='height:500px' id='tr"+c+"'></tr>");
                }
                $("#tr"+c).append("<td onmouseleave=style='' onmouseover=style='opacity:0.5;'>"
                +"<div style='width:312px; height:390px;margin-left:10px;background-image:url("+"\""+s+"\""+");background-size:312px 390px;' onclick='imgin("+a+")' ></div>"
                +"<div style='width:312px; overflow: hidden;'><p align='center' style='margin-top: 5px; font-family:Yu Gothic;' id='imgname"+a+"'>"+r[i]+"</p> </div>"
                   +"<p align='center' style='margin-top: 5px; font-family:Yu Gothic;' id='imgmoney"+a+"'>"+"가격 : &nbsp;"+u[i]+"</p>"
                   +"<p align='center' style='margin-top: 5px; color:gray;' >"+"리뷰 : &nbsp;"+z[i]+"</p>"
                   +"</td>");
                $("#tr"+c).append("<form action='design' name='fimg"+a+"' method='post'>"
                         +"<input type='hidden' value='"+r[i]+"' name='imgname'>"
                         +"<input type='hidden' value='"+u[i]+"' name='imgmoney'>"
                         +"<input type='hidden' value='"+y[i]+"' name='imggoods'>"
                         +"<input type='submit' style='display:none;' id='bmit"+a+"'>"
                       +"</form>")
             
          }
          
       });
    function imgin(z) {
       $("#bmit"+z).trigger("click");
    }

   </script>
<%@include file="header.jsp" %>
   
   <div align="center">
      <div style="margin-top: 150px;">
         <table id="table"></table>
      </div>
      <div id="num" style="display: flex; flex-flow:low; width: 600px; margin-top: 20px;">
      </div>
   </div>
         <form action="design" method="post" name="index_form">
      <input type="hidden" name="imggoods" id="index_imggoods_text"> <input
         type="hidden" name="imgname" id="index_imgname_text"> <input
         type="hidden" name="imgmoney" id="index_imgmoney_text">
   </form>
 <!-- top버튼 -->
<a id="backToTop" class="scrolltop" href="#">
      <i class="fas fa-chevron-circle-up"></i>
</a>
<br><br><br>
<%@include file="footer.jsp" %>

   
</body>
</html>