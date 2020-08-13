<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <!--===============================================================================================-->
   <link rel="icon" type="image/png" href="resources/TableCSS/images/icons/favicon.ico" />
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="resources/TableCSS/vendor/bootstrap/css/bootstrap.min.css">
   <!--===============================================================================================-->
   <!--    <link rel="stylesheet" type="text/css" href="resources/TableCSS/fonts/font-awesome-4.7.0/css/font-awesome.min.css"> -->
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="resources/TableCSS/vendor/animate/animate.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="resources/TableCSS/vendor/select2/select2.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="resources/TableCSS/vendor/perfect-scrollbar/perfect-scrollbar.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="resources/TableCSS/css/util.css">
   <link rel="stylesheet" type="text/css" href="resources/TableCSS/css/main.css?a">
   <!--===============================================================================================-->
   <title>Insert title here</title>
   <style type="text/css">
     
      .div1 {
      font: 400 14px "Roboto","Arial","Nanum Gothic","돋움","Dotum","Apple Gothic","Apple SD Gothic Neo",sans-serif;
         padding-top: 100px;
/*          padding-bottom: 100px; */
      }

      .div2 {
         padding-top: 40px;
      }

      body,html{
      font-family: "Roboto","Arial","Nanum Gothic","돋움","Dotum","Apple Gothic","Apple SD Gothic Neo",sans-serif;
      }

      .form-group {
         width: 90%;
         margin: 10px auto;
         display: flex;
         justify-content: center;
         align-items: center;
      }

      .replycount {
         color: red;
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
    float:right;
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

   <script src="resources/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">

      var size = ${ list_size }
      var ssize;
      var zxc = 1;
      function number_click(age) {
         zxc = age;
         if ($("#search_result_init").val() == "") {
            $("#start" + age).val((parseInt(age) * 10) - 9);
            $("#last" + age).val(parseInt(age) * 10);
            $("#numbtn" + age).trigger("click");
         } else {
            $("#search_result").val($("#search_result_init").val());
            $("#type_result").val($("#type_result_init").val());
            $("#start_result").val((parseInt(age) * 10) - 9);
            $("#end_result").val(parseInt(age) * 10);
            list_form.submit();
         }

      }
      function number_onedown() {

         if ('${Integer.valueOf(list_last/10)-1>1}')
            number_click('${Integer.valueOf(list_last/10)-1}');
      }
      function number_oneup() {
         var m;
         if ('${list_size%10>0}' == 'true') {
            m = '${Integer.valueOf(list_size/10)+2}';
         } else {
            m = '${Integer.valueOf(list_size/10+1)}';
         }
         if (parseInt('${Integer.valueOf(list_last/10)+1}') < parseInt(m))
            number_click('${Integer.valueOf(list_last/10)+1}');
      }
      function number_up() {
         if ('${list_size%10>0}' == 'true') {
            number_click('${Integer.valueOf(list_size/10)+1}');
         } else {
            number_click('${Integer.valueOf(list_size/10)}');
         }
      }
      function number_down() {
         number_click(1);
      }
      if (size > 10) {
         $(function () {
            $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_down()'><<</div> ");
            $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_onedown()'><</div> ");
            if ('${list_size%10>0}' == 'true') {
               ssize = '${Integer.valueOf(list_size/10)+1}';
            } else {
               ssize = '${Integer.valueOf(list_size/10)}';
            }
            for (i = 0; i < ssize; i++) {
               $('#num_2').append("<div id='a" + (i + 1) + "' style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer; margin-left:10px;' onclick='number_click(" + (i + 1) + ")'>" + (i + 1) + "</div>");
               $("#num_2").append("<form action='list' method='post' name='numbtn" + (i + 1) + "'>"
                  + "<input type='hidden' name='start' id='start" + (i + 1) + "'>"
                  + "<input type='hidden' name='end' id='last" + (i + 1) + "'>"
                  + "<input type='submit' style='display:none;' id='numbtn" + (i + 1) + "'>"
                  + "</form>");
               if (i + 1 == '${Integer.valueOf(list_last/10)}') {
                  $("#a" + (i + 1)).css("background-color", "#383838f2");
                  $("#a" + (i + 1)).css("color", "#fff");
               }
            }
            $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='javascript:number_oneup();' style='text-decoration: none;'>></a></div> ");
            $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='javascript:number_up();' style='text-decoration: none;'>>></a></div>");
         });
      } else {
         $(function () {
            $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'><<</a></div> ");
            $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'><</a></div> ");
            $('#num_2').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>1</a></div>");
            $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>></a></div> ");
            $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>>></a></div>");
         });
      }

      function title_search() {

         alert($("#searchType").val());
         //타입 입력
         $("#type_result").val($("#searchType").val());

         if ($("#searchType").val() == "title") {
            $("#search_result").val($("#keyword").val());
            alert($("#search_result").val());
            list_form.submit();
         } else if ($("#searchType").val() == "Content") {
            $("#search_result").val($("#keyword").val());
            alert($("#search_result").val());
            list_form.submit();
         } else {
            $("#search_result").val($("#keyword").val());
            alert($("#search_result").val());
            list_form.submit();
         }
      }
      function totle_click(d,w) {
         if('${sessionScope.id}'==w || w.split("_")[0]=="/admin/" || '${sessionScope.id}'.split("_")[0]=='/admin/'){
         ch = d;
         $("#bno_result").val(d);
         bno_form.submit();
         }
         else{
            alert("본인 작성글만 확인할 수 있습니다.")
         }
      }
   </script>
   <jsp:include page="../default/header.jsp" />
   <div class="limiter">
      <div class="container-table100">
         <div class="wrap-table100">
            <div class="table">
               <div align="center">
                  <font style="font: 400 30px 'Poppins',sans-serif;">Q & A</font>
               </div>
               <table class="table">

                  <tr class="header">
                     <th class="cell">번호</th>
                     <th class="cell">제목</th>
                     <th class="cell">작성자</th>
                     <th class="cell">작성일</th>
                     <th class="cell">조회수</th>
                  </tr>
                  <c:forEach var="adminList" items="${listAll}">
                     <tr class="row" data-title="번호">

                        <c:choose>
                           <c:when test="${adminList.writer=='/admin/'}">
                              <td class="cell" data-title="번호"><img src="https://attrangs.co.kr/asset/img/board/icon_notice.png"></td>
                           </c:when>
                           <c:otherwise>
                              <td class="cell" data-title="번호">${adminList.bno}</td>
                           </c:otherwise>
                        </c:choose>
                        <td class="cell" data-title="제목"><a class="title" onclick="totle_click('${adminList.bno}','${adminList.writer}')"> ${adminList.title} 
                        <label class="replycount"> [${adminList.replycount}] </label>
                        </a> </td>
                        <c:choose>
                           <c:when test="${adminList.writer.split('_')[0]=='/admin/'}">
                              <td class="cell" data-title="작성자">관리자</td>
                           </c:when>
                           <c:otherwise>
                              <td class="cell" data-title="작성자">${adminList.writer}</td>
                           </c:otherwise>
                        </c:choose>
                        <td class="cell" data-title="작성일">${adminList.regdate }</td>
                        <td class="cell" data-title="조회수" >${adminList.viewcnt }</td>
                     </tr>
                  </c:forEach>
					<tr>
						<td colspan="5"><button type="button" onclick="location.href='write'"class="btn">글 작성</button></td>
						
					</tr>
               </table>
               
            </div>
            
         </div>
      </div>
   </div>
	
      <!-- 검색 form -->
      <div id="search" class="div2">
         <!-- search{s} -->
         <div class="form-group justify-content-center" style="padding-bottom: 10px;">
            <div class="w100" style="padding-right:10px;">
               <select class="form-control form-control-sm" name="searchType" id="searchType">
                  <option class="ooop" value="title">제목</option>
                  <option class="ooop" value="Content">본문</option>
                  <option class="ooop" value="reg_id">작성자</option>
               </select>
            </div>
           <div class="w300" style="padding-right: 10px">
               <input type="text" class="form-control form-control-sm"
                  name="keyword" id="keyword">
            </div>
            <div>
               <img style="vertical-align: middle; margin:0; padding:0; width: 30px; height: 28px; cursor: pointer;"
                  src="resources/img/scarchhhh.png" name="btnSearch" id="btnSearch" onclick="title_search()">
            </div>
         </div>
         <!-- search{e} -->
      </div>
      <div align="center">
         <div style="display: flex; flex-flow:low; margin-bottom: 50px; justify-content: center;align-items: center;"
            align="center">
            <div id="num_1" style="display: flex; flex-flow:low; width: 100px;"></div>
            <div id="num_2" style="display: flex; flex-flow:low;"></div>
            <div id="num_3" style="display: flex; flex-flow:low; width: 100px;"></div>
         </div>
      </div>
   









   <jsp:include page="../default/footer.jsp" />





   <form action="view" name="bno_form" method="post">
      <input type="hidden" name="bno" id="bno_result">
   </form>
   <form action="search" name="list_form" method="post">
      <input type="hidden" name="search_result" id="search_result">
      <input type="hidden" name="type_result" id="type_result">
      <input type='hidden' name='start_result' id='start_result' value="1">
      <input type='hidden' name='end_result' id='end_result' value="10">
   </form>
   <input type="hidden" value="${list_search_result}" id="search_result_init">
   <input type="hidden" value="${list_type_result}" id="type_result_init">




   <!--===============================================================================================-->
   <script src="resources/TableCSS/vendor/jquery/jquery-3.2.1.min.js"></script>
   <!--===============================================================================================-->
   <script src="resources/TableCSS/vendor/bootstrap/js/popper.js"></script>
   <script src="resources/TableCSS/vendor/bootstrap/js/bootstrap.min.js"></script>
   <!--===============================================================================================-->
   <script src="resources/TableCSS/vendor/select2/select2.min.js"></script>
   <!--===============================================================================================-->
   <script src="resources/TableCSS/js/main.js"></script>


</body>

</html>