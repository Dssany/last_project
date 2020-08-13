<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <link href="resources/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
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
<title>Insert title here</title>
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="resources/jquery.form.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var bno = ${view.bno}; 
	console.log(bno)
	var sessionId = '${sessionScope.id}'

		$("#insertBtn").click(function(){
			console.log("a");
			var insertData = $("#replyForm").serialize(); //commentInsertForm의 내용을 가져옴
		    commentInsert(insertData); //Insert 함수호출(아래)
		})
		

	
});

</script>
<script type="text/javascript">
	var bno = ${view.bno}; 
	
	var ch=0;
	
	
	
	function commentList(){
		
	    $.ajax({
	        url : 'commentlist',
	        type : 'get',
	        data : {'bno':bno},
	        success : function(data){
	            var a ='';
	            $.each(data, function(key, value){ 
	            	var recontent = value.content.replace(/<br>/gi,"\r\n");
	            	console.log("리컨텐츠 : "+recontent)
	            	console.log(value.rno)
	            	if(value.rno==0){
	            		
	                a += '<div class="replyWrap2">';
	                a += '<div class="replyTitleRe">'+'<img class="imgclass" src="http://img.echosting.cafe24.com/skin/admin_ko_KR/board/ico_comment.gif"><b>&nbsp'+value.writer.substring(0,2)+'****</b>&nbsp<b class="date">'+value.regDate.substring(0,10)+'</b>';
	                console.log("작성자체크합니다 :"+value.writer)
	                a += '<div class="alink"><a class="btn" onclick="commentUpdate('+value.p_rno+','+value.brno+',\''+value.writer+'\',\''+recontent+'\');"> 수정 </a>';
	                a += '<a class="btn" onclick="commentDelete('+value.p_rno+','+value.brno+',\''+value.writer+'\');"> 삭제 </a>';
	                a += '</div></div>';
	                a += '<div class="commentContent'+value.rno+'"> <textarea class="textclass" readonly cols="1" id="content'+value.p_rno+'_'+value.brno+'" name="content_'+value.rno+'">'+recontent+'</textarea>';
	                a += '<span class="input-group-btn'+value.p_rno+'-'+value.brno+'" style="display:none;"><button type="button" class="btn" onclick="commentUpdateProc('+value.p_rno+','+value.brno+');">수정 완료</button> </span>';
	                a += '<input type="hidden" value="'+value.brno+'">';
	                a += '</div></div>';
	                	
	            	}else{
	            		if(ch!=0)
	            			a += '</div>'
	            		a += '<div id="replyWrap'+value.p_rno+'">'
	            		a += '<div class="replyWrap" style="border-top:1px solid darkgray;">';
		                a += '<div class="replyTitle">'+'<b>'+value.writer.substring(0,2)+"****</b>&nbsp<b class='date'>"+value.regDate.substring(0,10)+'</b>';
		                console.log("작성자체크합니다 :"+value.writer)
		                a += '<div class="alink"><a class="btn" onclick="commentUpdate('+value.p_rno+','+value.brno+',\''+value.writer+'\',\''+value.content+'\');">수정</a>';
		                a += '<a class="btn" onclick="commentDelete('+value.p_rno+','+value.brno+',\''+value.writer+'\');">삭제</a>';
		                a += '<a value="false" class="commentAddlink'+value.p_rno+' btn" onclick="commentAdd('+value.p_rno+');disableLink(this);">답글</a> </div></div>';
		                a += '<div class="commentContent'+value.rno+'"> <textarea class="textclass" readonly cols="1" id="content'+value.p_rno+'_'+value.brno+'" name="content_'+value.rno+'">'+recontent+'</textarea>';
		                a += '<span class="input-group-btn'+value.p_rno+'-'+value.brno+'" style="display:none;"><button type="button" class="btn" onclick="commentUpdateProc('+value.p_rno+','+value.brno+');">수정 완료</button> </span>';
		                a += '<input type="hidden" value="'+value.brno+'">';
		                a += '</div></div>';
		                
		                
	            	}
	            	ch ++;
	            });
	            a += '</div>'
	            $(".commentList").html(a);
	        }
	        
	    });
	}

	function disableLink(e){
		$(e).attr("value","true")
		$(e).css("pointer-events","none");
	};
	
	
	
	
	//답글 텍스트생성 메소드
	function commentAdd(p_rno){
// 		$("#commentAddlink").attr("value","true");
			 var a ='';
			 a +='<form id="commentAdd'+p_rno+'">';
		    a += '<div class="input-group">';
		    a += '<textarea cols="1" id="content" value="true" name="content_Add'+p_rno+'"></textarea>';
		    a += '<button type="button" class="btn" onclick="commentAddInsert('+p_rno+');">등록완료</button>';
		    a += '</div>';
		    a += '</form>';
		    
		    $('#replyWrap'+p_rno).append(a);
	}
	
	//답글 DB등록
	function commentAddInsert(rno){
		var content_Add = $('[name=content_Add'+rno+']').val();
		var sessionId = '${sessionScope.id}'	
		$.ajax({
	        url : 'replyAddInsert',
	        type : 'post',
	        data : {'content':content_Add,'rno':rno,'bno':bno,'writer':sessionId},
	        success : function(data){
	        	$(".commentAddlink").attr("value","false");
	                commentList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=content_Add'+rno+']').val('');
	            
	        },error:function(){
				alert("에러")	        	
	        }
	    });
	
	}
	
	
	
	//댓글 insert 메소드
	function commentInsert(insertData){
	    $.ajax({
	        url : 'reply',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	                commentList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=content]').val('');
	            }
	        }
	    });
	}
	
	//readonly푸는 메소드
	function commentUpdate(rno,brno,writer,content){
		var sessionId = '${sessionScope.id}'
		console.log(writer)
		if(sessionId.split("_")[0]!=writer){
			alert("해당 작성자만 댓글 삭제 가능합니다.\n"+"로그인한아이디 : "+ sessionId +"\n댓글작성자 : " + writer);
		}else{
// 		     var a ='';
// 		      console.log(content)
// 		      var recontent = content.replace(/<br>/gi,"\r\n")
// 		     	console.log(recontent)
// 		     	a += '<div class="input-group">';
// 		    	a += '<textarea cols="1" id="content" name="content_'+rno+'">'+recontent+'</textarea>';
// 		    	a += '<span class="input-group-btn"><button type="button" onclick="commentUpdateProc('+rno+','+brno+');">수정</button> </span>';
// 		    	a += '</div>';
// 		    	$('#replyWrap'+rno).html(a);
				$("#content"+rno+'_'+brno).attr("value",'true');
				$("#content"+rno+'_'+brno).removeAttr("readonly")
				$(".input-group-btn"+rno+'-'+brno).css("display","block");
		    		}
		          
	}
	 
	//댓글 수정DB
	function commentUpdateProc(rno,brno){
	    var updateContent = $("#content"+rno+"_"+brno).val();
	    var count = updateContent.length;
	    if(count > 200)
	    
	    
	    console.log(updateContent)
	    console.log(rno)
	    console.log(brno)
	    if(brno!=0)
		re={'rno' : rno,'brno':brno,'content':updateContent}
		else
		re={'rno' : rno,'content':updateContent}
	    $.ajax({
	        url : 'replyupdate',
	        type : 'post',
	        data : re,
	        success : function(data){
	        	$("#content"+rno+'_'+brno).attr("value",'false');
	            if(data == 1) commentList(); //댓글 수정후 목록 출력 
	        }
	    });
	}

	function commentDelete(rno,brno,writer){
		var sessionId = '${sessionScope.id}'
		if(brno!=0)
		re={'rno' : rno,'brno':brno}
		else
		re={'rno' : rno}
		if(sessionId!=writer){
			alert("해당 작성자만 댓글 삭제 가능합니다.\n"+"로그인한아이디 : "+ sessionId +"\n댓글작성자 : " + writer);
		}else{
			var delconfirm = confirm("해당 댓글을 정말 삭제하시겠습니까?");
			if(delconfirm){
			$.ajax({
			        url : 'replydel',
			        type : 'post',
			        data : re,
			        success : function(data){
			        	alert("댓글이 삭제되었습니다.")
			            commentList(); //댓글 수정후 목록 출력 
			        }
			    });
			}else{
				alert("댓글삭제취소");
			}
		}
		
	}
        
	function ad(d) {
	      $("form[name=adminHeader_form]").attr("action",d);
	      adminHeader_form.submit();
	   }


