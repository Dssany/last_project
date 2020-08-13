<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
   if('${logstart}'=="로그인 해주세요"){
      alert('${logstart}');
   }
</script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
   <link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
   <link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
   <link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
   <link rel="stylesheet" type="text/css" href="resources/css/util.css">
   <link rel="stylesheet" type="text/css" href="resources/css/main.css">
   <script type="text/javascript" src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>


<title>Insert title here</title>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
<iframe src="http://nid.naver.com/nidlogin.logout" style="display:none"></iframe>
<iframe src="https://accounts.google.com/logout" style="display:none"></iframe>
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100">
         <span class="login100-form-title">
                  Member Login
               </span>
            <div class="login100-pic js-tilt" data-tilt>
            
               <img src="resources/images/80678738_2416624028588147_5452304186879982403_n.jpg" alt="IMG">
            </div>

            <form class="login100-form validate-form" action="loginchk" id="cInput">
               

               <div class="wrap-input100 validate-input" data-validate = "id is required">
                  <input class="input100" type="text" name="id" placeholder="아이디를 입력하세요"> 
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-envelope" aria-hidden="true"></i>
                  </span>
               </div>

               <div class="wrap-input100 validate-input" data-validate = "Password is required">
                  <input class="input100" type="password" name="pw" placeholder="비밀번호를 입력하세요">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               
               <div class="container-login100-form-btn">
                  <button class="login100-form-btn-login" onclick="setParentText()">
                     Login
                  </button>
               </div>
            
               <div class="container-login100-form-btn">
                  <button class="login100-form-btn-naver" onclick="location.href='${url }'">
                     Naver 회원가입
                  </button>
               </div>
               
               <div class="container-login100-form-btn">
                  <button class="login100-form-btn-facebook" onclick="location.href='google'">
                     GOOGLE 회원가입
                  </button>
               </div>
               

               <div class="text-center p-t-136">
                  <a class="txt2" href="join">
                     Create your Account
                     <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                  </a>
               </div>
               <div class="text-center p-t-136">
                  <a class="txt2" href="infosearch">
                     Find ID or PW
                     <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                  </a>
               </div>
            </form>
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