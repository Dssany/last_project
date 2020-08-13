<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
   function review(d,b) {
      $("#review_img").val($("#review_img"+d).val());
      $("#type").val($("#type"+d).val());
      $("#pay_rno").val($("#pay_rno"+d).val());
      $("#in_ch").val(b);
      orderlist_form.submit();
   }
</script>
<style type="text/css">
.btn{
font-family: "Roboto","Arial","Nanum Gothic","돋움","Dotum","Apple Gothic","Apple SD Gothic Neo",sans-serif;
    color: #7d7d7d;
    font-size: 12px;
    height: 35px;
    line-height: 27px;
    cursor: pointer;
    outline: none;
    align-items: right;
 
    padding: 0px 8px 0 9px;
    border: 1px solid #e0e0e0;
    background: #fafafa;
    margin: 0;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    display: inline-block;
    -webkit-border-radius: 6px;
    -moz-border-radius: 6px;
    border-radius: 6px;
    -webkit-border-radius: 6px 6px 6px 6px;
    -moz-border-radius: 6px 6px 6px 6px;
    border-radius: 6px 6px 6px 6px;
   
}
.btn:hover{
background: #7d7d7d;
   color:white;
   transition: all 0.12s ease-in-out;
}
</style>

</head>
<body>
   <%@include file="../default/header.jsp"%>
   <div style="padding-top: 120px;" align="center">
      <font size="4"><b>ORDER LIST</b></font>
         <table style="margin-top: 50px; border-top: 1px solid black;" >
            <tr>
               <th style="width: 100px; font-size: 20px;">사진</th>
               <th style="width: 300px; font-size: 20px;">상품명</th>
               <th style="width: 100px; font-size: 20px;">가격</th>
               <th style="width: 100px; font-size: 20px;">수량</th>
               <th style="width: 100px; font-size: 20px;">결제결과</th>
               <th style="width: 100px; font-size: 20px;">결제날짜</th>
            </tr>

            <c:forEach var="dto" items="${order_list}">
               
               <tr style="border-top: 1px solid #d5dbe0; border-bottom: 1px solid #d5dbe0;">
                  <td style="height: 50px; width: 200px;" align="center"><img
                     style="height: 100px; width: 100px;" src="${dto.img}" ></td>
                  <td style="height: 50px;"><label>${dto.product}</label>
                     
                     <input type="hidden" id="review_img${dto.rno}" value="${dto.product}">
                  </td>
                  <td style="height: 50px; width: 200px; margin-left: 30px;">단가 : <label>${dto.price}</label><br>
                     총합 : <label>${dto.price * dto.count}</label>
                  </td>
                  <th style="height: 50px; width: 200px; font-weight: normal;">
                  <label id="cancelok">${dto.count}</label>
                  <c:choose>
                     <c:when test="${dto.review_ch==0}">
                        <input type="button" class="btn" onclick="review('${dto.rno}','제품리뷰')" value="제품리뷰">
                     </c:when>
                     <c:otherwise>
                        <input type="button" class="btn" onclick="review('${dto.rno}','리뷰수정')" value="리뷰수정">
                     </c:otherwise>
                  </c:choose>
                  
                  </th>
                  <th style="height: 50px; width: 200px; font-weight: normal;"><label id="cancelok">${dto.status}</label></th>
                  <th style="height: 50px; width: 200px; font-weight: normal;"><label id="cancelok">${dto.day}</label></th>

               </tr>
               <input type="hidden" id="pay_rno${dto.rno}" value="${dto.rno}">
               <input type="hidden" value="${dto.type}" id="type${dto.rno}">
            </c:forEach>
         </table>
   </div>
   <form action="review_write" method="post" name="orderlist_form">
      <input type="hidden" name="type" id="type">
      <input type="hidden" name="review_img" id="review_img">
      <input type="hidden" name="pay_rno" id="pay_rno">
      <input type="hidden" name="in_ch" id="in_ch">
   </form>
</body>
</html>