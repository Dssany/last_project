<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style type="text/css">
.freeimg{
   width: 100px;
   height: 100px;
   padding: 10px;
}
</style>
</head>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/jquery-3.2.1.min.js"></script>
<script src="resources/jquery.form.min.js"></script>
<script src="resources/jquery-1.12.1-ui.js"></script>
<script src="resources/html2canvas.js"></script>




<script type="text/javascript">
   function partShot() { //특정부분 스크린샷 
      if('${sessionScope.id}'!=''){
      html2canvas(document.getElementById("zz")) //id container 부분만 스크린샷 
      .then(function (canvas) { //jpg 결과값
         drawImg(canvas.toDataURL('image/jpeg')); //이미지 저장
         saveAs(canvas.toDataURL(), 'file-name.jpg'); 
         alert("장바구니 담는중")
      })
      }else{
         alert("로그인 해주세요.")
         location.href='login'
      }
   } 
   function drawImg(imgData) { 
//       console.log(imgData); //imgData의 결과값을 console 로그롤 보실 수 있습니다. 
      return new Promise(function reslove() { //내가 결과 값을 그릴 canvas 부분 설정 
         var canvas = document.getElementById('canvas'); 
         var ctx = canvas.getContext('2d'); //canvas의 뿌려진 부분 초기화 
         ctx.clearRect(0, 0, canvas.width, canvas.height); 
         var imageObj = new Image(); 
         imageObj.onload = function () { 
            ctx.drawImage(imageObj, 10, 10); //canvas img를 그리겠다. 
         }; 
         imageObj.src = imgData; //그릴 image데이터를 넣어준다. 
      }, function reject() { });
   }
   function saveAs(uri, filename) { 
      alert(filename)
      st=uri.split(",")
      
      $.ajax({
         url : "makeFile",
         type : "POST",
         data : {imgbase64:st[1]},
         success : function(data) {
            alert(data)
            cartsave(data);
         },
         error : function() {
            alert('문제 발생')
         }
      })
   }
   function cartsave(data) {
      n='${img_name}'
      m='${img_money}'
      ty='${img_goods}'
      $.ajax({
         url : "userimg_insert",
         type : "POST",
         data : {userimg_in:data,imgname:n,imgmoney:m,type:ty},
         success : function(result) {
            alert(result)
            location.href="cart"
         },
         error : function() {
            alert('장바구니 저장 실패')
         }
      })
   }
   </script>
<script type="text/javascript">
   
//    $(function(){
//        $("#image1").draggable();
//        $("#image2").draggable();
//    })
   
   //기본 이미지 자동생성
   var ch=0;
   var count=1;
   var img=[];
   var ctx=[];
   img[0]=null;
   ctx[0]=null;
//    img[1] = new Image();
//    img[2] = new Image();
      
//     img[1].addEventListener('load',function(){
//       ctx[1] = document.getElementById('myCanvas').getContext("2d");
//         ctx[2] = document.getElementById('myCanvas2').getContext("2d");
//         ctx[1].drawImage(img[1],0,0,300,150);
//         ctx[2].drawImage(img[2],0,0,300,150);
        
//     },false);
      
//     img[1].src="resources/img/right.png";
//     img[2].src="resources/img/abc.jpg";
    
    // 이미지 업로드시 실행되는 함수
    function uploadBtn() {
       if('${sessionScope.id}'!=''){
      $('#file').click();
       }else{
          alert("로그인 해주세요.")
          location.href='login'
       }
   }
