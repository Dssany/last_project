<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/plugins/images/favicon.png">
    <title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS -->
    <link href="resources/adbootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="resources/plugins/bower_components/toast-master/css/jquery.toast.css?a" rel="stylesheet">
    <!-- morris CSS -->
    <link href="resources/plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- chartist CSS -->
<!--     <link href="resources/plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet"> -->
<!--     <link href="resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet"> -->
    <!-- animation CSS -->
    <link href="resources/adcss/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="resources/adcss/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="resources/adcss/colors/default.css" id="theme" rel="stylesheet">
<title>(관리자)게시판 관리</title>
<style type="text/css">
.div1 {
padding-bottom: 50px;
}
.div2{
padding-top: 40px;
}
</style>
<style type="text/css">
.table {
      border-collapse: collapse;
      border-top: 3px solid #168;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
function ad(d) {
      $("form[name=adminHeader_form]").attr("action",d);
      adminHeader_form.submit();
   }
</script>
<script type="text/javascript">
$(document).ready(function() {
   $("#Delbutton").click(function(){ 
      var rowData = new Array(); 
        var tdArr = new Array();
        var checkbox = $("input[name=checkBtn]:checked");

   checkbox.each(function(i) {
        var tr = checkbox.parent().parent().eq(i);
        var td = tr.children();
       
        rowData.push(tr.text());
        var userid = td.eq(1).text()+" ";
        tdArr.push(userid);
                
          });
      var str = ""
      for(var i=0; i<tdArr.length; i++) {
         console.log(tdArr[i])
         str +=tdArr[i]
      }
      
      Swal.fire({
           title: '게시글을 삭제하시겠습니까?',
           text: '선택하신 게시물 : '+str+'를 정말 삭제하시겠습니까?',
           icon: 'warning',
           showCancelButton: true,
           confirmButtonColor: '#3085d6',
           cancelButtonColor: '#d33',
           confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
           if (result.value) {
             Swal.fire({
                title:'Deleted!',
                text: '성공적으로 삭제되었습니다!',
                icon: 'success',
               preConfirm:function(){
                    location.href="DelBoard?num="+str
                }
             });
           }
         });
   });

});
   

</script>
<script type="text/javascript">
var size= '${list_size}';
var ssize;
var zxc=1;
function number_click(age) {
   zxc=age;
      if($("#search_result_init").val()==""){
           $("#start"+age).val((parseInt(age)*10)-9);
           $("#last"+age).val(parseInt(age)*10);
           $("#numbtn"+age).trigger("click");
        }else{
           $("#search_result").val($("#search_result_init").val());
           $("#type_result").val($("#type_result_init").val());
           $("#start_result").val((parseInt(age)*10)-9);
           $("#end_result").val(parseInt(age)*10);
           list_form.submit();
        }
}
function number_onedown() {
    
    if('${Integer.valueOf(list_last/10)-1>1}')
    number_click('${Integer.valueOf(list_last/10)-1}');
}
function number_oneup() {
     var m;
     if('${list_size%10>0}'=='true'){
        m='${Integer.valueOf(list_size/10)+2}';
     }else{
        m='${Integer.valueOf(list_size/10+1)}';
     }
     if(parseInt('${Integer.valueOf(list_last/10)+1}')<parseInt(m))
     number_click('${Integer.valueOf(list_last/10)+1}');
}
function number_up() {
     if('${list_size%10>0}'=='true'){
        number_click('${Integer.valueOf(list_size/10)+1}');
     }else{
        number_click('${Integer.valueOf(list_size/10)}');
     }
}
function number_down() {
     number_click(1);
}
if(size>10){
      $(function (){
            $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_down()'><<</div> ");
            $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_onedown()'><</div> ");
            if('${list_size%10>0}'=='true'){
               ssize='${Integer.valueOf(list_size/10)+1}';
           }else{
              ssize='${Integer.valueOf(list_size/10)}';
           }
            for(i=0;i<ssize;i++){
               $('#num_2').append("<div id='a"+(i+1)+"' style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer; margin-left:10px;' onclick='number_click("+(i+1)+")'>"+(i+1)+"</div>");
            $("#num_2").append("<form action='accart' method='post' name='numbtn"+(i+1)+"'>"
                    +"<input type='hidden' name='start' id='start"+(i+1)+"'>"
                    +"<input type='hidden' name='end' id='last"+(i+1)+"'>"
                    +"<input type='submit' style='display:none;' id='numbtn"+(i+1)+"'>"
                  +"</form>");
            if(i+1=='${Integer.valueOf(list_last/10)}'){
               $("#a"+(i+1)).css("background-color","#383838f2");
               $("#a"+(i+1)).css("color","#fff");
            }
         }
         $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='javascript:number_oneup();' style='text-decoration: none;'>></a></div> ");
         $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='javascript:number_up();' style='text-decoration: none;'>>></a></div>");
      });
   }else{
      $(function (){
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
    
    if($("#searchType").val()=="title"){
       $("#search_result").val($("#keyword").val());
       alert($("#search_result").val());
       list_form.submit();
    }else if($("#searchType").val()=="Content"){
       $("#search_result").val($("#keyword").val());
       alert($("#search_result").val());
       list_form.submit();
    }else{
       $("#search_result").val($("#keyword").val());
       alert($("#search_result").val());
       list_form.submit();
    }
 }
 

   
   $(function() {
      var ta=0;
      for(i=1;i<'${paylist.get(paylist.size()-1).rno+1}';i++){
         if($("#prict_text"+i).text()!=""){
            ta+=parseInt($("#prict_text"+i).text());
         }
      }
      $("#total").text(ta)
   })
</script>
</head>
<body class="fix-header">
<c:if test="${sessionScope.id.split('_')[0] ne '/admin/' }">
<script type="text/javascript">
   alert("관리자만 접근가능합니다")
   location.href="index"
</script>
</c:if>
    <!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                <div class="top-left-part">
                    <!-- Logo -->
                    <a href="index" style="color: black;">
                     <img class="img1" src="resources/img/MAKE1.PNG" style="width:200px; height: 69PX; color:#F6F6F6;">
                 </a>  
                </div>
                <!-- /Logo -->
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        <a class="nav-toggler open-close waves-effect waves-light hidden-md hidden-lg" href="javascript:void(0)"><i class="fa fa-bars"></i></a>
                    </li>
                    <li>
                        <a class="profile-pic" href="#"> <img src="https://image.flaticon.com/icons/png/512/1421/1421222.png" alt="user-img" width="36" class="img-circle"><b class="hidden-xs">${sessionScope.id }</b></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- End Top Navigation -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav slimscrollsidebar">
                <div class="sidebar-head">
                    <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span class="hide-menu">Navigation</span></h3>
                </div>
                <ul class="nav" id="side-menu">
                     <li style="padding: 70px 0 0;">
                        <a href="adminindex" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>관리자 메인</a>
                    </li>
                    <li>
                        <a href="javascript:ad('acsearch');" class="waves-effect"><i class="fa fa-user fa-fw" aria-hidden="true"></i>계정 관리</a>
                    </li>
                    <li>
                        <a href="javascript:ad('acboard');" class="waves-effect"><i class="fa fa-user fa-fw" aria-hidden="true"></i>Q & A 관리</a>
                    </li>
                    <li>
                        <a href="javascript:ad('acnotice');" class="waves-effect"><i class="fa fa-table fa-fw" aria-hidden="true"></i>공지사항 관리</a>
                    </li>
                    <li>
                        <a href="javascript:ad('QuantityManage');" class="waves-effect"><i class="fa fa-font fa-fw" aria-hidden="true"></i>재고 관리</a>
                    </li>
                    <li>
                        <a href="javascript:ad('accart');" class="waves-effect"><i class="fa fa-globe fa-fw" aria-hidden="true"></i>구매내역 관리</a>
                    </li>
                    <li>
                        <a href="index" class="waves-effect"><i class="fa fa-columns fa-fw" aria-hidden="true"></i>메인으로 나가기</a>
                    </li>

                </ul>
                
            </div>
            
        </div>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">admin page</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                        <div class="white-box">
                            <h3 class="box-title">BUY MANAGE</h3>
<!-- 여기서 부터 내용 -->
               <div align="center" class="div1">
               
   <table border="1" class="table">
   <caption style="text-align:right;">
      총 금액 : <label id="total">
         sdasas
      </label>
   </caption>
         <tr>
            <th style="width: 100px"></th>
            <th style="width: 100px">ID</th>
            <th style="width: 130px;">Order_ID</th>
            <th style="width: 200px;">이미지</th>
            <th style="width: 350px;">이름</th>
            <th style="width: 150px;">DAY</th>
            <th style="width: 100px;">금액</th>
         </tr>
         
         <c:forEach var="payList" items="${paylist}">
      <tr>
      <td style="height: 200px;"><input type="checkbox" name="checkBtn"></td>
         <td>${payList.id}</td>
         <td>${payList.order_id}</td>
         <td><div style="background-image: url('${payList.img}'); width:200px; height: 200px;background-size:200px,200px;"></div></td>
         <td>${payList.product}</td>
         <td>${payList.day}</td>
         <td><label style="display: none" id="prict_text${payList.rno}">${payList.count*payList.price}</label>
         <fmt:formatNumber value="${payList.count*payList.price}" pattern="#,###" />원</td>
      </tr>
      </c:forEach>
   </table>
      <!-- 검색 form -->
      <div id="acsearch" class="div2">
         <!-- search{s} -->
         <div style="padding-bottom: 20px; display: flex; flex: row; margin: 0 auto; width: 280px;">
            <div class="w100" style="padding-right: 10px">
               <select class="form-control form-control-sm" name="searchType"
                  id="searchType">
                  <option value="id">ID</option>
                  <option value="order_id">Order_ID</option>
               </select>
            </div>
            <div class="w300" style="padding-right: 10px">
               <input type="text" class="form-control form-control-sm"
                  name="keyword" id="keyword">
            </div>
            <div>
               <div>
            <img style="vertical-align: middle; margin:0; padding:0; width: 30px; height: 28px; cursor: pointer;" src="resources/img/scarchhhh.png" name="btnSearch" id="btnSearch" onclick="title_search()">
         </div>
            </div>
         </div>
         <!-- search{e} -->
      </div>
</div>
    <div align="center">
       <div style="display: flex; flex-flow:low; margin-bottom: 50px; justify-content: center;align-items: center;" align="center">
          <div id="num_1" style="display: flex; flex-flow:low; width: 100px; "></div>
          <div id="num_2" style="display: flex; flex-flow:low;"></div>
          <div id="num_3" style="display: flex; flex-flow:low; width: 100px;"></div>
        </div>
    </div>
   <form action="accart_search" name="list_form" method="post">
         <input type="hidden" name="search_result" id="search_result">
         <input type="hidden" name="type_result" id="type_result">
         <input type='hidden' name='start_result' id='start_result' value="1">
       <input type='hidden' name='end_result' id='end_result' value="10">
   </form>
      <input type="hidden" value="${list_search_result}" id="search_result_init">
      <input type="hidden" value="${list_type_result}" id="type_result_init">

                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="resources/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="resources/adbootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="resources/adjs/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="resources/adjs/waves.js"></script>
    <!--Counter js -->
    <script src="resources/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></script>
    <script src="resources/plugins/bower_components/counterup/jquery.counterup.min.js"></script>
    <!-- chartist chart -->
    <script src="resources/plugins/bower_components/chartist-js/dist/chartist.min.js"></script>
    <script src="resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
    <!-- Sparkline chart JavaScript -->
    <script src="resources/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="resources/adjs/custom.min.js"></script>
    <script src="resources/adjs/dashboard1.js"></script>
    <script src="resources/plugins/bower_components/toast-master/js/jquery.toast.js?a"></script>

<form name="adminHeader_form" method="post">
   <input type="hidden" id="adminHeader_form_start" name="start" value="1">
   <input type="hidden" id="adminHeader_form_end" name="end" value="10">
</form>
</body>

</html>