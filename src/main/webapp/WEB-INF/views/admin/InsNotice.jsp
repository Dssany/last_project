<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!--     <link href="resources/plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet"> -->
<!--     <link href="resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet"> -->
    <!-- animation CSS -->
    <link href="resources/adcss/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="resources/adcss/style.css?a" rel="stylesheet">
    <!-- color CSS -->
    <link href="resources/adcss/colors/default.css" id="theme" rel="stylesheet">
<title>공지사항 등록 페이지</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript">

var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "smarteditor", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "resources/smarteditor/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["smarteditor"].exec("PASTE_HTML",['']);
          },
          fCreator: "createSEditor2"
          
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 
 
 
</script>
</head>

<style type="text/css">
.div1 {
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
    .table caption{caption-side: bottom; display: none;}
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
                    location.href="DelNotice?num="+str
                }
             })
           }
         })
   });

});
   

</script>
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
                            <h3 class="box-title">NOTICE INSERT</h3>
<!-- 여기서 부터 내용 -->
					<div align="center" class="div1">
   <form id="frm" action="save_InsNotice" method="post">
     <table class="table">
   <tr>
      <th>제목 :</th>
      <td>
      <input type="text" name="title" id="title" size="80">
      </td>
   </tr>
   
   <tr>
      <th>내용 :</th>
      <td>
      <textarea name="content" id="smarteditor" style="height:300px;width: 1200px;"></textarea>
      
   </tr>

   </table>
   <div class="div2">
      <input type="button" class="btn" id="save" value="저장"/>
      <button class="btn" type="reset">취소</button>
   </div>
   </form>
</div>


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
    <script src="resources/plugins/bower_components/toast-master/js/jquery.toast.js?aa"></script>

<form name="adminHeader_form" method="post">
	<input type="hidden" id="adminHeader_form_start" name="start" value="1">
	<input type="hidden" id="adminHeader_form_end" name="end" value="10">
</form>
</body>

</html>