//    file창이 종료가 되면 실행
   function changeValue(obj){
      var form = $('#form')[0];
      var formData = new FormData(form);
      $.ajax({
         url : "fileUpload",
         type : "POST",
         data : formData,
         processData: false,
         contentType: false,
         success : function(result) {
            alert('파일 저장 성공')
         },
         error : function() {
            alert('파일 저장 실패')
         }
      })
   if (obj.files && obj.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
//          alert(e.target.result)
//          alert(obj)
            id="myCanvas"+count
            $('#in').append("<div id='image"+count+"' style='z-index:"+count+";' onclick='imgclick("+count+")'><canvas id='myCanvas"+count+"'style='width: 50px; height: 50px;'></canvas></div>")
            $("#image"+count).draggable();
               img[count] = new Image();
                g=img[count];
                img[count].addEventListener('load',function(){
                   ctx[count] = document.getElementById(id).getContext("2d");
                   ctx[count].drawImage(g,0,0,300,150);
                },false);
                img[count].src=e.target.result;
                count++;
        }
         reader.readAsDataURL(obj.files[0]);
      }
         
   }
   
   // 텍스트 추가
   function in_text() {
      alert("in_text")
      $('#in').append("<div id='image"+count+"' style=' z-index:"+count+"; position: relative; left: 63px; top: -4px;' ondblclick='test_dblclick("+count+")' onclick='imgclick("+count+")'><font style='font-size:30pt;' id='image_label"+count+"'>입력</font></div>")
      $("#image"+count).css("width",$("#image_label"+count).css("width"));
      $("#image"+count).draggable();
      count++;
   }
   
