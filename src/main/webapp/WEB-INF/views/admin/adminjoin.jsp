
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png"
   href="resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
   href="resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
   href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/util.css?after">
<link rel="stylesheet" type="text/css"
   href="resources/css/main.css?after">
<script type="text/javascript"
   src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#Progress_Loading {
   position: absolute;
   left: 40%;
   top: 10px;
   background: none;
   width: 200px;
   height: 200px;
}

.input1001 {
   font-family: Poppins-Medium;
   font-size: 15px;
   line-height: 1.5;
   color: #666666;
   display: block;
   width: 150px;
   background: #e6e6e6;
   height: 50px;
   border-radius: 25px;
   padding: 0 30px 0 30px;
   outline: none;
   border: none;
   text-align: center;
}
</style>
</head>
<body>
   <iframe src="http://nid.naver.com/nidlogin.logout"
      style="visibility: hidden; display: none"></iframe>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        fullAddr += (extraAddr !== '' ? ' ('
                              + extraAddr + ')' : '');
                     }

                     document.getElementById('post_postcode').value = data.zonecode;
                     alert(fullAddr)
                     document.getElementById('post_address').value = fullAddr;

                     document.getElementById('sample6_address2').focus();
                  }
               }).open();
      }
      function deltoken() {
         $
               .ajax({
                  url : "deltoken",
                  type : "GET",
                  success : function() {
                     location.href = "nid.naver.com/oauth2.0/token?grant_type=delete&client_id=Kw8vD_2MRNtNf4TERrlM&client_secret=nfGVNN_nu7&access_token="
                           + "AAAAN_LCbVdhtfBQxzlMnQ2eqTVupLkpDvSCH4p7AzX6pOEu8Km7G0722fmlWmrn9haz_6BRsm_4X_DNGYoadZNOO7k&service_provider=NAVER";

                  },
                  error : function() {
                     alert("문제가 발생했습니다")
                  }
               })
      }
      function pagereturn() {

         $.each(list, function(index, item) {

         })

         $("#").html(html)

      }
   </script>


   <script type="text/javascript">
      $(document).ready(function() {
         $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
      })
      function pwlengthch() {
         var r = 0
         var r1 = 0
         if (document.getElementById("pw").value.length < 8) {
            document.getElementById("pw1").innerHTML = "비밀번호는 8자리 이상입니다."
            document.getElementById("pw").value = ""
         } else {
            cut = document.getElementById("pw").value.split("")
            for (i = 0; i < cut.length; i++) {
               if (('A' <= cut[i] && cut[i] <= 'Z')
                     || ('a' <= cut[i] && cut[i] <= 'z')) {
                  r = 1
               }
               if (('!' <= cut[i] && cut[i] <= '/')
                     || (':' <= cut[i] && cut[i] <= '@')
                     || ('[' <= cut[i] && cut[i] <= '\'')
                     || ('{' <= cut[i] && cut[i] <= '~')) {
                  r1 = 1
               }
            }
            if (r == 1 && r1 == 1) {
               document.getElementById("pw1").innerHTML = "비밀번호 사용 가능합니다."
               document.getElementById("pw1").style.color = "black"
            } else {
               document.getElementById("pw1").innerHTML = "영어 또는 특수문자를 넣어 주세요"
               document.getElementById("pw1").style.color = "red"
               document.getElementById("pw").value = ""
            }
         }
      }

      function pwch() {
         if (document.getElementById("pw").value != document
               .getElementById("pwc").value) {
            alert("비밀번호가 맞지 않습니다.")
            document.getElementById("pw").value = ""
            document.getElementById("pwc").value = ""
         }
      }

      function al() {
         idtext = document.getElementById("id").value;
         pwtext = document.getElementById("pw").value;
         if (idtext.includes(" ") || pwtext.includes(" ")) {
            alert("ID 또는 PW 에 띄어쓰기가 포함되어 있습니다.")
         } else if (document.getElementById("id").value == ""
               || document.getElementById("pw").value == ""
               || document.getElementById("pwc").value == ""
               || document.getElementById("name").value == ""
               || document.getElementById("post_postcode").value == ""
               || document.getElementById("post_address").value == ""
               || document.getElementById("sample6_address2").value == ""
               || document.getElementById("phon").value == ""
               || document.getElementById("email").value == ""
               || document.getElementById("email_btn").value != "인증 메일 수정") {
            if (document.getElementById("email_btn").value != "인증 메일 수정")
               alert("메일 인증이 필요합니다.")
            else
               alert("비어있는 칸이 존재합니다.")
         } else {
            user.submit()
         }
      }
      $(function() {
         a = "";
         if ('${NaverDto.id}' != "") {
            a = '${NaverDto.id}';
         } else if ('${GoogleId}' != "") {
            a = '${GoogleId}';
         }
         $("#id").val(a);
      });
      function eamil_k() {
         alert("인증번호 보내는 중")
         if ($("#email_btn").val() == "인증 발급") {
            $('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
            $.ajax({
               url : "mailSending",
               type : "POST",
               data : {
                  email : $("#email").val(),ch:"인증"
               },
               success : function(data) {
                  $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
                  alert("인증번호 보내졌습니다.")
                  $("#join_key_text").val(data);
                  $("#email_btn").val("인증 확인");
               },
               error : function() {
                  $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
                  alert('보내기 실패')
               }
            })
         } else if ($("#email_btn").val() == "인증 확인") {
            if ($("#join_email_key").val() == $("#join_key_text").val()) {
               alert("인증 완료")
               $("#email_btn").val("인증 메일 수정");
               $("#email_btn").attr("readonly", "readonly")
               $("#email").attr("readonly", "readonly")
            } else {
               alert("인증 실패")
               $("#email_btn").val("인증 발급");
            }
         } else {
            $("#email_btn").removeAttr("readonly")
            $("#email").removeAttr("readonly")
         }

      }
   </script>
   <div id="Progress_Loading">
      <!-- 로딩바 -->
      <img style="width: 200px; height: 200px;"
         src="resources/img/Progress_Loading.gif" />
   </div>
   <!--    회원가입 -->
   <div class="limiter">
      <div class="container-login100" align="center">
         <div class="wrap-login100" align="center">
            <h2>Self Design 계정 만들기</h2>
            <br>
            <!--          <div class="login100-pic js-tilt" data-tilt> -->
            <!--             <img src="resources/images/80678738_2416624028588147_5452304186879982403_n.jpg" alt="IMG"> -->
            <!--          </div> -->
            <div align="center">

               <form action="joinok" name="user" style="align: center;">

                  <div class="wrap-input100 validate-input" align="center">
                     <input type="text" id="id" placeholder="아이디" class=input100
                        name="id"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"
                        style="text-align: right;"></i>
                     </span>
                  </div>


                  <div class="wrap-input100 validate-input">
                     <input type="text" id="pw" placeholder="비밀번호" class="input100"
                        onchange="pwlengthch()" name="pw"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                     </span>
                  </div>
                  <div class="wrap-input100 validate-input">
                     <input type="text" id="pwc" placeholder="비밀번호 확인"
                        class="input100" onchange="pwch()"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                     </span>
                  </div>
                  <div class="wrap-input100 validate-input">
                     <input type="text" id="name" placeholder="이름" class="input100"
                        name="name" value="${NaverDto.name }"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                     </span>
                  </div>



                  <div style="display: flex; flex: row;">
                     <div class="wrap-input100 validate-input"
                        style="width: 200px; margin-right: 20px;">
                        <input type="text" placeholder="우편번호" class="input100"
                           id="post_postcode" name="addr1" readonly="readonly"> <span
                           class="focus-input100"></span> <span class="symbol-input100">
                           <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                     </div>
                     <div align="center">
                        <input type="button" value="우편번호 찾기" class="input1001"
                           onclick="post()" onmouseover="style='cursor:pointer;'">
                     </div>
                  </div>
                  <div class="wrap-input100 validate-input">
                     <input type="text" placeholder="주소" class="input100"
                        id="post_address" name="addr2" readonly="readonly"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                     </span>
                  </div>
                  <div class="wrap-input100 validate-input">
                     <input type="text" placeholder="상세주소" class="input100"
                        id="sample6_address2" name="addr3"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                     </span>
                  </div>



                  <div class="wrap-input100 validate-input">
                     <input type="text" id="phon" placeholder="핸드폰번호 xxx-xxxx-xxxx"
                        class="input100" name="phon"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                     </span>
                  </div>
                  <div class="wrap-input100 validate-input">
                     <input type="text" id="email" placeholder="email@eamil"
                        class="input100" name="email" id="email"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                     </span>
                  </div>
                  <div style="display: flex; flex: row;">
                     <div class="wrap-input100 validate-input"
                        style="width: 200px; margin-right: 20px;">
                        <input type="text" placeholder="인증번호" class="input100"
                           id="join_email_key" name="join_email_key"> <span
                           class="focus-input100"></span> <span class="symbol-input100">
                           <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                     </div>
                     <div align="center">
                        <input type="button" id="email_btn" value="인증 발급"
                           class="input1001" onclick="eamil_k()"
                           onmouseover="style='cursor:pointer;'">
                     </div>
                  </div>
                  <div class="container-login100-form-btn">
                     <div style="display: flex; flex: row;">
                        <input type="button" class="login100-form-btn-login"
                           style="width: 180px" onclick="al()" value="회원가입"> <input
                           type="button" class="login100-form-btn-login"
                           style="width: 180px" onclick="location.href='index'" value="취소">
                     </div>
                  </div>

                  <label id="pw1"></label><br>
               </form>
            </div>

         </div>
      </div>
   </div>
   <input type="hidden" id="join_key_text">
   <script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
   <script src="resources/vendor/bootstrap/js/popper.js"></script>
   <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="resources/vendor/select2/select2.min.js"></script>
   <script src="resources/vendor/tilt/tilt.jquery.min.js"></script>
   <script>
      $('.js-tilt').tilt({
         scale : 1.1
      })
   </script>
   <script src="resources/js/main.js"></script>

</body>
</html>