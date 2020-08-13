<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

   function design(d){
      index_imgmoney_text = 0;
      $.ajax({
         url : "pricedb",
         type : "POST",
         data : {product:$("#title"+d).text()},
            success : function(data) {
              $("#index_imgmoney_text").val(data);
                $("#index_imggoods_text").val($("#type"+d).val());
                $("#index_imgname_text").val($("#title"+d).text());
               index_form.submit();
             },
             error : function() {
                alert('문제 발생');
             }
      });
   }

   function review_insert() {
      review_write.submit();
   }
   function review_search() {
      alert("서치")
      $("#type").val($("#search_key").val());
      $("#search_img").val($("#img").val());
      $("#search_text").val($("#search").val());
      search_form.submit();
   }
   function del(d) {
      if("${sessionScope.id}"==$("#name"+d).text()){
         $.ajax({
               url : "review_delect",
               type : "POST",
               data : {rno:$("#rno"+d).text()},
               success : function(data) {
                  $("tr").remove("#rtr"+d);
                  $("tr").remove("#rrtr"+d);
               },
               error : function() {
                  alert('문제 발생')
               }
         });
      }else{
         alert("본인이 올린 글만 삭제할 수 있습니다.");
      }
   }
   var s=0;
   var count =0;
   var fileimg3;
   function img_next(a,d) {
      if(a == "+"){
         count++;
         if(count == fileimg3.length){
            count=0;
         }
        
         $("#fileimg2"+d).attr("src", fileimg3[count]);
      }
      else{
         count--;
         if(count==-1)
            count=fileimg3.length-1;
         
         $("#fileimg2"+d).attr("src", fileimg3[count]);
      }
      
   }
   var count2 = 0;
   var f2;
   function img_next2(a,d){
      
      f = $("#fileimg22"+d).val();
      f2 = f.split(",");
      if(a =="+"){

         count2++;
         if(count2 == f2.length){
            count2=0;
         }
         $("#review_fileimg"+d).attr("src", f2[count2]);
      }
      if(a == "-"){
   
         count2--;
         if(count2==-1){
            count2=f2.length-1;
         }
         $("#review_fileimg"+d).attr("src", f2[count2]);
         
      }
   }
   
   function review_op(d) {
      $.ajax({
            url : "infocount_up",
            type : "POST",
            data : {rno:$("#rno"+d).text()},
            success : function(data) {
               text=$("#content"+d).val();
               fileimg=$("#fileimg"+d).val();
               fileimgs=$("#fileimgs"+d).val();
               count = 0;
               fileimg3=fileimg.split(",");
               
               if(s==0){
                  $("#infocount"+d).text(parseInt($("#infocount"+d).text())+1);
                  $("#dtr"+d).append("<textarea id='area"+d+"' readonly style='border: none; resize: none; width: 60%; height:150px; margin-top: 75px; ma'cols='1'>"+text+"</textarea>");
                 
                  if(fileimg!="''" && fileimgs!="[]"){
                    $("#dtrr"+d).append("<div style=' display: flex;flex: row; height: 150px;' id='div"+d+"'>"
                                   +"<label onclick='img_next(\"-\","+d+")'  style='font-size: 40px; cursor: pointer; padding-top: 55px;' id='inp"+d+"'> < </label>"+
                                  "<img src='"+fileimg3[count]+"' id='fileimg2"+d+"' style='width: 150px; height: 150px;'>"
                                  +"<label onclick='img_next(\"+\","+d+")' style='font-size: 40px; cursor: pointer;   padding-top: 55px;' id='dep"+d+"'> > </label></div>");
                  }
                  $("#open_btn"+d).val("▲");
                  $("#title"+d).removeAttr('disabled');
                  s++;
               }else{
                  s=0;
                  $("div").remove("#div"+d);
                  $("label").remove("#inp"+d);
                  $("label").remove("#dep"+d);
                  $("textarea").remove("#area"+d);
                  $("img").remove("#fileimg2"+d);
                  $("#open_btn"+d).val("▼");
                  $("#title"+d).attr("disabled","disabled");
               }
            },
            error : function() {
               alert('문제 발생')
            }
      });
   }
function type_ch(t) {
    $("#search_text").val($("#a_ch"+t).text());
    $("#search_img").val($("#img").val());
    search_form.submit();
}

function gogogo(){
   var tmp = $('[name=bubble]').prop('checked'); // 변수에 넣기
   if(tmp==true){
      $('#img').css('display','block');
      $('#text').css('display','none');
   }
   else{
      $('#img').css('display','none');
      $('#text').css('display','block');
   }
}



</script>

