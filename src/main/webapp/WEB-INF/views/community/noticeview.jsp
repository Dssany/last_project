<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
<style type="text/css">
.div1 {
padding-top: 200px;
padding-bottom: 100px;
font: 400 14px 'Poppins',sans-serif;
}
  table {
    width: 60%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
 fieldset {
    border: none;
    vertical-align: top;
}


.btn{
font-family: "Roboto","Arial","Nanum Gothic","돋움","Dotum","Apple Gothic","Apple SD Gothic Neo",sans-serif;
    color: #7d7d7d;
    font-size: 12px;
    height: 27px;
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
<jsp:include page="../default/header.jsp"/>
<div class="div1" align="center">
   <table>
   <caption><font style="font: 400 30px 'Poppins',sans-serif;">Notice</font>
   
            <div>
               <c:if test="${view.num-1 > 0}">
               <input style="position: relative; left:450px;" class="btn" type="button" onclick="location.href='noticeview?num=${view.num-1}&maxSize=${maxSize}'"value="이전글">
               </c:if>
               <c:if test="${view.num < maxSize}">
               <input style="position: relative; left:450px;" class="btn" type="button" onclick="location.href='noticeview?num=${view.num+1}&maxSize=${maxSize}'"value="다음글">
               </c:if>
               <input style="position: relative; left:450px;" class="btn" type="button" onclick="location.href='notice'"value="목록">
           </div>
   </caption>
   
<!--     <colgroup> -->   
<!--             <col width="15%"> -->
<!--             <col width="35%"> -->
<!--             <col width="15%"> -->
<!--             <col width="*"> -->
<!--         </colgroup> -->
            <tr>
                <th style="size: 40;">제목</th>
                <td style="size: 100px;">
                   ${view.title}
                </td>
                <th>조회수</th>
                <td>${view.viewcnt }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>관리자</td>
                <th>작성시간</th>
                <td>${view.regdate }</td>
            </tr>
            <tr style="height:300px;">
                <th>내용</th>
                <td colspan="3" style="height: 200px; width: 700px;">
                ${view.content}
                </td>
            </tr>
    </table>
 </div>       
<jsp:include page="../default/footer.jsp"/>
</body>
</html>