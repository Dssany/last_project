<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.earring_box {
   width: 800px;
   height: 600px;
   display: flex;
   flex: row;
   margin-right: 50px;
}

.earring_box2 {
   width: 500px;
   height: 500px;
   display: flex;
   flex: colum;
}

.earring_img1 {
   width: 600px;
   height: 600px;
   padding-right: 10px;
}

.earring_img2 {
   width: 100px;
   height: 100px;
   margin-top: 10px;
}
/* .btn {  */
/*    display:block;  */
/*    width:70px;  */
/*    height:40px;  */
/*    line-height:40px;  */
/*    border:1px gray solid;  */
/*    margin:15px auto;  */
/*    background-color:white;  */
/*    cursor: pointer;  */
/*    color:#333;  */
/*    transition:all 0.9s, color 0.3;  */
/*    }  */
/* .btn:hover{color:#fff;} */
/* .hover1:hover{ box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; } */
/* #layout {  */
/*   color:#FFF;  */
/*   width: 400px; */
/*   height: 300px;  */
/* } */
.earring_stars {
  z-index: 0; position: absolute;
  background-image: url(   http://www.14denoviembre.es/img/hori.png ), url( http://www.14denoviembre.es/img/stars_5.png );
  background-repeat: repeat-x,repeat-x repeat-y;
  transform:translate3D(0em, 0em, 0);
  animation: stars 21s ease; 
  transform-style: preserve-3d;
  display: none;
  
}
.earring_content {
  height: 60px;
  width: 100px;
  margin: 15px;
  border-radius: 10px;
}

@keyframes bounce {
  0%, 100%, 20%, 53%, 80% {
    transition-timing-function: cubic-bezier(0.215, .61, .355, 1);
    transform: translate3d(0, 0, 0)
  }
  40%,
  43% {
    transition-timing-function: cubic-bezier(0.755, .050, .855, .060);
    transform: translate3d(0, -30px, 0)
  }
  70% {
    transition-timing-function: cubic-bezier(0.755, .050, .855, .060);
    transform: translate3d(0, -15px, 0)
  }
  90% {
    transform: translate3d(0, -4px, 0)
  }
}

.bounce {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-name: bounce;
  transform-origin: center bottom
}

@keyframes hinge {
  0% {
    transform-origin: top left;
    animation-timing-function: ease-in-out
  }
  20%,
  60% {
    transform: rotate3d(0, 0, 1, 80deg);
    transform-origin: top left;
    animation-timing-function: ease-in-out
  }
  40%,
  80% {
    transform: rotate3d(0, 0, 1, 60deg);
    transform-origin: top left;
    animation-timing-function: ease-in-out;
    opacity: 1
  }
  100% {
    transform: translate3d(0, 700px, 0);
    opacity: 0
  }
}

.hinge {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-name: hinge
}

@keyframes shake {
  0%, 100% {
    transform: translate3d(0, 0, 0)
  }
  10%,
  30%,
  50%,
  70%,
  90% {
    transform: translate3d(-10px, 0, 0)
  }
  20%,
  40%,
  60%,
  80% {
    transform: translate3d(10px, 0, 0)
  }
}

.shake {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-name: shake
}

@keyframes fadeOut {
  0% {
    opacity: 1
  }
  100% {
    opacity: 0
  }
}

.fadeOut {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-name: fadeOut
}

@keyframes zoomIn {
  0% {
    opacity: 0;
    transform: scale3d(.3, .3, .3)
  }
  50% {
    opacity: 1
  }
}

.zoomIn {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-name: zoomIn
}

@keyframes zoomInLeft {
  0% {
    opacity: 0;
    transform: scale3d(.1, .1, .1) translate3d(-1000px, 0, 0);
    animation-timing-function: cubic-bezier(0.55, .055, .675, .19)
  }
  60% {
    opacity: 1;
    transform: scale3d(.475, .475, .475) translate3d(10px, 0, 0);
    animation-timing-function: cubic-bezier(0.175, .885, .32, 1)
  }
}

.zoomInLeft {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-name: zoomInLeft
}

@keyframes slideOutLeft {
  0% {
    transform: translate3d(0, 0, 0)
  }
  100% {
    visibility: hidden;
    transform: translate3d(-100%, 0, 0)
  }
}

.slideOutLeft {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-name: slideOutLeft
}

@keyframes zoomInDown {
  0% {
    opacity: 0;
    transform: scale3d(.1, .1, .1) translate3d(0, -1000px, 0);
    animation-timing-function: cubic-bezier(0.55, .055, .675, .19)
  }
  60% {
    opacity: 1;
    transform: scale3d(.475, .475, .475) translate3d(0, 60px, 0);
    animation-timing-function: cubic-bezier(0.175, .885, .32, 1)
  }
}

.zoomInDown {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-name: zoomInDown
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/jquery-3.2.1.min.js"></script>
<script src="resources/jquery.form.min.js"></script>
<script src="resources/jquery-1.12.1-ui.js"></script>
<script src="resources/html2canvas.js"></script>
<script type="text/javascript">

   handleMouseOver = (element, key) => {
     console.log(element, key)
     element.className = "earring_content "+key;
     element.addEventListener("animationend", () => {
       element.className = "earring_content";
     });
   }
   
   setInterval(function(){
     $(".blinkEle").toggle();
   }, 250);
   
   function imgch(t) {
      $("#earring_main_img").attr("src", $(t).attr("src"));
   }
       function background_ch() {
          design_fimg.submit();
      }
       function change() {
           var changeop = document.changeopen;
           
           var popupX = (window.screen.width / 2) - (1300 / 2);
           var popupY= (window.screen.height /2) - (850 / 2);
           openWin = window.open("",
              "changeopen", 'status=no, height=750, width=1100, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY + ", resizable = no, scrollbars = no");    
           changeop.action="change";
           changeop.method="post";
           changeop.target="changeopen";
           changeop.submit();
        }
   function re_view() {
      earring_review_form.submit();
   }
   var size='${earring_list_img.size()}';
   var img=${earring_list_img};
   var price=${earring_list_price};
   var product=${earring_list_product};
   $(function(){
      $("#earring_main").append("<img class='earring_img1' src='"+img[0]+"' id='earring_main_img'>");
      for(i=0;i<size;i++){
         $("#earring_sub").append("<img class='earring_img2' src='"+img[i]+"' onmouseover='imgch(this)'>");
         if(i!=parseInt(size)-1){
            $("#earring_sub").append("<br>");
         }
      }
   });
   function earring_cart() {
      alert("장바구니?")
      if("${sessionScope.id}"!=""){
      ss=${earring_list_product.get(0)};
         uimg="resources/img/earring pitting/"+ss+".webp";
             n=${earring_list_product.get(0)}
             m=${earring_list_price.get(0)}
             ty='earring'
             $.ajax({
                url : "userimg_insert",
                type : "POST",
                data : {userimg_in:uimg,imgname:n,imgmoney:m,type:ty},
                success : function(result) {
                   alert('장바구니 저장 성공');
                   location.href='cart';
                },
                error : function() {
                   alert('장바구니 저장 실패');
                }
             });
      }else{
            alert("로그인 해주세요");
         }
      }

   
   (function() {
      /**
         author: @manufosela
         2013/08/27    copyleft 2013

         ShootingStar class Main Methods:
         launch: launch shooting stars every N seconds received by              param. 10 seconds by default.
          launchStar: launch a shooting star. Received options                  object by param with:
                   - dir (direction between 0 and 1)
                   - life (between 100 and 400)
                   - beamSize (between 400 and 700)
                   - velocity (between 2 and 10)
      **/

      ShootingStar = function(id) {
        this.n = 0;
        this.m = 0;
        this.defaultOptions = {
          velocity: 8,
          starSize: 10,
          life: 300,
          beamSize: 400,
          dir: -1
        };
        this.options = {};
        id = (typeof id != "undefined") ? id : "";
        this.capa = ($(id).lenght > 0) ? "body" : id;
        this.wW = $(this.capa).innerWidth();
        this.hW = $(this.capa).innerHeight();
      };

      ShootingStar.prototype.addBeamPart = function(x, y) {
        this.n++;
        var name = this.getRandom(100, 1);
        $("#star" + name).remove();
        $(this.capa).append("<div id='star" + name + "'></div>");
        $("#star" + name).append("<div id='haz" + this.n + "' class='haz' style='position:absolute; color:#FF0; width:10px; height:10px; font-weight:bold; font-size:" + this.options.starSize + "px'>·</div>");
        if (this.n > 1) $("#haz" + (this.n - 1)).css({
          color: "rgba(255,255,255,0.5)"
        });
        $("#haz" + this.n).css({
          top: y + this.n,
          left: x + (this.n * this.options.dir)
        });
      }

      ShootingStar.prototype.delTrozoHaz = function() {
        this.m++;
        $("#haz" + this.m).animate({
          opacity: 0
        }, 75);
        if (this.m >= this.options.beamSize) {
          $("#ShootingStarParams").fadeOut("slow");
        }
      }

      ShootingStar.prototype.getRandom = function(max, min) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
      }

      ShootingStar.prototype.toType = function(obj) {
        if (typeof obj === "undefined") {
          return "undefined"; /* consider: typeof null === object */
        }
        if (obj === null) {
          return "null";
        }
        var type = Object.prototype.toString.call(obj).match(/^\[object\s(.*)\]$/)[1] || '';
        switch (type) {
          case 'Number':
            if (isNaN(obj)) {
              return "nan";
            } else {
              return "number";
            }
          case 'String':
          case 'Boolean':
          case 'Array':
          case 'Date':
          case 'RegExp':
          case 'Function':
            return type.toLowerCase();
        }
        if (typeof obj === "object") {
          return "object";
        }
        return undefined;
      }

      ShootingStar.prototype.launchStar = function(options) {
        if (this.toType(options) != "object") {
          options = {};
        }
        this.options = $.extend({}, this.defaultOptions, options);
        this.n = 0;
        this.m = 0;
        var i = 0,
          l = this.options.beamSize,
          x = this.getRandom(this.wW - this.options.beamSize - 100, 100),
          y = this.getRandom(this.hW - this.options.beamSize - 100, 100),
          self = this;
        for (; i < l; i++) {
          setTimeout(function() {
            self.addBeamPart(x, y);
          }, self.options.life + (i * self.options.velocity));
        }
        for (i = 0; i < l; i++) {
          setTimeout(function() {
            self.delTrozoHaz()
          }, self.options.beamSize + (i * self.options.velocity));
        }
        $("#ShootingStarParams").html("Launching shooting star. PARAMS: wW: " + this.wW + " - hW: " + this.hW + " - life: " + this.options.life + " - beamSize: " + this.options.beamSize + " - velocity: " + this.options.velocity);
        $("#ShootingStarParams").fadeIn("slow");
      }

      ShootingStar.prototype.launch = function(everyTime) {
        if (this.toType(everyTime) != "number") {
          everyTime = 10;
        }
        everyTime = everyTime * 1000;
        this.launchStar();
        var self = this;
        setInterval(function() {
          var options = {
            dir: (self.getRandom(1, 0)) ? 1 : -1,
            life: self.getRandom(400, 100),
            beamSize: self.getRandom(700, 400),
            velocity: self.getRandom(10, 4)
          }
          self.launchStar(options);
        }, everyTime);
      }

    })();

    $(document).ready(function() {
      var shootingStarObj = new ShootingStar("body");
      shootingStarObj.launch();
    });
</script>
</head>

<body>
   <jsp:include page="../default/header.jsp" />
   <div align="center"
      style="width: 1230px; margin-left: 100px; margin: 0 auto; margin-top: 150px; display: flex; flex: row;">
      
      <div class="earring_box">

         <div id="earring_main"></div>
         <div id="earring_sub"></div>
         

      </div>
      
      <div class="earring_box2">
         <div align="left" style="width: 100%; height: 100%;">
            <div style="text-align: left; font-size: 20px;">
               <div>
               <div style="margin-bottom: 30px;">
               <span style="overflow:hidden; line-height:0; font-size:0; text-indent:-1000px;">test</span>
               <span class="blinkEle" style="background: pink; border: 3px;">best!</span>
               </div>
               <label style="font-size: 20px; font-weight: bolder; margin-left: 110px;">${earring_list_product.get(0)}</label><br>
               </div>
               <hr style="border: solid 3px gray; ">
               가&nbsp;&nbsp;&nbsp;격 : <label style="font-size: 20px; font-weight: bolder; margin-left: 30px;">${earring_list_price.get(0)}</label>
                  <br>
            </div>
            <div style="margin-top: 20px;">
            <button
               style="border: 1px solid gray; background-color: rgba(0, 0, 0, 0); color: black; padding: 5px;"
               type="button" onclick="change()">상품 변경</button>
            <button
               style="border: 1px solid gray; background-color: rgba(0, 0, 0, 0); color: black; padding: 5px;"
               type="button" onclick="re_view()">리뷰 보기 및 등록</button>
            <br>
            </div>
            <br>
            <div style="display: flex; flex: row;">
               <div id="layout" class="earring_stars" >
                 <div id="ShootingStarParams"></div>
                 </div>
                    <div>
                 <div class="earring_content" style="background-color:#1F8DD6;" onmouseover="handleMouseOver(this, 'bounce')"></div>
                     <div class="earring_content" style="background-color:#FBB44C;" onmouseover="handleMouseOver(this, 'shake')"></div>
                     <div class="earring_content" style="background-color:#2ABB9B;" onmouseover="handleMouseOver(this, 'fadeOut')"></div>
                     <div class="earring_content" style="background-color:#6EB6E5;" onmouseover="handleMouseOver(this, 'zoomIn')"></div>
                  </div>
                  <div>
                    <div class="earring_content" style="background-color:#FC797A;" onmouseover="handleMouseOver(this, 'hinge')"></div>
                  <div class="earring_content" style="background-color:#FFDA72;" onmouseover="handleMouseOver(this, 'zoomInLeft')"></div>
                  <div class="earring_content" style="background-color:#FF9672;" onmouseover="handleMouseOver(this, 'slideOutLeft')"></div>
                  <div class="earring_content" style="background-color:#68E9AB;" onmouseover="handleMouseOver(this, 'zoomInDown')"></div>
                  </div>
            </div>
            <button type="button" onclick="earring_cart()"
               style="width: 400px; background-color: black; height: 50px; margin-top: 20px; ">
               <font color="white" size="4">장바구니 담기</font>
            </button>
         </div>
      </div>
   </div>
   <br><br><br><br><br>
   <div><jsp:include page="../default/footer.jsp" /></div>

   <form name="changeopen">
      <input type="hidden" name="change_val" id="change_val"
         value="${img_goods}"> <input type="hidden" name="start"
         value="0"> <input type="hidden" name="end" value="9">
   </form>
   <form action='design' name='design_fimg' method='post'>
      " <input type='hidden' name='imgname' id="op_product"> <input
         type='hidden' name='imgmoney' id="op_price"> <input
         type='hidden' name='imggoods' id="op_type"> <input
         type='submit' style='display: none;' id='bmit'>
   </form>
   <form name="earring_review_form" method="post" action="review">
      <input type="hidden" name="review_text" id="review_text"
         value="${earring_list_product.get(0)}">
   </form>
   
</body>
</html>