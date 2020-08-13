<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

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
    <link href="resources/plugins/bower_components/toast-master/css/jquery.toast.css?aa" rel="stylesheet">
    <!-- morris CSS -->
    <link href="resources/plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- chartist CSS -->
    <link href="resources/plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="resources/adcss/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="resources/adcss/style.css?a" rel="stylesheet">
    <!-- color CSS -->
    <link href="resources/adcss/colors/default.css" id="theme" rel="stylesheet">
    <style type="text/css">
    	th{
    		text-align: center;
    	}
    </style>
</head>

<body class="fix-header">
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
<!--                     <li> -->
<!--                         <form role="search" class="app-search hidden-sm hidden-xs m-r-10"> -->
<!--                             <input type="text" placeholder="Search..." class="form-control">  -->
<!--                             <a href=""> -->
<!--                                 <i class="fa fa-search"></i> -->
<!--                             </a>  -->
<!--                         </form> -->
<!--                     </li> -->
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
        <!-- ============================================================== -->
        <!-- End Left Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page Content -->
        <!-- ============================================================== -->
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
                            <h3 class="box-title">Products Yearly Sales</h3>
                           <div align="center" class="div1">
<div class="div2" style=" text-align: center;" >
<!-- 예제 시작 -->

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
   google.charts.load('current', {packages:['corechart']});
</script>
<!-- 차트 내용 -->
<div style="display: flex; flex: row;" id="chart">
   <div align="center" style="margin-right: 100px;">
      <div id="chart_div"></div>
      <div id="chart_div_to"></div>
   </div>
   <div>
      <table border="1" style="width: 700px; height: 500px;">
         <tr style="background-color: #66666694;">
            <th class="wi" style="width:10%;text-align: center"></th>
            <th class="wi" style="width:40px;">귀걸이</th>
            <th class="wi" style="width:40px;">가방</th>
            <th class="wi" style="width:40px;">옷</th>
            <th class="wi" style="width:40px;">폰</th>
            <th style="width:50px;" class="wi">총합</th>
         </tr>
         <tr>
            <th>1월</th><th>${chart1mon.split(",")[0]}</th><th>${chart1mon.split(",")[1]}</th><th>${chart1mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart1mont}</th>
         </tr>
         <tr>
            <th>2월</th><th>${chart2mon.split(",")[0]}</th><th>${chart2mon.split(",")[1]}</th><th>${chart2mon.split(",")[2]}</th><th>${chart2mon.split(",")[3]}</th><th>${chart2mont}</th>
         </tr>
         <tr>
            <th>3월</th><th>${chart3mon.split(",")[0]}</th><th>${chart3mon.split(",")[1]}</th><th>${chart3mon.split(",")[2]}</th><th>${chart3mon.split(",")[3]}</th><th>${chart3mont}</th>
         </tr>
         <tr>
            <th>4월</th><th>${chart4mon.split(",")[0]}</th><th>${chart4mon.split(",")[1]}</th><th>${chart4mon.split(",")[2]}</th><th>${chart4mon.split(",")[3]}</th><th>${chart4mont}</th>
         </tr>
         <tr>
            <th>5월</th><th>${chart5mon.split(",")[0]}</th><th>${chart5mon.split(",")[1]}</th><th>${chart5mon.split(",")[2]}</th><th>${chart5mon.split(",")[3]}</th><th>${chart5mont}</th>
         </tr>
         <tr>
            <th>6월</th><th>${chart6mon.split(",")[0]}</th><th>${chart6mon.split(",")[1]}</th><th>${chart6mon.split(",")[2]}</th><th>${chart6mon.split(",")[3]}</th><th>${chart6mont}</th>
         </tr>
         <tr>
            <th>7월</th><th>${chart7mon.split(",")[0]}</th><th>${chart7mon.split(",")[1]}</th><th>${chart7mon.split(",")[2]}</th><th>${chart7mon.split(",")[3]}</th><th>${chart7mont}</th>
         </tr>
         <tr>
            <th>8월</th><th>${chart8mon.split(",")[0]}</th><th>${chart8mon.split(",")[1]}</th><th>${chart8mon.split(",")[2]}</th><th>${chart8mon.split(",")[3]}</th><th>${chart8mont}</th>
         </tr>
         <tr>
            <th>9월</th><th>${chart9mon.split(",")[0]}</th><th>${chart9mon.split(",")[1]}</th><th>${chart9mon.split(",")[2]}</th><th>${chart9mon.split(",")[3]}</th><th>${chart9mont}</th>
         </tr>
         <tr>
            <th>10월</th><th>${chart10mon.split(",")[0]}</th><th>${chart10mon.split(",")[1]}</th><th>${chart10mon.split(",")[2]}</th><th>${chart10mon.split(",")[3]}</th><th>${chart10mont}</th>
         </tr>
         <tr>
            <th>11월</th><th>${chart11mon.split(",")[0]}</th><th>${chart11mon.split(",")[1]}</th><th>${chart11mon.split(",")[2]}</th><th>${chart11mon.split(",")[3]}</th><th>${chart11mont}</th>
         </tr>
         <tr>
            <th>12월</th><th>${chart12mon.split(",")[0]}</th><th>${chart12mon.split(",")[1]}</th><th>${chart12mon.split(",")[2]}</th><th>${chart12mon.split(",")[3]}</th><th>${chart12mont}</th>
         </tr>
      </table>
   </div>
