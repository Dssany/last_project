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
   var size1=${myimg_imglist.size()};
   var img=${myimg_imglist}
   var c=0;
   var ww=1;
   var tt=0;
   $(function() {
      for(i=0;i<size1;i++){
         if(i%5==0){
            c++;
            $("#myimglist").append("<div style='display: flex; flex-flow:low;' id='d"+c+"'></div>");
            if(i!=0){
               tt++;
            }
         }
         t=(tt)*120;
         if(i%5==0  && i!=0){
            ww=1;
         }
         w=(ww)*120;
         $("#d"+c).append("<img src='resources/userimg/"+img[i]+"' id='src"+i+"' onclick='ch("+i+")' style='width: 100px; height: 100px; margin-left: 20px; margin-top: 20px;'> ");
         $("#d"+c).append("<input type='checkbox' id='check"+i+"' style='margin-top: 28px; margin-left: 66px; position: absolute; left: "+w+"px; top:"+t+"px; height: 20px; width: 20px;'>");
         $("#d"+c).append("<input type='button' value='X' onclick='del("+i+")' style='margin-top: 48px; margin-left: 66px; position: absolute; left: "+w+"px; top:"+t+"px; height: 20px; width: 20px;'>")
         ww++;
      }
   })
   function ch(i) {
      for(x=0;x<25;x++){
         $("input:checkbox[id='check"+x+"']").prop("checked", false);
      }
      $("input:checkbox[id='check"+i+"']").prop("checked", true);
   };
   function insert() {
      for(x=0;x<size1;x++){
         if($("input:checkbox[id='check"+x+"']").is(":checked") == true) {
            s=$("#src"+x).prop("src");
            $(opener.document).find("#op_product").val(s);
            $(opener.location).attr("href", "javascript:d_fun();");
            window.close();
            break;
         }else if(x==size1-1){
            alert("선택된 사진이 없습니다.");
         }
      }

   }
   function del(d) {
      data=img[d];
      alert(data);
      $.ajax({
         url : "myimg_delect",
         type : "POST",
         data : {img:data},
         success : function(result) {
            alert(result);
            window.location.reload();
         },
         error : function() {
            alert('내 이미지 삭제 실패');
         }
      })
   }
</script>
</head>
<body>

   <div id="myimglist" style="width: 680px; margin-left: 78px;" align="center">
   </div>
   <div align="center"><input type="button" value="선택한 이미지 삽입" onclick="insert()" style="margin-top: 20px; height: 40px; width: 200px;"></div>
   <form action="design">
      
   </form>
</body>
</html>