</script>


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
    vertical-align: middle;
    text-align: left;
    padding: 0px 8px 0 9px;
    border: 1px solid #e0e0e0;
    background: #fafafa;
    margin: 0;
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

.util{
padding-bottom: 10px;}
textarea {
	width:100%;
	height:70px;
	margin-top:10px;
	overflow:hidden !important ;
	border:0;
	padding-left: 30px;
	padding-top: 10px;
	resize: none; 

	}

.replyWrap{
	width:100%;
	margin-top: 10px;
	align: center;
}
.replyWrap2{
	width:95%;
	margin-left:30px;
	border:1px solid #e9e9e9;
	margin-top: 10px;
}

.replyTitle{
/* border-top: 1px solid #e9e9e9; */
	overflow: hidden;
    padding: 12px 0 10px 20px;
/*     border-bottom: 1px solid #e9e9e9; */
    text-align: left;
    background-color: #efefef;
	
}


.replyTitleRe{

/* 	border-top: 1px solid #e9e9e9; */
	overflow: hidden;
    padding: 12px 0 10px 20px;
/*     border-bottom: 1px solid #e9e9e9; */
    text-align: left;
    background-color: white;
   


}

.replyContent{
	text-align: left;
    clear: both;
    padding: 20px 0 20px 25px;
    word-break: break-all;
     border:10px solid;
/*     border-bottom: 1px solid #e9e9e9; */
}
.textareazone{
width:100%;
	border-color: #efefef;
    background-color: #efefef;
}

 .textareazone textarea{ 
 overflow: hidden;
 width:700px; 
     background-color: #efefef;
     
 } 

