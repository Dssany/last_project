<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
   href="resources/css/util.css?after">
<link rel="stylesheet" type="text/css"
   href="resources/css/main.css?after">
<link
   href="https://fonts.googleapis.com/css?family=Roboto:400,700|Nunito:400,120"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="resources/css/demo.css?aaa" />
<link rel="stylesheet" type="text/css"
   href="resources/css/style-adsila.css?aaa" />
<link rel="stylesheet" type="text/css" href="resources/pater/pater.css" />
<!-- <script src="resources/jquery-3.2.1.min.js"></script> -->
<script>
   document.documentElement.className = "js";
   var supportsCssVars = function() {
      var e, t = document.createElement("style");
      return t.innerHTML = "root: { --tmp-var: bold; }", document.head
            .appendChild(t),
            e = !!(window.CSS && window.CSS.supports && window.CSS
                  .supports("font-weight", "var(--tmp-var)")),
            t.parentNode.removeChild(t), e
   };
   supportsCssVars()
         || alert("Please view this demo in a modern browser that supports CSS Variables.");
</script>
<script type="text/javascript">
   function data_move(d) {
      $("#index_type_text2").val(d);
      $("#index_type_text_start2").val(0);
      $("#index_type_text_end2").val(9);
      index_form2.submit();
   }
   function ad(d) {
      $("form[name=header_form]").attr("action",d);
      header_form.submit();
   }
</script>

<script type="text/javascript">
   $(function() {
      $.ajax({
         url : "header_review",
         type : "POST",
         data : "0",
         success : function(data) {
            $("#review_text").val(data);
         },
         error : function() {
            alert('review 발생')
         }
      });
   })
   function review_in() {
      review_form.submit();
   }
</script>
<style type="text/css">
.dropdown {
   position: relative;
   display: inline-block;
}

.dropdown-content {
   display: none;
   position: absolute;
/*    background-color: #f1f1f1; */
   min-width: 80px;
   min-height: 95px;
   text-align: center;
   left:-10px;
   top:40px;
/*    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2); */
   font-weight: normal;
   font-size: 20px;
   font-family: Yu Gothic; font-weight: lighter;
   z-index: 1;
}

.dropdown-content a:hover {
/*    background-color: #ddd; */
}

.dropdown:hover .dropdown-content {
   display: block;
}

.dropdown:hover .dropbtn {
   
}



.dropdown2 {
   position: relative;
   display: inline-block;
}

.dropdown-content2 {
   display: none;
   position: absolute;
/*    background-color: #f1f1f1; */
   min-width: 80px;
   min-height: 95px;
   text-align: center;
   top:40px;
   left: -40px;
/*    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2); */
   font-weight: normal;
   font-size: 20px;
   font-family: Yu Gothic; font-weight: lighter;
   z-index: 1;
}

.dropdown-content2 a:hover {
/*    background-color: #ddd; */
}

.dropdown2:hover .dropdown-content2 {
   display: block;
}

.dropdown1:hover .dropbtn1 {
   
}

.dropdown1 {
   position: relative;
   display: inline-block;
}

.dropdown-content1 {
   display: none;
   position: absolute;
/*    background-color: #f1f1f1; */
   min-width: 80px;
   min-height: 95px;
   text-align: center;
   right: 0px;
   top:40px;
/*    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2); */
   font-weight: normal;
   font-size: 20px;
   font-family: 윤고딕;
   z-index: 1;
}

.dropdown-content1 a:hover {
/*    background-color: #ddd; */
}

.dropdown1:hover .dropdown-content1 {
/*    display: block; */
}

.dropdown1:hover .dropbtn1 {
   
}

.dropdown0 {
   position: relative;
   display: inline-block;
}

.dropdown-content0 {
   display: none;
   position: absolute;
/*    background-color: #f1f1f1; */
   min-width: 80px;
   min-height: 95px;
   text-align: center;
   left:30px;
   top:40px;
/*    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2); */
   font-weight: normal;
   font-size: 20px;
   font-family: Yu Gothic; font-weight: lighter;
   z-index: 1;
   
}

.dropdown-content0 a:hover {
/*    background-color: #ddd; */
}

.dropdown0:hover .dropdown-content0 {
   display: block;
}

.dropdown0:hover .dropbtn1 {
   
}

</style>
<script type="text/javascript">
   function login() {
      location.href = 'login';
   }

   function cart() {
      location.href = 'cart';
   }
</script>
</head>