<style type="text/css">
.form {
   /*     position : absolute;       */
   top: 50%;
   left: 50%;
   height: 30px;
   padding: 30px 0;
   width: 26px;
   transform: translate3d(-50%, -50%, 0);
}

.form:before {
   content: '';
   position: absolute;
   top: 34px;
   left: 14px;
   height: 30px;
   width: 30px;
   background-color: #aab4d0;
   border-radius: 50%;
   box-shadow: 18px 0 0 #aab4d0, 31px 0 0 #aab4d0;
}

.form:after {
   content: '';
   position: absolute;
   top: 23px;
   left: 32px;
   height: 16px;
   width: 25px;
   background-color: #FFFFFF;
   border-radius: 50%;
   box-shadow: 0 36px 0 #FFFFFF;
}

.form input {
   position: absolute;
   left: -9999px;
}

.bubble {
   position: absolute;
   z-index: 2;
   top: 49px;
   left: 84px;
   height: 20px;
   width: 20px;
   transform: translate3d(-75%, -50%, 0);
   margin-left: -50px;
   background: #BBBBBB;
   border-radius: 50% 50% 50% 50%/50% 50% 50% 50%;
   border-right: 0px solid #BBBBBB;
   border-left: 0px solid #BBBBBB;
   animation: toggle-reverse 2s 1;
}

#bubble:checked+.bubble {
   animation: toggle 2s 1;
   transform: translate3d(75%, -50%, 0);
   background: #3CCC97;
}

.bubble:after {
   content: '';
   position: absolute;
   top: 50%;
   margin-top: -7px;
   margin-left: -2px;
   height: 12px;
   width: 2px;
   background: #fff;
   left: 50%;
   transform: rotate(45deg);
   border-radius: 2px;
   transition: 500ms ease all 1.25s;
}

.bubble:before {
   content: '';
   position: absolute;
   top: 50%;
   margin-top: -7px;
   margin-left: -2px;
   height: 12px;
   width: 2px;
   background: #fff;
   left: 50%;
   transform: rotate(-45deg);
   border-radius: 2px;
   transition: 500ms ease all 1.25s;
}

#bubble:checked+.bubble:after {
   content: '';
   position: absolute;
   top: 50%;
   margin-top: -5px;
   margin-left: 2px;
   height: 11px;
   width: 2px;
   background: #fff;
   left: 50%;
   transform: rotate(225deg);
   border-radius: 2px;
}

#bubble:checked+.bubble:before {
   content: '';
   position: absolute;
   top: 50%;
   margin-top: -4px;
   margin-left: -4px;
   height: 9px;
   width: 2px;
   background: #fff;
   left: 50%;
   transform: rotate(-215deg);
   border-radius: 2px;
}

@keyframes toggle { 
   0% {
   transform: translate3d(-75%, -50%, 0);
   border-right: 0 solid #BBBBBB;
   border-left: 0 solid #BBBBBB;
   background: #BBBBBB;
   border-radius: 50% 50% 50% 50%/50% 50% 50% 50%;
   height: 20px;
}

20%{
border-right: 0 solid #BBBBBB;
border-left : 0 solid #BBBBBB;
border-radius:50% 50% 50% 50% / 50% 50% 50% 50%;
transform : translate3d( -75%, -50%,0);
height: 20px;
}
40% {
border-left:0 solid #BBBBBB;
border-radius :35% 65% 65% 35% / 50% 50% 50% 50%;
height : 14px;
}
50%{
transform
:
translate3d(
0%
,
-50%
,
0
);
border-right
:
25px
solid
#BBBBBB;
border-left
:
0
solid
#BBBBBB;
background
:
#BBBBBB;
border-radius
:
50%
50%
50%
50%
/
50%
50%
50%
50%;
height
:
14px;
}
75%
{
border-left
:
25px
solid
#3CCC97;
border-color
:
#3CCC97;
background
:
#3CCC97;
border-radius
:
65%
35%
35%
65%
/
50%
50%
50%
50%;
height
:
14px;
}
100%
{
border-right
:
0
solid
#3CCC97;
border-left
:
0
solid
#3CCC97;
border-radius
:
50%
50%
50%
50%
/
50%
50%
50%
50%;
transform
:
translate3d(
75%
,
-50%
,
0
);
height:20px;
width:20px;
}
}
@keyframes toggle-reverse { 
   0% {
   transform: translate3d(75%, -50%, 0);
   background: #3CCC97;
   border-right: 0 solid #3CCC97;
   border-left: 0 solid #3CCC97;
   border-radius: 50% 50% 50% 50%/50% 50% 50% 50%;
   height: 20px;
   }
20%{
border-right:0 solid #3CCC97;
border-left : 0
solid
#3CCC97;
border-radius :50% 50% 50% 50% / 50% 50% 50% 50%;
transform :translate3d(75%,-50%,0);
height :20px;
}
40%{
border-right
:
0
solid
#3CCC97;
border-radius
:
65%
35%
35%
65%
/
50%
50%
50%
50%;
height
:
14px;
}
50%
{
transform
:
translate3d(
0%
,
-50%
,
0
);
border-left
:
25px
solid
#3CCC97;
border-right
:
0
solid
#3CCC97;
background
:
#3CCC97;
border-radius
:
50%
50%
50%
50%
/
50%
50%
50%
50%;
height
:
14px;
}
75%
{
border-right
:
25px
solid
#BBBBBB;
border-color
:
#BBBBBB;
background
:
#BBBBBB;
border-radius
:
35%
65%
65%
35%
/
50%
50%
50%
50%;
height
:
14px;
}
100%
{
border-right
:
0
solid
#BBBBBB;
border-left
:
0
solid
#BBBBBB;
border-radius
:
50%
50%
50%
50%
/
50%
50%
50%
50%;
transform
:
translate3d(
-75%
,
-50%
,
0
);
height
:
20px;
width
:
20px;
}
}
</style>

