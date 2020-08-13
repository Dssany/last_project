<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
   rel="stylesheet">
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

.scrolltop:hover, .scrolltop:focus {
   color: #dc3545;
   transition: all 0.5s ease-in-out;
}
#li_earring{
   height:50px;
}
#li_dress{
   height:50px;
}
#li_bag{
   height:50px;
}
#li_phon{
   height:50px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   var li_type=["earring","dress","bag","phon"];
   var type=["Earring","Dress","Bag","Phon"];
   var num=0;
   $(function () {
      playAlert = setInterval(function() {
         $("#li_"+li_type[num]).animate({opacity: "0"}, 3000,function(){
            $("li").remove("#li_"+li_type[num]);
            $("#ul_type").append("<li id='li_"+li_type[num]+"' style'opacity: 1;'><a href='javascript:data_move("+li_type[num]+")' style='text-decoration: none;'>"+type[num]+"</a></li>");
            num++;
            if(num==4){ num=0; }
         });
      }, 1000);
   });
   
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

<style type="text/css">
body {
   font-size: 14px;
   color: #000;
   font-weight: 400;
}
</style>
</head>
<body>
   <!--    top버튼 -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
   <jsp:include page="header.jsp" />


   <!--    옆에 메뉴바 -->
   <div style="position: fixed; width: 160px; height: 100%; background-color: #eeeeee; top: 0; right: 0; box-shadow: 0px 0px 2px #d8d8d8;
            margin: 0px; padding: 0px; z-index: 99999; right: 0px;" id="menubar">
      <div style="float: left; width: 160px; margin: 70px 0 30px 0; padding: 0 0 px 0px 0;">
         <ul style="display: block; list-style-type: disc;">
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer;" onclick="data_move('bag')">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">
                  <b style="font-weight: bold;">Bag</b></a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer;" onclick="data_move('dress')">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">
                  <b style="font-weight: bold;">Dress</b></a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer;" onclick="data_move('earring')">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">
                  <b style="font-weight: bold;">Earring</b></a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer;" onclick="data_move('phon')">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">
                  <b style="font-weight: bold;">Phon</b></a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer;" onclick="location.href='notice'">
               <a style="font: 400 12px 'Poppins',sans-serif; letter-spacing: 0.9px; text-align: center; color: #252525; text-decoration: none;">Notice</a></li>
            <li style="padding: 8px 0px 8px 0px; text-align: center; width: 120px; margin: 10px auto; background-color: #ffffff; box-shadow: 0px 0px 2px #d8d8d8; list-style: none;cursor:pointer;" onclick="location.href='list'">
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
   

      <div style="margin-top: 200px;">
         <!--       메인부분 -->
