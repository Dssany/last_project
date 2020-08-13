<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

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
	width:84%;
	margin-top: 10px;
}
.replyWrap2{
	width:79%;
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
width:84%;
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
width:84%;

}
#replyForm{
	
	margin-top: 15px;
}
#list{
text-align: left;
padding-top:10px;
padding-left: 220px;	
padding-bottom: 40px;
}
#list a:hover{
	background: #7d7d7d;
	color:white;
	transition: all 0.12s ease-in-out;
}
.btn:hover{
background: #7d7d7d;
	color:white;
	transition: all 0.12s ease-in-out;
}

</style>
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="resources/jquery.form.min.js"></script>
<script src="resources/js/autosize.min.js"></script>

<script type="text/javascript">
  

  
  
  
$(document).ready(function() {
	var bno = ${view.bno}; 
	var sessionId = '${sessionScope.id}'
	

	
	
	$("#insertBtn").click(function(){
		console.log("a");
		var insertData = $("#replyForm").serialize(); //commentInsertForm의 내용을 가져옴
	    commentInsert(insertData); //Insert 함수호출(아래)
	})

// 	function commentList(){
// 	    $.ajax({
// 	        url : 'commentlist',
// 	        type : 'get',
// 	        data : {'bno':bno},
// 	        success : function(data){
// 	            var a =''; 
// 	            $.each(data, function(key, value){ 
// 	                a += '<div class="replyWrap" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
// 	                a += '<div class="replyTitle">'+' 작성자 : '+value.writer;
// 	                a += '<a onclick="commentUpdate('+value.rno+',\''+value.content+'\')"> 수정 </a>';
// 	                a += '<a onclick="commentDelete('+value.rno+')"> 삭제 </a> </div>';
// 	                a += '<div class="commentContent'+value.rno+'"> <p> 내용 : '+value.content +'</p>';
// 	                a += '</div></div>';

// 	            });
	            
// 	            $(".commentList").html(a);
// 	        }
// 	    });
// 	}

	
	
	
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
	                a += '<span class="input-group-btn'+value.p_rno+'-'+value.brno+'" style="display:none;"><button type="button" class="btn" onclick="commentUpdateProc('+value.p_rno+','+value.brno+');">수정</button> </span>';
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
		                a += '<span class="input-group-btn'+value.p_rno+'-'+value.brno+'" style="display:none;"><button type="button" onclick="commentUpdateProc('+value.p_rno+','+value.brno+');">수정 완료</button> </span>';
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
		    a += '<span class="input-group-btn"><button type="button" onclick="commentAddInsert('+p_rno+');">등록완료</button> </span>';
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
		
		if(sessionId.split[0]!=writer){
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
        
	


</script>


<style type="text/css">
.div1 {
padding-top: 200px;
padding-bottom: 100px;
font: 400 14px 'Poppins',sans-serif;
}
  table {
    width: 70%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
 a { text-decoration:none;  color: #000; !important  } 
a:link { color: #000; text-decoration: none; } <!-- link : 방문전 링크 상태 -->
a:visited {
   color: #000; text-decoration: none; } <!-- visited : 방문후 링크 상태 -->
a:hover { color: #000; text-decoration: none; } <!-- hover : 마우스 오버했을 때 링크 상태 -->
a:active { text-decoration: none; color: #000; } <!-- active : 클릭했을 때 링크 상태 -->
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
    vertical-align: middle;
    text-align: left;
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

</style>
</head>
<body onload="commentList()">
<jsp:include page="../default/header.jsp"/>
<div align="center" class="div1">
<form method="post" action="update?bno=${view.bno}">
<input type="hidden" value="${view.bno}" name="bno">
   <table class="board_view">
        
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
              
                <td colspan="4" style="height: 200px; width: 700px;">
                ${view.content}
                </td>
            </tr>
        </tbody>
    </table>
    
    <!-- 목록/수정/삭제 -->
   <div id="list">
    <a href="list" class="btn">목록으로</a>
    <c:if test="${sessionScope.id == view.writer }">
   
    <input type="submit" value="수정하기" style="border: 0px;" >
    <a href="delete?bno=${view.bno}" class="btn">삭제하기</a>
    </c:if>
    </div>
      </form>

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
	
	
  
    
 </div>
<input type="hidden" id="text">
<jsp:include page="../default/footer.jsp"/>
<script type="text/javascript">
autosize(document.querySelectorAll('textarea'));
</script>
</body>
</html>