<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
   
	
	
	if('${sessionScope.id.split("_")[0]}'=="/admin/"){
         location.href="acboardIns"
   }
	
	
  
});
</script>
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
      $("#btnSave").click(function(){
          oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
          var title = $("#title").val();
          var writer = $("#writer").val();
          if(title == "") {
             swal("제목을 입력하세요");
             document.form1.title.focus();
             return;
          }
          
          $("#frm").submit();
      });    
});
 
</script>
<style type="text/css">
.div1 {
padding-top: 200px;
padding-bottom: 100px;
font: 400 14px 'Poppins',sans-serif;

}
.div2 {
 padding-top: 20px;
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
<c:if test="${sessionScope.id eq null }">
<script type="text/javascript">
   alert("로그인 해주세요.")
   location.href="login"
   
</script>
</c:if>
<jsp:include page="../default/header.jsp"/>
<div align="center" class="div1">
   <form id="frm" name="form1" action="save_write" method="post">
     <table class="board_view">
     
      <caption>글 작성</caption>
           <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
   
   
   <tr>
      <th>이름 :</th>
      <td>
      <input type="text" style="border: 0px; background-color:transparent;"  name="writer" id="writer"  value="${id}" readonly >
      </td>
   </tr>
   
   <tr>
      <th>제목 :</th>
      <td>
      <input name="title" id="title" size="80" placeholder="제목을 입력하세요.">
      </td>
   </tr>
   
   <tr>
      <th>내용 :</th>
      <td>
      <textarea name="content" id="smarteditor" placeholder="내용을 입력하세요."
      style="height:200px;
                    width: 700px;"></textarea>
   </tr>

   </table>
   </form>
   <div class="div2">
      <button type="button" class="btn" id="btnSave">확인</button>
      <button type="reset" onclick="history.back()"class="btn">취소</button>
   </div>
</div>
<jsp:include page="../default/footer.jsp"/>
</body>
</html>