<style type="text/css">
.div1 {
   padding-top: 200px;
   padding-bottom: 100px;
   font: 400 14px 'Poppins', sans-serif;
   width: 100%;
}

table {
   width: 1000px;
   border-top: 1px solid #444444;
   border-collapse: collapse;
}

th, td {
   padding: 10px;
   text-align: center;
}

a {
   text-decoration: none;
   color: #000;
   !
   important
}

a:link {
   color: #000;
   text-decoration: none;
}

<!--
link : 방문전 링크 상태 -->a:visited {
   color: #000;
   text-decoration: none;
}

<!--
visited : 방문후 링크 상태 -->a:hover {
   color: #000;
   text-decoration: none;
}

<!--
hover : 마우스 오버했을 때 링크 상태 -->a:active {
   text-decoration: none;
   color: #000;
}

<!--
active : 클릭했을 때 링크 상태 -->fieldset {
   border: none;
   vertical-align: top;
}

</style>
<style >
*{margin:0; padding:0;}
a.button{display:inline-block; padding: 10px 20px; text-decoration:none; color:#fff; background:#000; margin:20px;}
#modal{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}
.modal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 60%;
  min-height: 30%;
  background:#fff;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 15px;
  width: 900px; 
  height: 700px; 
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#000; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}  
</style>

</head>
<body>
   <jsp:include page="../default/header.jsp" />
   <div style="display: flex; flex: row; width: 1100px; margin: 0 auto;"
      align="center">
      <div class="form"
         style="position: relative; bottom: -242px; left: 907px;">
         <input type="checkbox" name="bubble" id="bubble" onclick="gogogo()" />
         <label class="bubble" for="bubble"></label>
      </div>

      <div align="center" class="div1" style="margin-left: -30px;">
         <div id="text">
            <table>
               <caption>
                  <font style="font: 400 30px 'Poppins', sans-serif;">Review
                     <br>
                  </font>
                  <div
                     style="margin-left: 500px; display: flex; flex: row; height: 47px;">
                     <div style="margin-top: 5px;">
                        <font size="4"> | <a href="category_list?type=all">
                              All</a> | <a href="category_list?type=dress">cloth</a> | <a
                           href="category_list?type=bag">bag</a> | <a
                           href="category_list?type=earring">earring</a> | <a
                           href="category_list?type=phone">phone</a> |
                        </font> <font size="3"><label>포토리뷰</label></font>
                     </div>
                  </div>
               </caption>

               <tr>
                  <th style="width: 8%;">번호</th>
                  <th style="width: 30%;">상품명</th>
                  <th style="width: 15%;">작성자</th>
                  <th style="width: 30%;">작성일</th>
                  <th style="width: 8%;">조회수</th>
                  <th style="width: 10%;">비고</th>
                  <th></th>
               </tr>
               <c:choose>
                  <c:when test="${review_list.size()==0}">
                     <tr>
                        <td colspan="5" style="text-align: center; height: 200px;">검색
                           결과가 없습니다.<br>
                        </td>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <c:forEach var="dto" items="${review_list}">
                        <input type="hidden" id="rnoarr_text${dto.rno}" value="1">
                        <input type="hidden" id="type${dto.rno}" value="${dto.type}">
                        <input id="content${dto.rno}" type="hidden"
                           value="${dto.content}">
                        <input id="fileimg${dto.rno}" type="hidden"
                           value="${dto.fileimg}">
                        <input id="fileimgs${dto.rno}" type="hidden"
                           value="${dto.fileimg2}">
                        <tr id="rtr${dto.rno}" style="border-top: 1px solid #444444;">
                           <td style="height: 50px; width: 100px;" align="center"><c:choose>
                                 <c:when test="${dto.type.equals('earring')}">
                                    <img style="width: 50px; height: 50px;"
                                       src="resources/img/${dto.type} design/${dto.img}1.png"
                                       onclick="design(${dto.rno})">
                                 </c:when>
                                 <c:otherwise>
                                    <img style="width: 50px; height: 50px;"
                                       src="resources/img/${dto.type} design/${dto.img}.png"
                                       onclick="design(${dto.rno})">
                                 </c:otherwise>
                              </c:choose></td>
                           <td style="height: 50px; width: 100px;"><label
                              id="title${dto.rno}">${dto.img}</label></td>
                           <td style="height: 50px; width: 100px;"><label
                              id="name${dto.rno}">${dto.name}</label></td>
                           <td style="height: 50px; width: 200px;"><label
                              id="regdat${dto.rno}">${dto.regdat}</label></td>
                           <td style="height: 50px; width: 100px;"><label
                              id="infocount${dto.rno}">${dto.infocount}</label></td>
                           <td><input id="open_btn${dto.rno}" type="button"
                              onclick="review_op(${dto.rno})" value="▼"></td>
                        </tr>
                        <tr id="rrtr${dto.rno}" align="center">
                           <td id="dtr${dto.rno}" style="width: 70%;" colspan="3"></td>
                           <td id="dtrr${dto.rno}" colspan="4">
                        </tr>
                     </c:forEach>
                     <tr style="border-top: 1px solid #444444;">
                        <td style="width: 70%;" colspan="7"></td>
                     </tr>
                  </c:otherwise>
               </c:choose>
            </table>
         </div>

         <div id="img" style="display: none;">
            <table>
               <caption>
                  <font style="font: 400 30px 'Poppins', sans-serif;">Review
                     <br>
                  </font>
                  <div style="display: flex; flex: row; height: 47px;">
                     <div style="margin-top: 5px;">
                        <font size="4"> | <a href="category_list?type=all">
                              All</a> | <a href="category_list?type=dress">cloth</a> | <a
                           href="category_list?type=bag">bag</a> | <a
                           href="category_list?type=earring">earring</a> | <a
                           href="category_list?type=phone">phone</a> |
                        </font> <font size="3"><label>포토리뷰</label></font>
                     </div>
                  </div>
               </caption>
            </table>
            <c:choose>
               <c:when test="${review_list.size()==0}">
                  <tr>
                     <td colspan="5" style="text-align: center; height: 200px;">검색
                        결과가 없습니다.<br>
                     </td>
                  </tr>
               </c:when>

               <c:otherwise>
                  <div
                     style='display: flex; flex: row; margin: 0 auto; width: 700px; padding: 10px;'>
                     <div style="margin-right: 30px;">
                        <c:forEach var="dto" items="${review_list}">
                           <c:if test="${dto.rno%3==0}">
                              <div>
                                 <input id="fileimg22${dto.rno}" type="hidden"
                                    value="${dto.fileimg}"> <input
                                    id="fileimgs22${dto.rno}" type="hidden"
                                    value="${dto.fileimg2}">
                                 <c:if test="${dto.fileimg ne null}">

                                    <div style="width: 200px; height: auto;">
                                       <img src="${dto.fileimg.split(',')[0]}"
                                          style="width: 200px;" id="ssd${dto.rno}"
                                          onclick="modal(${dto.rno})">
                                    </div>
                                 </c:if>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div style="margin-right: 30px;">
                        <c:forEach var="dto" items="${review_list}">
                           <c:if test="${dto.rno%3==1}">
                              <div>
                                 <input id="fileimg22${dto.rno}" type="hidden"
                                    value="${dto.fileimg}"> <input
                                    id="fileimgs22${dto.rno}" type="hidden"
                                    value="${dto.fileimg2}">
                                 <c:if test="${dto.fileimg ne null}">

                                    <div style="width: 200px; height: auto;">
                                       <img src="${dto.fileimg.split(',')[0]}"
                                          style="width: 200px;" id="ssd${dto.rno}" onclick="modal(${dto.rno})">
                                    </div>
                                 </c:if>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div>
                        <c:forEach var="dto" items="${review_list}">
                           <c:if test="${dto.rno%3==2}">
                              <div>
                                 <input id="fileimg22${dto.rno}" type="hidden"
                                    value="${dto.fileimg}"> <input
                                    id="fileimgs22${dto.rno}" type="hidden"
                                    value="${dto.fileimg2}">
                                 <c:if test="${dto.fileimg ne null}">

                                    <div style="width: 200px; height: auto;">
                                       <img src="${dto.fileimg.split(',')[0]}"
                                          style="width: 200px;" id="ssd${dto.rno}" onclick="modal(${dto.rno})">
                                    </div>
                                 </c:if>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                  </div>
               </c:otherwise>
            </c:choose>

         </div>
         <p class="category displaynone"></p>
         <p>
            <select id="search_key" name="search_key">
               <option value="subject">제목</option>
               <option value="content">내용</option>
               <option value="member_id">아이디</option>
            </select> <input id="search" name="search" class="inputTypeText"
               placeholder="" value="" type="text" /> <label
               onclick="review_search()" onmouseover="style='cursor:pointer'">search</label>
         </p>
      </div>
   </div>

   
   <jsp:include page="../default/footer.jsp" />

   <form action="review_search" method="post" name="search_form">
      <input type="hidden" id="search_img" name="search_img"> <input
         type="hidden" id="type" name="type"> <input type="hidden"
         id="search_text" name="search_text">
   </form>

   <form action="design" method="post" name="index_form">
      <input type="hidden" name="imggoods" id="index_imggoods_text">
      <input type="hidden" name="imgname" id="index_imgname_text"> <input
         type="hidden" name="imgmoney" id="index_imgmoney_text">
   </form>

<div id="modal"></div>
  <div class="modal-con">
    <a href="javascript:;" class="close">X</a>
    <div class="con" >
       <div style="display:flex; flex: row;">
       <div style="height: 674px; width: 60%; overflow: hidden;">
          <label onclick=""  style='font-size: 40px; cursor: pointer; width: 10%; height: 10%; position: absolute; top: 44%; left:3%; z-index: 2;' id='inp' class="inp"> < </label>
          <img src="resources/img/1.jpg" id="review_fileimg" style="    height: auto; width: 129%; overflow: hidden; z-index: 1;" class="review_fileimg">
          <label onclick='' style='font-size: 40px; cursor: pointer; width: 10%; height: 10%; position: absolute; top: 46%; left: 56%; z-index: 2;' id='dep' class="dep"> > </label>
       </div>
       
          <label class="review_id" style="position: fixed; top: 4%; left: 62%;"></label> 
          <label class="review_content" style="position: fixed; top: 27%; left: 62%; width: 280px;"></label> 
          
          <div id="dd" style="position: fixed; bottom: 12px; right: 1%; border: 1px solid #d5dbe0; padding: 16px; height: 71px; width: 350px;">
          <img style="width: 50px; height: 50px; width: 50px;height: 50px;position: absolute; top: 13%; left: 3%;" src="" class="designimg">
          <label class="img" style="top: 27px; left: 69px; position: absolute;"></label>
          <img style="width:30px; top: 21px; left: 289px; position: absolute;" src="resources/img/gogo.png">
          </div>
       </div>
    </div>
  </div>


   <script>
      function modal(d){
           document.get
           f = $("#fileimg22"+d).val();
           content = $("#content"+d).val();
           id = $("#name"+d).text();
           type=$("#type"+d).val();
           title=$("#title"+d).text();
           
           
           if(type == 'earring'){
              $(".designimg").attr('src','resources/img/'+type+' design/'+title+'1.png');
           }else{
              $(".designimg").attr('src','resources/img/'+type+' design/'+title+'.png');
           }
           
           $(".img").text(title);
           $("#dd").attr('onclick', 'design('+d+')');
           
           $("#modal").fadeIn(300);
           $(".modal-con").fadeIn(300);
           $(".review_fileimg").attr('src', f.split(',')[0]);
           $(".review_fileimg").attr('id', "review_fileimg"+d);
           $(".inp").attr('id', "inp"+d);
           $(".dep").attr('id', "dep"+d);
           $("#inp"+d).attr('onclick',"img_next2(\"-\","+d+")");
           $("#dep"+d).attr('onclick',"img_next2(\"+\","+d+")");
           $(".review_content").attr('id', 'review_content'+d);
           $("#review_content"+d).text(content);
           $(".review_id").attr('id', 'review_id'+d);
           $("#review_id"+d).text(id);
           
           
      }
      
      $("#modal, .close").on('click',function(){
           $("#modal").fadeOut(300);
           $(".modal-con").fadeOut(300);
         }); 
   </script>

</body>
</html>