<%--          <jsp:include page="Banner.jsp"/> --%>
         <c:import url="/Banner/"/>
         <div
            style="background-color: #fafafa; border-top: 1px solid #d5dbe0; border-bottom: 1px solid #d5dbe0; text-align: center;">
            <div
               style="display: flex; flex: row; margin: 0 auto; width: 585px; padding: 0px 10px;"
               align="center">
               <h2
                  style="padding: 40px 0px; margin-right: 10px; font-weight: lighter;">
                  "</h2>
               <h2 style="padding: 40px 0px; font-weight: lighter;">We print
                  your design on</h2>
               <h1 style="padding-left: 20px;">
                  <ul id="ul_type"
                     style='list-style: none; width: 230px; border-bottom: 10px solid #fcf753; padding-inline-start: 0px; height: 43px; overflow: hidden;'>
                     <li id="li_earring" style="opacity: 1;"><a
                        href="javascript:data_move('earring')"
                        style="text-decoration: none;">Earring</a></li>
                     <li id="li_dress" style="opacity: 1;"><a
                        href="javascript:data_move('dress')"
                        style="text-decoration: none;">Dress</a></li>
                     <li id="li_bag" style="opacity: 1;"><a
                        href="javascript:data_move('bag')"
                        style="text-decoration: none;">Bag</a></li>
                     <li id="li_phon" style="opacity: 1;"><a
                        href="javascript:data_move('phon')"
                        style="text-decoration: none;">Phon</a></li>
                  </ul>
               </h1>
               <h2
                  style="padding: 40px 0px; margin-left: 10px; font-weight: lighter;">
                  "</h2>
            </div>
         </div>


         <!--       사진밑에 뜨는것들 -->
         <div style="position: relative; display: flex; flex: row;">
            <div
               style="padding: 80px 0 32px; margin: 0 auto; width: 1320px; position: relative; text-align: center;">
               <ul style="margin: 0; padding: 0; list-style: none;">
                  <li
                     style="width: auto; display: inline-block; vertical-align: top; text-align: left; position: relative;">
                     <div
                        style="background-image: url(resources/img/Aa.png); width: 112px; height: 80px; margin: 0 24px 0 0; vertical-align: top; display: inline-block; background-size: contain; background-position: center; background-repeat: no-repeat;"></div>
                     <div
                        style="vertical-align: top; margin-top: 6px; display: inline-block;">
                        <div
                           style="font-size: 18px; line-height: 1.11; margin-bottom: 10px;">쉽고
                           빠른 만들기</div>
                        <div style="line-height: 1.43;">
                           <div>별도 프로그램 설치없이</div>
                           <div>3분 완성 만들기툴로 간편하게</div>
                        </div>
                     </div>
                  </li>
                  <li
                     style="margin: 0 90px; width: auto; display: inline-block; vertical-align: top; text-align: left; position: relative;">
                     <div
                        style="background-image: url(resources/img/Ab.png); width: 112px; height: 80px; margin: 0 24px 0 0; vertical-align: top; display: inline-block; background-size: contain; background-position: center; background-repeat: no-repeat;"></div>
                     <div
                        style="vertical-align: top; margin-top: 6px; display: inline-block;">
                        <div
                           style="font-size: 18px; line-height: 1.11; margin-bottom: 10px;">꼼꼼한
                           상품 제작</div>
                        <div style="line-height: 1.43;">
                           <div>커스텀 제작에 대한 최고의 노하우로</div>
                           <div>최고의 품질을 보장</div>
                        </div>
                     </div>
                  </li>
                  <li
                     style="width: auto; display: inline-block; vertical-align: top; text-align: left; position: relative;">
                     <div
                        style="background-image: url(resources/img/Ac.png); width: 112px; height: 80px; margin: 0 24px 0 0; vertical-align: top; display: inline-block; background-size: contain; background-position: center; background-repeat: no-repeat;"></div>
                     <div
                        style="vertical-align: top; margin-top: 6px; display: inline-block;">
                        <div
                           style="font-size: 18px; line-height: 1.11; margin-bottom: 10px;">디자인
                           무료 제공</div>
                        <div style="line-height: 1.43;">
                           <div>디자인 아이디어를 제공하는</div>
                           <div>마플만의 무료 템플릿</div>
                        </div>
                     </div>
                  </li>
               </ul>
            </div>
         </div>


         <!--       내가만든나만의상품 -->
         <div style="overflow: hidden;">
            <div style="margin: 50px 0 40px;">
               <div>
                  <h2
                     style="text-align: center; margin: 0; font-weight: bold; font-size: 32px;">내가
                     만든 나만의 상품</h2>
               </div>
            </div>
            <ul
               style="margin: 0 auto 64px; width: 1248px; padding: 0 16px; list-style: none; display: block;">
               <li
                  style="width: 590px; height: 368px; margin-right: 16px; margin-bottom: 16px; display: inline-block; vertical-align: top; position: relative; font-size: 0; background-color: #f6f6f8;">
                  <a href="javascript:data_move('dress')"> <img
                     style="height: 100%; width: 100%; border: 0;"
                     src="resources/img/banner7.jpg"></a>
               </li>
               <li
                  style="width: 590px; height: 368px; margin-right: 16px; margin-bottom: 16px; display: inline-block; vertical-align: top; position: relative; font-size: 0; background-color: #f6f6f8;">
                  <a href="javascript:data_move('bag')"> <img
                     style="height: 100%; width: 100%; border: 0;"
                     src="resources/img/banner8.jpg"></a>
               </li>
               <li
                  style="width: 590px; height: 368px; margin-right: 16px; margin-bottom: 16px; display: inline-block; vertical-align: top; position: relative; font-size: 0; background-color: #f6f6f8;">
                  <a href="javascript:data_move('earring')"> <img
                     style="height: 100%; width: 100%; border: 0;"
                     src="resources/img/banner10.jpg"></a>
               </li>
               <li
                  style="width: 590px; height: 368px; margin-right: 16px; margin-bottom: 16px; display: inline-block; vertical-align: top; position: relative; font-size: 0; background-color: #f6f6f8;">
                  <a href="javascript:data_move('phon')"> <img style="height: 100%; width: 100%; border: 0;"
                     src="resources/img/banner9_1.jpg"></a>
               </li>
            </ul>
         </div>



         <!--       밑에 옷,가방,귀걸이 -->

         <div style="padding: 80px 0; background-color: #f9fafc;">
            <div style="width: 1248px; margin: 0 auto; padding: 0 16px;">

               <!--             옷 -->
               <div style="margin-bottom: 40px;">
                  <div style="position: relative;">
                     <div>
                        <h2
                           style="text-align: left; font-size: 24px; margin: 0; margin-bottom: 24px; font-weight: 400; display: block;">
                           <a href="javascript:data_move('dress')"
                              style="text-decoration: none; color: black;">의류 커스텀</a>
                        </h2>
                     </div>
                     <a href="javascript:data_move('dress')"
                        style="position: absolute; right: 0; bottom: 0; height: 16px; color: #868e96;">전체보기</a>
                  </div>
                  <div style="position: relative;">
                     <div
                        style="overflow: visible; margin: 0 auto; position: relative; list-style: none; padding: 0; z-index: 1;">
                        <ul style="position: relative; margin: 0; padding: 0;">
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;">
                              <a href="javascript:data_move('dress')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(8)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(8)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(8)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a>
                           </li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('dress')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(9)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(9)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(9)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('dress')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(10)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(10)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(10)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('dress')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(11)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(11)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(11)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                        </ul>
                     </div>
                  </div>
               </div>

               <!--             가방 -->
               <div style="margin-bottom: 40px;">
                  <div style="position: relative;">
                     <div>
                        <h2
                           style="text-align: left; font-size: 24px; margin: 0; margin-bottom: 24px; font-weight: 400; display: block;">
                           <a href="javascript:data_move('bag')"
                              style="text-decoration: none; color: black;">가방 커스텀</a>
                        </h2>
                     </div>
                     <a href="javascript:data_move('bag')"
                        style="position: absolute; right: 0; bottom: 0; height: 16px; color: #868e96;">전체보기</a>
                  </div>
                  <div style="position: relative;">
                     <div
                        style="overflow: visible; margin: 0 auto; position: relative; list-style: none; padding: 0; z-index: 1;">
                        <ul style="position: relative; margin: 0; padding: 0;">
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;">
                              <a href="javascript:data_move('bag')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(4)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(4)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(4)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a>
                           </li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('bag')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(5)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(5)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(5)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('bag')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(6)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(6)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(6)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('bag')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(7)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(7)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(7)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                        </ul>
                     </div>
                  </div>
               </div>



               <!--             귀걸이 -->
               <div style="margin-bottom: 40px;">
                  <div style="position: relative;">
                     <div>
                        <h2
                           style="text-align: left; font-size: 24px; margin: 0; margin-bottom: 24px; font-weight: 400; display: block;">
                           <a href="javascript:data_move('earring')"
                              style="text-decoration: none; color: black;">귀걸이 커스텀</a>
                        </h2>
                     </div>
                     <a href="javascript:data_move('earring')"
                        style="position: absolute; right: 0; bottom: 0; height: 16px; color: #868e96;">전체보기</a>
                  </div>
                  <div style="position: relative;">
                     <div
                        style="overflow: visible; margin: 0 auto; position: relative; list-style: none; padding: 0; z-index: 1;">
                        <ul style="position: relative; margin: 0; padding: 0;">
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;">
                              <a href="javascript:data_move('earring')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(0)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(0)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(0)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a>
                           </li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('earring')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(1)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(1)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(1)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('earring')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(2)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(2)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(2)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('earring')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(3)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(3)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(3)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                        </ul>
                     </div>
                  </div>
               </div>


