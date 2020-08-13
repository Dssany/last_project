<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="utf-8">
  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="resources/swiper/css/swiper.min.css">

  <!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 600px;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width:100%;
      height: 500px;

    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
 
  </style>
</head>
<body>
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
       <c:forEach var="bannerlist" items="${banner_list}">
      <div class="swiper-slide">
            <img src="${bannerlist.img }" style="width:100%;height:500px;">
      </div>
      </c:forEach>
<!--       <div class="swiper-slide"><img src="resources/img/banner2.jpg" style="width:100%;height:500px;"></div> -->
<!--       <div class="swiper-slide"><img src="resources/img/banner3.jpg" style="width:100%;height:500px;"></div> -->
<!--       <div class="swiper-slide"><img src="resources/img/banner4.jpg" style="width:100%;height:500px;"></div> -->
<!--       <div class="swiper-slide"><img src="resources/img/banner5.jpg" style="width:100%;height:500px;"></div> -->
<!--       <div class="swiper-slide"><img src="resources/img/banner6.jpg" style="width:100%;height:500px;"></div> -->
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>

  <!-- Swiper JS -->
  <script src="resources/swiper/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
</body>

</html>