.replyWrap input[value="1"]{
	margin-left: 40px;
}


 .date{ 
 font: 12px Poppins,Lato,arial,Nanum Gothic,AppleGothic,sans-serif;
    font-weight: normal;
 } 

.alink{
	float: right; 
 	padding-right: 10px; 
    top: 7px;
    right: 20px;
}


textarea[value="false"]{
overflow:auto;
background-color: white;

}
textarea[value="true"]{
border:1px solid #000;

}
.input-group{
width:100%;

}
ul{
	list-style: none;
}
</style>
</head>
<body onload="commentList()">
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
                        <a class="profile-pic" href="#"> <img src="resources/plugins/images/users/varun.jpg" alt="user-img" width="36" class="img-circle"><b class="hidden-xs">${sessionScope.id }</b></a>
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
                            <h3 class="box-title">Q & A VIEW</h3>
                            <div class="util">
                            <a href="acboard" id="list" class="btn">목록</a>
    <input type="button" class="btn" value="수정" onclick="location.href='update?bno=${view.bno}'">
    <a href="delete?bno=${view.bno}" class="btn">삭제</a>
                            </div>
<!-- 여기서 부터 내용 -->
<div>
					
<input type="hidden" value="${view.bno}" name="bno">
   <table class="table">
        
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
          <tbody>
            <tr>
                <th>제목</th>
                <td style="size: 80px;">
                   ${view.title}
                </td>
                <th>조회수</th>
                <td>${view.viewcnt }</td>
            </tr>
            <tr>
                <th id="view_name">작성자</th>
                <td>${view.writer }</td>
                <th>작성시간</th>
                <td>${view.regdate }</td>
            </tr>
            <tr style="height:300px;">
                <th>내용</th>
                <td colspan="3" style="height: 200px; width: 700px;">
                ${view.content}
                </td>
            </tr>
        </tbody>
    </table>
    
    
    
    
    <!-- 목록/수정/삭제 -->
 
   
    
    
    
 </div>
 
  <div class="replyWrap" id="replyWrap">
	    <ul>
	    	<li>
	    		<div class="commentList">
	    			
	    		
	    		<!-- 여기에 댓글 목록들어간다 -->
	    		</div>
			</li>
			<li>
				<div class="AddReply">
					<!-- 추가되는 댓글 들어갈공간 -->
				</div>
			</li>
			
			<li>
				<div class="replyContentWrap">
					<div class="textareazone">
						<form id="replyForm">
						<div class="input-group">
			               <input type="hidden" name="bno" value="${view.bno}">
			               <input type="hidden" name="writer" value="${sessionScope.id }">
			               
			               <textarea cols="1" id="content" class="textclass" name="content" placeholder="내용을 입력하세요."></textarea>
			               <span>
			                    <input type="button" id="insertBtn" class="btn" value="등록"/>
			               </span>
			           </div>
						
						</form>
					</div>
					
		
				</div>
			</li>
		</ul>
	</div>
<input type="hidden" id="text">


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
    <script src="resources/plugins/bower_components/toast-master/js/jquery.toast.js"></script>

<form name="adminHeader_form" method="post">
   <input type="hidden" id="adminHeader_form_start" name="start" value="1">
   <input type="hidden" id="adminHeader_form_end" name="end" value="10">
</form>
</body>


</html>