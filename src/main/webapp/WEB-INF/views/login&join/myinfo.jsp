
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/util.css?after">
<link rel="stylesheet" type="text/css" href="resources/css/main.css?after">
<script type="text/javascript" src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>Insert title here</title>
<style type="text/css">
#Progress_Loading
{
 position: absolute;
 left: 40%;
 top:10px;
 background: none;
 width: 200px;
 height: 200px;
}
</style>
</head>
<body>
<iframe src="http://nid.naver.com/nidlogin.logout" style="visibility:hidden;display:none"></iframe>
<script type="text/javascript">
$(function () {
   $("#Delbutton").click(function(){ 
         
       Swal.fire({
            title: '아이디를 삭제하시겠습니까?',
            text: '선택하신 아이디 : ${myinfo_list.id}를 정말 삭제하시겠습니까?',
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
                     location.href="DelUser?idval=${myinfo_list.id},myinfo"
                 }
              })
            }
          })
    });
})

$(document).ready(function(){
      $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
   })
function deltoken(){
   $.ajax({
      url:"deltoken",
      type:"GET",
   success: function(){
      location.href="nid.naver.com/oauth2.0/token?grant_type=delete&client_id=Kw8vD_2MRNtNf4TERrlM&client_secret=nfGVNN_nu7&access_token="
         + "AAAAN_LCbVdhtfBQxzlMnQ2eqTVupLkpDvSCH4p7AzX6pOEu8Km7G0722fmlWmrn9haz_6BRsm_4X_DNGYoadZNOO7k&service_provider=NAVER";
      
   },error: function(){
      alert("문제가 발생했습니다")
   }
   })
}
function pagereturn(){
   
   $.each(list,function(index,item){
      
   })
   
   $("#").html(html)
   
}

</script>


   <script type="text/javascript">
   function Special() {
      var cut = document.getElementById("id").value.split("")
      var sp = 0;
      for (i = 0; i < cut.length; i++) {
         if (('!' <= cut[i] && cut[i] <= '/')
               || (':' <= cut[i] && cut[i] <= '@')
               || ('[' <= cut[i] && cut[i] <= '\'')
               || ('{' <= cut[i] && cut[i] <= '~')) {
            sp = 1
         }
      }
      if (sp == 0) {
         document.getElementById("pw1").innerHTML = ""
         document.getElementById("pw1").style.color = "black"
      } else {

         document.getElementById("pw1").innerHTML = "ID 특수문자를 사용 불가"
         document.getElementById("pw1").style.color = "red"
         document.getElementById("id").value = ""
      }
   }
      function ch() {
         if (document.getElementById("id").value == "") {
            alert("아이디 칸이 비어있습니다.")
         }
      }
      function pwlengthch() {
         var r = 0
         var r1 = 0
         if (document.getElementById("pw").value.length < 8) {
            document.getElementById("pw1").innerHTML = "비밀번호는 8자리 이상입니다."
            document.getElementById("pw").value=""
         } else {
            cut = document.getElementById("pw").value.split("")
            for (i = 0; i < cut.length; i++) {
               if (('A' <= cut[i] && cut[i] <= 'Z') || ('a' <= cut[i] && cut[i] <= 'z')) {
                  r = 1
               }
               if (('!' <= cut[i] && cut[i] <= '/') || (':' <= cut[i] && cut[i] <= '@')
                     || ('[' <= cut[i] && cut[i] <= '\'') || ('{' <= cut[i] && cut[i] <= '~')) {
                  r1 = 1
               }
            }
            if (r == 1 && r1 == 1) {
               document.getElementById("pw1").innerHTML = "비밀번호 사용 가능합니다."
               document.getElementById("pw1").style.color = "black"
            }else{
               document.getElementById("pw1").innerHTML = "영어 또는 특수문자를 넣어 주세요"
               document.getElementById("pw1").style.color = "red"
               document.getElementById("pw").value=""
            }
         }
      }
   
      function pwch() {
         if (document.getElementById("pw").value != document.getElementById("pwc").value) {
            alert("비밀번호가 맞지 않습니다.")
            document.getElementById("pw").value=""
            document.getElementById("pwc").value=""
         }
      }
      
      function al() {
          if (document.getElementById("id").value == "" || document.getElementById("pw").value == ""
                ||document.getElementById("pwc").value == "" || document.getElementById("name").value == "" ||
                document.getElementById("post_postcode").value == "" || document.getElementById("post_address").value == "" || document.getElementById("sample6_address2").value == "" || document.getElementById("phon").value == "" ||
                document.getElementById("email").value == "") {
            if(document.getElementById("email_btn").value != "인증 메일 수정")
               alert("메일 인증이 필요합니다.")
             else
                alert("비어있는 칸이 존재합니다.")
          } else {
             Swal.fire({
                  title: '개인정보를 수정하시겠습니까?',
                  text: '정말 수정하시겠습니까?',
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, change it!'
             }).then((result) => {
                  if (result.value) {
                    Swal.fire({
                       title:'Success!',
                       text: '성공적으로 수정되었습니다!',
                       icon: 'success',
                      preConfirm:function(){
                         user.submit();
                       }
                    });
                  }
                }); 
          
          }
       }
       function eamil_k() {
          if($("#email_btn").val()=="인증 발급"){
             $('#Progress_Loading').show(); //첫 시작시 로딩바를 숨겨준다.
             $.ajax({
                   url : "mailSending",
                   type : "POST",
                   data : {email:$("#email").val(),ch:"인증"},
                   success : function(data) {
                      $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
                      alert("인증번호 보내졌습니다.")
                      $("#join_key_text").val(data);
                      $("#email_btn").val("인증 확인");
                   },
                   error : function() {
                      $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
                      alert('보내기 실패')
                   }
              })
          }else if($("#email_btn").val()=="인증 확인"){
             if($("#join_email_key").val()==$("#join_key_text").val()){
                alert("인증 완료")
                $("#email_btn").val("인증 메일 수정");
                $("#email_btn").attr("readonly","readonly")
                $("#email").attr("readonly","readonly")
             }else{
                alert("인증 실패")
                $("#email_btn").val("인증 발급");
             }
          }else{
             $("#email_btn").removeAttr("readonly")
            $("#email").removeAttr("readonly")
          }
         
    }
       
       
    function back() {
       history.back();
    }
   </script>
   
   