//    텍스트 더블 클릭시 실행
    function test_dblclick(d) {
       alert("텍스트 더블클릭")
       $("div").remove("#text_dblclick_event");
       $("#left_menu").append("<div id='text_dblclick_event' style='width:192px; height:92px; margin-top:30px;'>"
       +"<div style='display: flex; flex-flow:row; width: 20px; padding-left:74px;'>"
       +"<input type='button' style='width:50px; height:20px; cursor: pointer;' onclick='text_dblclick_event_del()' value='X'>"
       +"<input type='button' style='margin-left:5px; width:50px; height:20px; cursor: pointer;;' onclick='dblclick_end("+d+")' value='O'>"
       +"</div>"
       +"<div style='margin-top:10px;'><input id='textin' type='text' placeholder='입력할 글자 입력'></div>"
       +"<div style='margin-top:10px;'><input id='sizein' type='text' placeholder='크기 입력(px)'></div></div>");
   }
   function text_dblclick_event_del() {
      $("div").remove("#text_dblclick_event");
}
   function dblclick_end(d) {
      alert($("#sizein").val())
      alert($("#textin").val())
      if($("#sizein").val()!="")
      $("#image_label"+d).css("font-size",$("#sizein").val()+"pt");
      if($("#textin").val()!="")
      $("#image_label"+d).text($("#textin").val());
      $("#image"+count).css("width",$("#image_label"+count).css("width"))
      $("div").remove("#text_dblclick_event");
   }
   
   var imgclick_ch=0;
   // 이미지 클릭시 화면 투명도 절반으로 줄이는 함수
    function imgclick(d) {
       imgclick_ch=1;
        ch=d;
        $("#myCanvas"+d).resizable({
            minWidth: 50,
            minHeight: 50,
            autoHide:true,
        });
        
        for(i=1;i<count+1;i++){
           $("#image"+i).css("opacity", "1");
        }
        $("#image"+d).css("opacity", "0.5");
      }
    
   // 디자인하는방법 클릭시 함수 실행
   function opentip() {
      window.name = "parentForm";
      var popupX = (window.screen.width / 2) - (1300 / 2);
      var popupY= (window.screen.height /2) - (850 / 2);
       
      openWin = window.open("tip",
            "logindForm", 'status=no, height=750, width=1300, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY + ", resizable = no, scrollbars = no");    
   }
   
    // 내이미지 클릭시 함수 실행
    function mying() {
       if('${sessionScope.id}'!=''){
        window.name = "parentForm";
        var popupX = (window.screen.width / 2) - (1300 / 2);
        var popupY= (window.screen.height /2) - (850 / 2);
        openWin = window.open("myimg",
                "logindForm", 'status=no, height=750, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY + ", resizable = no, scrollbars = no");    
       }else{
          alert("로그인 해주세요")
          location.href="login"
       }
    }
   
   function d_fun() {
      alert($("#op").val()+" 사진 선택")
      id="myCanvas"+count
      $('#in').append("<div id='image"+count+"' style='z-index:"+count+";'><canvas id='myCanvas"+count+"'style='width: 50px; height: 50px;'></canvas></div>")
      $("#image"+count).draggable();
      img[count] = new Image();
      g=img[count]
      img[count].addEventListener('load',function(){
         ctx[count] = document.getElementById(id).getContext("2d");
         ctx[count].drawImage(g,0,0,300,150);
      },false);
      img[count].src=$("#op_product").val();
      count++
   }
   
   url='${img_name}'
   $(function(){
       $("#zz").css("background-image", "url('resources/img/${img_goods} design/"+url+".png' )");
       $("#zz").css("background-size", "600px 600px");
    });
   
//    view 앞으로
   function view_forward() {
      x = $("#image"+ch).css('z-index');
      alert($("#image"+ch).css('z-index'))
      if(parseInt(x)+1<count){
         for(i=0;i<count;i++){
            if($("#image"+i).css('z-index')==(parseInt(x)+1)){
               $("#image"+i).css('z-index',x);
               $("#image"+ch).css('z-index',parseInt(x)+1);
               alert($("#image"+i).css('z-index'));
               alert($("#image"+ch).css('z-index'));
               break;
            }
         }
      }
   }
   
//    view 뒤로
   function view_front() {
      x = $("#image"+ch).css('z-index');
      alert(x)
      if(parseInt(x)-1>0){
         for(i=0;i<count;i++){
            if($("#image"+i).css('z-index')==(parseInt(x)-1)){
               $("#image"+i).css('z-index',x);
               $("#image"+ch).css('z-index',parseInt(x)-1);
               alert($("#image"+i).css('z-index'));
               alert($("#image"+ch).css('z-index'));
               break;
            }
         }
      }
   }
   
//    좌우 반전
    var left_right_count=0;
    function view_left_right() {
       if(left_right_count%2==0){
           $(function(){
              $("#image"+ch).css("transform", "rotate(90deg)");
              $("#image"+ch).css("-moz-transform", "scaleX(-1)");
              $("#image"+ch).css("-o-transform", "scaleX(-1)");
              $("#image"+ch).css("-webkit-transform", "scaleX(-1)");
              $("#image"+ch).css("transform", "scaleX(-1)");
              $("#image"+ch).css("filter", "FlipH");
              $("#image"+ch).css("-ms-filter", "FlipH");
           });
       }else{
          $(function(){
              $("#image"+ch).css("transform", "rotate(90deg)");
              $("#image"+ch).css("-moz-transform", "scaleX(1)");
              $("#image"+ch).css("-o-transform", "scaleX(1)");
              $("#image"+ch).css("-webkit-transform", "scaleX(1)");
              $("#image"+ch).css("transform", "scaleX(1)");
              $("#image"+ch).css("filter", "FlipH");
              $("#image"+ch).css("-ms-filter", "FlipH");
           });
       }
       left_right_count++;
    }
   
//     위 아래 반전
    var up_down_count=0;
    function view_up_down() {
      if(up_down_count%2==0){
         $(function(){
            $("#image"+ch).css("transform", "rotate(90deg)");
            $("#image"+ch).css("-moz-transform", "scaleY(-1)");
            $("#image"+ch).css("-o-transform", "scaleY(-1)");
            $("#image"+ch).css("-webkit-transform", "scaleY(-1)");
            $("#image"+ch).css("transform", "scaleY(-1)");
            $("#image"+ch).css("filter", "FlipH");
            $("#image"+ch).css("-ms-filter", "FlipH");
         });
      }else{
         $(function(){
            $("#image"+ch).css("transform", "rotate(90deg)");
            $("#image"+ch).css("-moz-transform", "scaleY(1)");
            $("#image"+ch).css("-o-transform", "scaleY(1)");
            $("#image"+ch).css("-webkit-transform", "scaleY(1)");
            $("#image"+ch).css("transform", "scaleY(1)");
            $("#image"+ch).css("filter", "FlipH");
            $("#image"+ch).css("-ms-filter", "FlipH");
         });
      }
      up_down_count++;
   }
   
//    초기화
   function view_reset() {
      window.location.reload();
   }
//    삭제
   function view_garbage() {
      $("div").remove("#image"+ch);
   }
//    상품 수정
   function change() {
      var changeop = document.changeopen;
      
      var popupX = (window.screen.width / 2) - (1300 / 2);
      var popupY= (window.screen.height /2) - (850 / 2);
      chopenWin = window.open("",
         "changeopen", 'status=no, height=750, width=1100, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY + ",  = no, status=no,toolbar=no,scrollbars=noresizable");    
      changeop.action="change";
      changeop.method="post";
      changeop.target="changeopen";
      changeop.submit();
   }
    function background_ch() {
       design_fimg.submit();
   }
   
//  왼쪽정렬
    function view_left() {
       $("#image"+ch).css("left", "0px");
    }
//     오른쪽 정렬
    function view_right() {
       $("#image"+ch).css("width",$("#myCanvas"+ch).css("width"))
          $("#image"+ch).css("left", parseInt(318)-parseInt($("#image"+ch).css("width").split("px")[0])+"px");
    }
//     왼쪽,오른쪽 가운데
      function view_left_right_center() {
         $("#image"+ch).css("width",$("#myCanvas"+ch).css("width"))
          $("#image"+ch).css("left", parseInt(159)-parseInt($("#image"+ch).css("width").split("px")[0])/2+"px");
   }
//     위,아래 가운데
    function view_up_down_center() {
       $("#image"+ch).css("top", parseInt(209)-parseInt($("#image"+ch).css("height").split("px")[0])/2+"px");
    }
//     위쪽정렬
    function view_up() {
       $("#image"+ch).css("top", "0px");
    }
//     아래쪽정렬
    function view_down() {
       $("#image"+ch).css("top", parseInt(418)-parseInt($("#image"+ch).css("height").split("px")[0])+"px");
    }
    
    
    //배송안내
    function delivery(){
       window.open("","delivery","width=700,height=700");
    }
    //청약철회
    function quality(){
       window.open("","quality","width=700,height=700")
    }
    
    function re_view() {
       design_review_form.submit();
   }
    function imgclick_maindiv() {
      if(imgclick_ch==1){
         imgclick_ch=0;
      }else{
         for(i=1;i<count+1;i++){
                 $("#image"+i).css("opacity", "1");
              }
      }
   }
</script>
<body >
   
   <jsp:include page="../default/header.jsp"/>
   <div style="width: 1500px; margin: 0 auto; margin-top: 100px;" onclick="imgclick_maindiv()">
      <div style="display: flex; flex-flow:row; width: 700px; margin: 0 auto; " align="left">
         <div style="text-align: center;cursor:pointer;" onclick="view_reset()">
            <img src="resources/img/reset.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px; text-align: center;">처음으로</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_garbage()">
            <img src="resources/img/garbage.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">삭제</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_forward()">
            <img src="resources/img/forward.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">앞으로</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_front()">
            <img src="resources/img/front.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">뒤로</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_left_right()">
            <img src="resources/img/left_right.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">좌우반전</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_up_down()">
            <img src="resources/img/up_down.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">상하반전</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_left()">
            <img src="resources/img/left.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">왼쪽</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_left_right_center()">
            <img src="resources/img/left_right_center.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">가운데</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_right()">
            <img src="resources/img/right.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">오른쪽</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_up()">
            <img src="resources/img/up.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">위</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_up_down_center()">
            <img src="resources/img/up_down_center.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">가운데</font>
         </div>
         <div style="text-align: center;cursor:pointer;"onclick="view_down()">
            <img src="resources/img/down.png" style="width: 50px;height: 50px;" ><br><font style="font-size: 10px;">아래</font>
         </div>
         
      </div>
      <div style="display: flex; flex-flow:row; background-color: #f8f9fa; margin-top: 20px; margin-right: 100px;">
         <div style="width: 250px; margin-top: 50px;" align="center" id="left_menu">
            <div align="center" onclick="partShot()" onmouseover="style='cursor:pointer; width: 200px; height: 70px; background-color: #ffffff; border: 1px solid #eaedf0;'" style="width: 200px; height: 70px;background-color: #ffffff; border: 1px solid #eaedf0;"><p style="padding-top: 7px;"> 장바구니 담기</p> </div><br><br>
            <div style="width: 200px; height:70px; background-color: #ffffff; display: flex; flex-flow:low; border: 1px solid #eaedf0;" align="left" onclick="opentip()" onmouseover="style='cursor:pointer;width: 200px; height:70px; background-color: #ffffff; display: flex; flex-flow:low; border: 1px solid #eaedf0;'">
               <div style="margin-top: 10px;"> <img src="resources/img/tip.png" style="width: 50px; height: 50px;"> </div>
               <div style="text-align: center; margin-top: 10px;"> <p>디자인하는 방법</p> </div>
            </div>
         </div>
         <div style="background-color:green; width: 600px; height: 600px; border: 1px solid #eaedf0;" id="zz">
            <div style="width:320px; height:420px; margin-left: 120px; margin-top: 132px;" id="in">
<!--                <div id="image1" style="width: 50px; height: 50px;"> -->
<!--                   <canvas id="myCanvas" style='width: 50px; height: 50px;'></canvas> -->
<!--                </div> -->
<!--                <div id="image2" style="width: 50px; height: 50px;"> -->
<!--                   <canvas id="myCanvas2" style='width: 50px; height: 50px;'></canvas> -->
<!--                </div> -->
            </div>
         </div>
         <div style="display: flex; flex-flow:column; margin-left: 25px;" align="center">
            <img src="resources/img/change.png" style="width: 100px;height: 100px;" onclick="change()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
            <img src="resources/img/upload.png" style="width: 100px;height: 100px;" onclick="uploadBtn()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
            <img src="resources/img/myimg.png" style="width: 100px;height: 100px;" onclick="mying()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
            <img src="resources/img/text.png" style="width: 100px;height: 100px;" onclick="in_text()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
<!--             <img src="resources/img/design.png" style="width: 100px;height: 100px;" onclick="" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'"> -->
         </div>
         <div style="float: right; solid:red; height: 500px; margin: 0 auto; margin-left: 50px;">
      상품명 : <label id="design_product">${img_name}</label><br>
         가격 : <label id="design_price">${img_money}</label><br><br>    
      <button style="border: 1px solid gray; background-color: rgba(0,0,0,0); color: black; padding: 5px;" type="button" onclick="change()"> 상품 변경</button>
      <button style="border: 1px solid gray; background-color: rgba(0,0,0,0); color: black; background-color:none; padding: 5px;" type="button" onclick="re_view()"> 리뷰 보기 및 등록</button><br>
      <br>
   <script type="text/javascript">
   //무료이미지 업로드
   function freer(ddd) {
      alert("dd")
      id="myCanvas"+count
        $('#in').append("<div id='image"+count+"' style='z-index:"+count+";' onclick='imgclick("+count+")'><canvas id='myCanvas"+count+"'style='width: 50px; height: 50px;background-color:none'></canvas></div>")
        $("#image"+count).draggable();
           img[count] = new Image();
            g=img[count];
            img[count].addEventListener('load',function(){
               ctx[count] = document.getElementById(id).getContext("2d");
               ctx[count].drawImage(g,0,0,300,150);
            },false);
            img[count].src=$("#free_img"+ddd).attr("src");                      
            count++;
   }
   </script>      
      <script type="text/javascript">
      var free_count=0;
      var free_count_all=27;
      var frees=0;
      var freee=9;
      $(function () {
         for(i=0;i<9;i++){
           if(i%3==0){
              free_count++;
              $("#design_free").append("<div style='display: flex; flex: row; cursor:pointer' id='free_img_list"+free_count+"'></div>");
           }
           a=i+1;
           $("#free_img_list"+free_count).append("<img onclick='freer("+i+")' class='freeimg' alt='로고' src='resources/img/free/"+a+".png' id='free_img"+i+"'>");
        }
   });
         
//          free_img_list();
         function free_img_list() {
            free_count=0;
            for(i=frees;i<freee;i++){
               if(i%3==0){
                  free_count++;
                  $("#design_free").append("<div style='display: flex; flex: row; cursor:pointer' id='free_img_list"+free_count+"'></div>");
               }
               a=i+1;
               $("#free_img_list"+free_count).append("<img onclick='freer("+i+")' class='freeimg' alt='로고' src='resources/img/free/"+a+".png' id='free_img"+i+"'>");
            }
      }
      function freebtn1() {
         if(frees!=0){
            for(i=1;i<4;i++){
               $("div").remove("#free_img_list"+i);
            }
            frees-=9;
            freee-=9;
            free_img_list();
         }
         alert("왼쪽으로\n"+frees+" , "+freee);
      }
         function freebtn2() {
         if(freee!=free_count_all){
            for(i=1;i<4;i++){
               $("div").remove("#free_img_list"+i);
            }
            frees+=9;
            freee+=9;
            free_img_list();
         }
         alert("오른쪽으로\n"+frees+" , "+freee);
      }
      </script>
      무료이미지
      <div id="design_free">
         <div align="center" style="margin-top: 10px;">
         <label style="font-size: 40px; margin-right: 30px; cursor:pointer" onclick="freebtn1()"> < </label> 
         <label style="font-size: 40px; margin-left: 30px; cursor:pointer" onclick="freebtn2()"> > </label>
         </div>
         
      </div>
      
      <br>
      
      
      
   <script type="text/javascript">
      $(function() {
         if("${img_goods}"!="dresss"){
            $("#size_select").css("display","none");
         }
      })
   </script>
<!--       귀걸이랑 가방은 해당안됨 -->
      
      <div style="display: flex; flex: row;" id="size_select">
         <ul style="list-style:none; margin:0; padding:0;" id="size_select">
            <li>사이즈</li>
            <li style="box-sizing: border-box; text-align: center; cursor: pointer; margin-right: 8px; border: solid 1px #d5dbe0; font-size: 14px; color: #000; width: 69px; height: 40px; line-height: 40px; margin-bottom: 8px; list-style: none; float: left;">S</li>
            <li style="box-sizing: border-box; text-align: center; cursor: pointer; margin-right: 8px; border: solid 1px #d5dbe0; font-size: 14px; color: #000; width: 69px; height: 40px; line-height: 40px; margin-bottom: 8px; list-style: none; float: left;">M</li>
            <li style="box-sizing: border-box; text-align: center; cursor: pointer; margin-right: 8px; border: solid 1px #d5dbe0; font-size: 14px; color: #000; width: 69px; height: 40px; line-height: 40px; margin-bottom: 8px; list-style: none; float: left;">XL</li>
            <li style="box-sizing: border-box; text-align: center; cursor: pointer; margin-right: 8px; border: solid 1px #d5dbe0; font-size: 14px; color: #000; width: 69px; height: 40px; line-height: 40px; margin-bottom: 8px; list-style: none; float: left;">2XL</li>
         </ul>
      </div>
   </div>
<!--    장바구니 -->
<!--    <div onclick="partShot()" style="position: absolute; width: 380px; left: 50%; transform: translateX(-50%); height: 56px; font-size: 14px; text-align: center; line-height: 58px; color: #fff; font-weight: 300; background-color: #212529; cursor: pointer; bottom: 100px; margin-left: 520px;" >장바구니 담기</div> -->
      </div>
      
<div style="width: 100%;">
         <div>
            <span><h2>인쇄 관련 사항</h2></span>
            </div>
            <div>
            <img src="https://s3.marpple.co/files/u_218933/2020/1/original/1447427615f02a618208be86c5f98f28ba80d89291cabec.png" alt="" style="width: 80%; padding: 10px;"/>
            </div>
      <h2>주의사항</h2>
         <ul>
            <li>
            배경이 투명한 PNG의 경우, CMYK 색상모드로 웹용(Save for Web) 저장해주세요.<br>
            배경이 꽉 찬 JPG의 경우, RGB 색상모드로 저장해주세요.<br>
            이미지 크기는 최소 2500~3500px / 해상도는 150dpi 이상으로 제작해주세요.
            </li>
            <li>
            상품마다 이미지 크기가 다르므로, 해당 상품의 이미지 가이드를 확인해 주세요.
           </li>
           <li>
           작은 원본 이미지를 사이즈 규격에 맞게 임의로 크게 확대할 경우 인쇄 시 화질이 깨질 수 있습니다.
           </li>
           <li>
           상품 실측 사이즈를 반드시 확인해 주세요.
           </li>
           <li>
           인쇄를 원하시는 위치가 있을 시 [상품 제작 요청사항]에 남겨주시거나, 1:1 상담 또는
        고객센터(help@marpple.com)로 메일 주세요. 따로 위치 지정 요청이 없으면 가장 보편적인 위치로 인쇄해드립니다.
           </li>
           <li>
           모니터, 핸드폰에 따라 실제 인쇄 색상과 다르게 보일 수 있습니다.
           </li>
        </ul>
        <h2>교환/환불 불가 사항</h2>
        <p>마플의 모든 상품은 고객 주문에 따라 개별 제작되는 방식으로 단순 변심을 포함, 아래의 경우에는 교환 /
      환불이 불가합니다.</p>
      <h3>- 디자인 시안 색상의 차이</h3>
      <p class="txt2">프린팅 방식과 원단 재질에 따른 경우의 수가 다양하므로 인쇄 후 모니터, 혹은 종이 출력물과 색상 차이가
      발생할 수 있습니다.</p>
      <h3>- 인쇄 위치 및 크기의 차이</h3>
      <p>제품 재질에 따른 특성의 차이와 대부분의 인쇄가 수작업으로 이루어진다는 점에서 시안과 실제 상품의 인쇄
      위치 및 크기의 오차가 발생할 수 있습니다. 인쇄 위치 및 크기를 별도로 [요청] 하지 않은 주문건에 대한 교환
      또는 환불은 불가합니다.</p>
      <h3>- 추가 주문 시 기존 상품 색상과의 컬러 차이</h3>
      <p >상품 컬러 및 사이즈는 제작 시기별, 생산시즌별로 원단 컬러와 사이즈 차이가 발생할 수 있습니다.</p><h3>- 화학 제품 사용으로 인한 손상</h3><p class="txt2">우레탄 전사(PU Heat Transfer) 인쇄 제품에 솔벤트와 같은 용해력이 있는 용매를 사용한 향수를 직접적으로
      분사할 경우 인쇄 부분이 손상될 수 있으니 주의해주세요.</p>
      <h2>교환/환불 기간</h2>
      <p>물품에 문제 되는 사항에 대해서는 수령 후 7일 이내 이메일
      <a href="guddn108@naver.com">guddn108@naver.com</a>
      또는 고객센터로 연락주셔야 가능합니다.</p>
      <p>★ 주문 완료 후 상품 및 이미지 변경을 원하실 경우 [제작준비중] 상태에서만 변경이 가능하며 [제작중]에는
      변경 및 취소가 불가합니다. 변경을 원하시는 경우 1:1 상담 및 카톡 또는 고객센터(<a href="tel:1566-9437">1566-9437</a>)를 통해 문의 바랍니다.
      </p>
      <br><p>
      <hr style="width: 100%; border: groove 1px black;">
      <br><p>
      
      </div>
      <div>
      <h2>자주 묻는 질문</h2>
      </div>
      <ul>
      <li>
      <div>
      저작권이 있는 이미지 사용이 가능한가요?<br>
      </div>
      <div style="padding: 24px; color: #000; background-color: #fafafa; background-position: 0 0; background-repeat: no-repeat; display: block; margin: 15px;">
         Brand는 모든 저작권자를 존중합니다. 이미지의 저작권자 또는 원작자가 공공으로 쓸 수 있는 이미지라고
          명시했거나, 저작권이 만료된 이미지에 한해 사용이 가능합니다.
      </div>
      </li>
          <li>
          <div style="margin-right: 50px;">원하는 디자인을 의뢰할 수 있나요?
          </div>
          <div style="padding: 24px; color: #000; background-color: #fafafa; background-position: 0 0; background-repeat: no-repeat; display: block; margin: 15px;">Brand는 고객 맞춤 디자인을 제공하지 않습니다.<br>
             단, 업로드 한 이미지의 배경 제거 및 로고 컬러 수정 등 원활한 인쇄 작업을 위한 간단한 수정만 제공합니다.
          </div>
          </li>
          <li>
          <div >배경 제거가 가능한가요?
          </div>
          <div style="padding: 24px; color: #000; background-color: #fafafa; background-position: 0 0; background-repeat: no-repeat; display: block; margin: 15px;">가능합니다. 주문 시 [배경 지우기] 요청에 체크 후 주문해주세요.<br>
          배경 제거가 불가한 경우 별도로 연락드립니다.
          </div>
          </li>
          <li>
          <div >인쇄 가능한 영역을 벗어났다는 메시지가 확인됩니다.
          </div>
          <div style="padding: 24px; color: #000; background-color: #fafafa; background-position: 0 0; background-repeat: no-repeat; display: block; margin: 15px;">올려주신 이미지 또는 텍스트가 인쇄 영역보다 크게 삽입되었을 경우 팝업 되는 메시지입니다.<br>
          이미지 또는 텍스트 크기를 줄여서 인쇄 영역 안으로 이미지를 조정해주세요.
          </div>
          </li>
          <li>
          <div>AI나 PSD 파일로 제작할 수 있나요?
          </div>
          <div style="padding: 24px; color: #000; background-color: #fafafa; background-position: 0 0; background-repeat: no-repeat; display: block; margin: 15px;">가능합니다. 주문 후 원본 파일을<a href="guddn108@naver.com">guddn108@naver.com</a>으로
          전송해주시면 원본 파일로 보다 깔끔한 제작이 가능합니다.
          </div>
          </li>
          <li>
          <div>자수로 제작하고 싶어요.
          </div>
          <div style="padding: 24px; color: #000; background-color: #fafafa; background-position: 0 0; background-repeat: no-repeat; display: block; margin: 15px;">자수의 경우 주문 시 [상품 제작 요청사항] 메모를 남겨 주시면, 디자인 검토 후 가능 여부를 알려드리며,
          추가 비용이 발생할 수 있습니다.
          </div>
       </li>
        </ul>
    </div>
          
<!--     여기까지 -->
   <div border="1" style="width: 992px; margin: 70px auto 50px; text-align: center; display: block; font-size: 14px;">
      <input type="button" value="배송안내" onclick="window.open('delivery','배송안내','width=900,height=700')" style="width: 300px; height: 50px; margin-right: 100px;">
      <input type="button" value="품질보증/청약철회 안내" onclick="window.open('quality','배송안내','width=900,height=700')" style="width: 300px; height: 50px; margin-right: 80px;">
   </div>
      
   <form id="form">
   <input type="file" id="file" name="file" onchange="changeValue(this)" style="display:none; "/>
   </form>
   <!-- 일부분 부분-->
   <!-- 결과화면을 그려줄 canvas -->
   <canvas id="canvas" width="900" height="600"
      style="border: 1px solid #d3d3d3; display:none;">
   </canvas>
   
   <form name="changeopen">
      <input type="hidden" name="change_val" id="change_val" value="${img_goods}">
      <input type="hidden" name="start" value="0">
      <input type="hidden" name="end" value="9">
   </form>
   
   <form name="design_review_form" method="post" action="review">
      <input type="hidden" name="review_text" id="review_text" value="${img_name}">
   </form>
   <form action='design' name='design_fimg' method='post'>"
   <input type='hidden' name='imgname' id="op_product">
   <input type='hidden' name='imgmoney' id="op_price">
   <input type='hidden' name='imggoods' id="op_type">
   <input type='submit' style='display:none;' id='bmit'>
   </form>
      
   <jsp:include page="../default/footer.jsp"/>
</body>
</html>