<!--                         폰케이스 -->
               <div style="margin-bottom: 40px;">
                  <div style="position: relative;">
                     <div>
                        <h2
                           style="text-align: left; font-size: 24px; margin: 0; margin-bottom: 24px; font-weight: 400; display: block;">
                           <a href="javascript:data_move('phon')"
                              style="text-decoration: none; color: black;">폰케이스 커스텀</a>
                        </h2>
                     </div>
                     <a href="javascript:data_move('phon')"
                        style="position: absolute; right: 0; bottom: 0; height: 16px; color: #868e96;">전체보기</a>
                  </div>
                  <div style="position: relative;">
                     <div
                        style="overflow: visible; margin: 0 auto; position: relative; list-style: none; padding: 0; z-index: 1;">
                        <ul style="position: relative; margin: 0; padding: 0;">
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;">
                              <a href="javascript:data_move('phon')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(12)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(12)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(12)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a>
                           </li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('phon')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(13)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(13)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(13)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('phon')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(14)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(14)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(14)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                           <li
                              style="margin-left: 0; display: inline-block; vertical-align: top; width: 300px; height: 350px; overflow: hidden; background-color: #fff;"><a
                              href="javascript:data_move('phon')"
                              style="text-decoration: none; color: #000;">
                                 <div
                                    style="width: 300px; height: 300px; font-size: 0; position: relative;">
                                    <img
                                       style="height: 100%; opacity: 1; border: 0; width: 300px;"
                                       src="${img.get(15)}">
                                 </div>
                                 <div
                                    style="height: 50px; margin-left: 5px; position: relative;">
                                    <div
                                       style="margin-top: 5px; left: 0; bottom: 48px; font-size: 15px; font-weight: bold;">${product.get(15)}</div>
                                    <div
                                       style="left: 0; bottom: 24px; height: 14px; color: #868e96;">
                                       <fmt:formatNumber value="${price.get(15)}" pattern="#,###" />
                                       원
                                    </div>
                                 </div>
                           </a></li>
                        </ul>
                     </div>
                  </div>
               </div>


            </div>
         </div>


         <!--    끝 -->
      </div>


      <!-- top버튼 -->
      <a id="backToTop" class="scrolltop" href="#"> <i
         class="fas fa-chevron-circle-up"></i>
      </a>
      <form action="design" method="post" name="index_form">
      <input type="hidden" name="imggoods" id="index_imggoods_text"> <input
         type="hidden" name="imgname" id="index_imgname_text"> <input
         type="hidden" name="imgmoney" id="index_imgmoney_text">
   </form>

      <jsp:include page="footer.jsp" />
</body>
</html>