<!--    정보 수정 -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function post() {
   new daum.Postcode(
         {
            oncomplete : function(data) {
               var fullAddr = '';
               var extraAddr = '';

               if (data.userSelectedType === 'R') {
                  fullAddr = data.roadAddress;
               } else {
                  fullAddr = data.jibunAddress;
               }

               if (data.userSelectedType === 'R') {
                  if (data.bname !== '') {
                     extraAddr += data.bname;
                  }
                  if (data.buildingName !== '') {
                     extraAddr += (extraAddr !== '' ? ', '
                           + data.buildingName : data.buildingName);
                  }
                  fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                        + ')' : '');
               }

               document.getElementById('post_postcode').value = data.zonecode;
               alert(fullAddr)
               document.getElementById('post_address').value = fullAddr;

               document.getElementById('sample6_address2').focus();
            }
         }).open();
}
function deltoken(){
   $.ajax({
      url:"deltoken",
      type:"GET",
   success: function(){
      location.href="nid.naver.com/oauth2.0/token?grant_type=delete&client_id=Kw8vD_2MRNtNf4TERrlM&client_secret=nfGVNN_nu7&access_token="
         + "AAAAN_LCbVdhtfBQxzlMnQ2eqTVupLkpDvSCH4p7AzX6pOEu8Km7G0722fmlWmrn9haz_6BRsm_4X_DNGYoadZNOO7k&service_provider=NAVER";
      
   },error: function(){
      alert("문제가 발생했습니다")
   }
   })
}
function pagereturn(){
   
   $.each(list,function(index,item){
      
   })
   
   $("#").html(html)
   
}

</script>
   <div id = "Progress_Loading"><!-- 로딩바 -->
      <img style="width: 200px; height: 200px;" src="resources/img/Progress_Loading.gif"/>
   </div>