<body class="demo-adsila">
   <div id="fixed" >
      <div>
         <h1>
            <a href="index" style="color: black;">
            <img src="resources/img/MAKE1.PNG" style="width:200px; height: 69PX; color:#F6F6F6;">
            </a>
         </h1>
      </div>
      <div style="margin-right: 150px;" class="content" >
         <nav class="menu menu--adsila">
            <div class="dropdown">
               <span class="menu__item"><a class="menu__item-name" href="#"
                  style="color: black; font-size: 20px; font-family: Yu Gothic; font-weight: lighter; margin-right: 15px;">SHOP</a></span>
               <div class="dropdown-content">
                  <span class="menu__item"><a class="menu__item-name" href="#" style="color: black;" onclick="data_move('all')">ALL</a></span>
                  <span class="menu__item"><a class="menu__item-name" href="#" style="color: black;" onclick="data_move('earring')">EARRING</a></span>
                  <span class="menu__item"><a class="menu__item-name" href="#" style="color: black;" onclick="data_move('dress')">DRESS</a></span>
                  <span class="menu__item"><a class="menu__item-name" href="#" style="color: black;" onclick="data_move('bag')">BAG</a></span>
                  <span class="menu__item"><a class="menu__item-name" href="#" style="color: black;" onclick="data_move('phon')">PHON</a></span>
               </div>
            </div>
<!--                         <span><a href="#" style="color: black;">COLLECTION</a></span>&nbsp;&nbsp; -->
            <!--             <span><a href="#" style="color: black;">PROGECT</a></span>&nbsp;&nbsp; -->
            <!--             <span><a href="#" style="color: black;">STOCKIST</a></span>&nbsp;&nbsp; -->

            <div class="dropdown0">
               <span class="dropbtn0 menu__item"><a class="menu__item-name"
                  href="#"
                  style="color: black; font-size: 20px; font-family: Yu Gothic; font-weight: lighter; margin-right: 15px;">COMMUNITY</a></span>
               <div class="dropdown-content0">
                  <span class="menu__item"><a class="menu__item-name" href="javascript:ad('notice')" style="color: black;">NOTICE</a></span>
                  <span class="menu__item"><a class="menu__item-name" href="javascript:ad('list')" style="color: black;">Q / A</a></span>
               </div>
            </div>
            <div class="dropdown0">
               <span class="dropbtn0 menu__item"><a class="menu__item-name"
                  href="helpCenter?type=order_pay"
                  style="color: black; font-size: 20px; font-family: Yu Gothic; font-weight: lighter; margin-right: 15px;">HELP</a></span>
            </div>
            <div class="dropdown1">
            <span class="menu__item">
               <a class="menu__item-name"
                  href="javascript:review_in()"
                  style="color: black; font-size: 20px; font-family: Yu Gothic; font-weight: lighter; margin-right: 15px;">REVIEW</a>
               </span>
               </div>


            <div class="dropdown2">
               <c:choose>
                  <c:when test="${sessionScope.id eq null}">
                     <img src="resources/images/icons/login.png"
                        style="width: 40px; height: 40px; margin-bottom: -12px; margin-right: 10px;"
                        onclick="login()">
                  </c:when>
                  <c:otherwise>
                     <span class="dropbtn2"><img
                        src="resources/images/icons/login.png"
                        style="width: 40px; height: 40px; margin-bottom: -12px; margin-right: 10px;"></span>
                     <div class="dropdown-content2">
                        <span class="menu__item"><a class="menu__item-name" href="myinfo" style="color: black;">MY INFO</a></span>
                        <span class="menu__item"><a class="menu__item-name" href="orderList" style="color: black;">ORDERLIST</a></span>
                        <span class="menu__item"><a class="menu__item-name" href="logout" style="color: black;">LOGOUT</a></span>
                        <c:if test="${sessionScope.id.split('_')[0] eq '/admin/' }">
                           <span class="menu__item"><a class="menu__item-name" href="adminindex" style="color: black;">ADMIN</a></span>
                        </c:if>
                     </div>
                  </c:otherwise>
           
               </c:choose>
            </div>


            <c:choose>
               <c:when test="${sessionScope.id eq null}">
                  <img src="resources/images/icons/cart.png"
                     style="width: 28px; height: 28px; margin-bottom: -5px;"
                     onclick="login()">
               </c:when>
               <c:otherwise>
                  <img src="resources/images/icons/cart.png"
                     style="width: 28px; height: 28px; margin-bottom: -5px;"
                     onclick="cart()">
               </c:otherwise>
            </c:choose>
         </nav>
      </div>
   </div>

   <form action="review" method="post" name="review_form">
      <input type="hidden" id="review_text" name="review_text">
   </form>

   <form action="data" method="post" name="index_form2">
      <input type="hidden" name="type" id="index_type_text2"> <input
         type="hidden" name="start" id="index_type_text_start2"> <input
         type="hidden" name="end" id="index_type_text_end2">
   </form>
   <form name="header_form" method="post">
   <input type="hidden" id="adminHeader_form_start" name="start" value="1">
   <input type="hidden" id="adminHeader_form_end" name="end" value="10">
</form>

   <script src="resources/js/demo.js"></script>
</body>
</html>