</div>

<%-- <label id="c1">${yer}</label> --%>

<!-- 차트 년도 변경 -->
<div style="text-align:center;">
<input type="text" onchange="yerch()" id="chart_date" placeholder="년도 입력" style="text-align: center;">
<form action="adminindex" name="chart_form" method="post">
${chart_date}
<input type="hidden" id="chart_text" name="yer">
</form>
</div>
<!-- 차트 유형 변경 -->
<!-- <div style="text-align:center; padding-top: 50px;"> -->
<!--    <button type="button" onclick="chart_options.isStacked=false; drawChart()">false(기본값)</button> -->
<!--    <button type="button" onclick="chart_options.isStacked=true; drawChart()">true</button> -->
<!-- </div> -->
<script>
function ad(d) {
      $("form[name=adminHeader_form]").attr("action",d);
      adminHeader_form.submit();
   }
// 로딩 완료시 함수 실행하여 차트 생성
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawChart_to);

// 차트 옵션을 전역으로 설정했습니다. 설정을 바꿔보는 예제를 만들기 위해서요.
var chart_options = {
   title : ${yer}+'년 월 매출',
   width : 700,
   height : 300,
   tooltip:{textStyle : {fontSize:12}, showColorCode : true},
   bar : {
      groupWidth : '50%' // 예제에서 이 값을 수정
   },
   seriesType : 'bars',
   isStacked : false, // 그래프 쌓기(스택), 기본값은 false
   animation: { //차트가 뿌려질때 실행될 애니메이션 효과
        startup: true,
        duration: 1000,
        easing: 'linear' }
};


function drawChart(){
   // 차트 데이터
   
   var data = new google.visualization.arrayToDataTable([
      ['월', '귀걸이', '가방', '옷','폰'], // 제목 그리고 항목들

      ['1월', ${chart1mon}], // 제목과 항목수를 맞춰주어야 합니다.
      ['2월', ${chart2mon}], // 마지막 값들은 라인그래프를 만들때 사용합니다.
      ['3월', ${chart3mon}],
      ['4월', ${chart4mon}],
      ['5월', ${chart5mon}],
      ['6월', ${chart6mon}],
      ['7월', ${chart7mon}],
      ['8월', ${chart8mon}],
      ['9월', ${chart9mon}],
      ['10월', ${chart10mon}],
      ['11월', ${chart11mon}],
      ['12월', ${chart12mon}]
   ]);
   
   var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
   chart.draw(data, chart_options);
}

//차트 옵션을 전역으로 설정했습니다. 설정을 바꿔보는 예제를 만들기 위해서요.
var chart_options_to = {
title : ${yer}+'년 월 매출',
width : 700,
height : 300,
tooltip:{textStyle : {fontSize:12}, showColorCode : true},
bar : {
   groupWidth : '50%' // 예제에서 이 값을 수정
},
seriesType : 'line',
isStacked : false, // 그래프 쌓기(스택), 기본값은 false
animation: { //차트가 뿌려질때 실행될 애니메이션 효과
     startup: true,
     duration: 1000,
     easing: 'linear' }
};


function drawChart_to(){
// 차트 데이터

var data = new google.visualization.arrayToDataTable([
   ['월', '총합'], // 제목 그리고 항목들

   ['1월', ${chart1mont}], // 제목과 항목수를 맞춰주어야 합니다.
   ['2월', ${chart2mont}], // 마지막 값들은 라인그래프를 만들때 사용합니다.
   ['3월', ${chart3mont}],
   ['4월', ${chart4mont}],
   ['5월', ${chart5mont}],
   ['6월', ${chart6mont}],
   ['7월', ${chart7mont}],
   ['8월', ${chart8mont}],
   ['9월', ${chart9mont}],
   ['10월', ${chart10mont}],
   ['11월', ${chart11mont}],
   ['12월', ${chart12mont}]
]);

var chart = new google.visualization.ComboChart(document.getElementById('chart_div_to'));
chart.draw(data, chart_options_to);
}

</script>

<!-- 예제 종료 -->
<script type="text/javascript">
function yerch() {
   alert($("#chart_date").val());
   $("#chart_text").val($("#chart_date").val());
//    $("#c1").text($("#chart_date").val().split("-")[0]);
   chart_form.submit();
}
</script>

</div>
</div>

                            
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- table -->
                <!-- ============================================================== -->
                
                <!-- ============================================================== -->
                <!-- chat-listing & recent comments -->
                <!-- ============================================================== -->
            </div>
            <!-- /.container-fluid -->
            
        </div>
        <!-- ============================================================== -->
        <!-- End Page Content -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
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
    <script src="resources/plugins/bower_components/toast-master/js/jquery.toast.js?aa"></script>
<form name="adminHeader_form" method="post">
   <input type="hidden" id="adminHeader_form_start" name="start" value="1">
   <input type="hidden" id="adminHeader_form_end" name="end" value="10">
</form>


</body>

</html>