<div class="limiter">
      <div class="container-login100" align="center">
         <div class="wrap-login100" align="center">
         <h2>Self Design 정보 변경하기</h2><br>
<!--          <div class="login100-pic js-tilt" data-tilt> -->
<!--             <img src="resources/images/80678738_2416624028588147_5452304186879982403_n.jpg" alt="IMG"> -->
<!--          </div> -->
            <div align="center">
               
               <form action="info_change" name="user" style="align:center;">
      
               <div class="wrap-input100 validate-input" align="center">
                  <input type="text" id="id" placeholder="아이디" class=input100 name="id" value="${myinfo_list.id}" readonly="readonly" onchange="Special()">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"  style="text-align:right;"></i>
                  </span>
               </div>
               
                  
               <div class="wrap-input100 validate-input">
                  <input type="password" id="pw" placeholder="비밀번호" class="input100" onchange="pwlengthch()" name="pw" value="${myinfo_list.pw}">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               <div class="wrap-input100 validate-input">
                  <input type="password" id="pwc" placeholder="비밀번호 확인" class="input100"  onchange="pwch()" value="${myinfo_list.pw}">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               <div class="wrap-input100 validate-input">
                  <input type="text" id="name" placeholder="이름" class="input100" name="name" value="${myinfo_list.name}">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               
               
               
               <div style="display: flex; flex:row;">
                  <div class="wrap-input100 validate-input" style="width: 200px; margin-right: 20px;">
                     <input type="text" placeholder="우편번호" class="input100" id="post_postcode" name="addr1" readonly="readonly" value="${myinfo_list.addr1}">
                     <span class="focus-input100"></span>
                     <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                     </span>
                  </div>
                  <div align="center"><input type="button" value="우편번호 찾기" class="input1001" onclick="post()" onmouseover="style='cursor:pointer;'"></div>
               </div>
               <div class="wrap-input100 validate-input">
                  <input type="text" placeholder="주소" class="input100"  id="post_address" name="addr2" readonly="readonly" value="${myinfo_list.addr2}">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               <div class="wrap-input100 validate-input">
                  <input type="text" placeholder="상세주소" class="input100" id="sample6_address2" name="addr3" value="${myinfo_list.addr3}">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               
               
               
               <div class="wrap-input100 validate-input">
                  <input type="text" id="phon" placeholder="핸드폰번호 xxx-xxxx-xxxx" class="input100" name="phon" value="${myinfo_list.phon}">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               <div class="wrap-input100 validate-input">
                  <input readonly="readonly" type="text" id="email" placeholder="email@eamil" class="input100" name="email" id="email" value="${myinfo_list.email}">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               <div style="display: flex; flex:row;">
                  <div class="wrap-input100 validate-input" style="width: 200px; margin-right: 20px;">
<!--                      <span class="focus-input100"></span> -->
<!--                      <span class="symbol-input100"> -->
<!--                         <i class="fa fa-lock" aria-hidden="true"></i> -->
<!--                      </span> -->
                  </div>
               </div>
               <div style="display: flex; flex: row;">
               <div class="container-login100-form-btn">
            <input type="button" class="login100-form-btn-login" onclick="al()" value="정보수정">
         </div>
         <div class="container-login100-form-btn">
            <input type="button" class="login100-form-btn-login" id="Delbutton" value="회원탈퇴">
         </div>
         </div>
         <br>
            <a class="login100-form-btn-login"  href="index"><font color="white">뒤로가기</font></a>
         <label style="margin-right: 95px;" id="pw1"></label><br>
         <label style="margin-right: 95px;" id="pwc2"></label><br>
         
      </form>
   </div>
      
   </div>
   </div>
   </div>
   
   <script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
   <script src="resources/vendor/bootstrap/js/popper.js"></script>
   <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="resources/vendor/select2/select2.min.js"></script>
   <script src="resources/vendor/tilt/tilt.jquery.min.js"></script>
   <script >
      $('.js-tilt').tilt({
         scale: 1.1
      })
   </script>
   <script src="resources/js/main.js"></script>
   
</body>
</html>