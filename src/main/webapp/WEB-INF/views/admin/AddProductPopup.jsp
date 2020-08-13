<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
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
.table {
      border-collapse: collapse;
      border-top: 3px solid #168;
      width:100%;
      height:100%;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
    text-align:center;
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
   
     .div1 {
   padding-top: 200px;
   padding-bottom: 100px;
   }
   .div2{
   padding-top: 40px;
   }
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">

$(document).ready(function() {
   $("#SubBtn").click(function(){
      var form =$("#FormData")[0];
      var data = new FormData(form);
      var product = $("#productInput").val();
      var price = $("#priceInput").val();
      var quantity = $("#quantityInput").val();
      
      if(product =="" || price=="" || quantity==""){
    	  Swal.fire({
    		  icon:'warning',
    		  title:'양식을 채워주세요!'
    	  });
    		  
      }else{
    	  
    	  Swal.fire({
              title: '상품을 등록하시겠습니까?',
              text: product+" "+price+"원 "+quantity+"개",
              icon: 'question',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: '등록'
         }).then((result) => {
              if (result.value) {
            	  $.ajax({
                      url: "AddProduct",
                      type: "POST",
                      data: data,
                      contentType : false,
                      processData : false,
                      success: function(data){
                    	  Swal.fire({
                              title:'success',
                              text: '상품이 성공적으로 등록되었습니다!',
                              icon: 'success',
                             preConfirm:function(){
                            	 window.close();
                              }
                           });
                          
                      },
                      error: function(){
                    	  Swal.fire({
                    		  title:'Fail',
                              text: '상품 등록중 오류가 발생하였습니다!',
                              icon: 'error',
                              preConfirm:function(){
                             	 window.close();
                               }
                    	  });
                          
                      }
            	  
            	  
            	 
              });
            };
    	 
      });
      
     
   }
   });
   
   $("#type").change(function(){
	      var type = $("#type option:selected").val();
	      console.log(type)
	      if(type =='earring pitting'){
	    	  console.log(type)
	    	  $("#singleUpload").css('display','none');
	    	  $("#multiUpload").removeAttr('style');
	    	  
	      }else{
	    	  console.log(type)
	    	  $("#singleUpload").removeAttr('style');
	    	  $("#multiUpload").css('display','none');
	      }
	      
	   });
   
   
  
   $(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});

   
   
});
   

</script>
</head>
<body>



<form method="post" enctype="multipart/form-data" id="FormData">
   <table border="1" class="table" id="hhh">
      <tr>
         <th>상품 이름 </th><th><input type="text" id="productInput" name="product"></th>
      </tr>
      <tr>
         <th>상품 가격 </th><th><input type="text" id="priceInput" name="price" numberonly="true"></th>
      </tr>
      <tr>
         <th>상품 수량 </th><th><input type="text" id="quantityInput" name="quantity" numberonly="true"></th>
      </tr>
      <tr>
         <th>상품 종류 </th>
         <th><select name="type" id="type">
         <option>종류를 선택하세요</option>
         <option value="bag pitting">가방</option>
         <option value="dress pitting">의류</option>
         <option value="earring pitting">귀걸이/귀찌</option>
         <option value="phon pitting">폰케이스</option>
         </select></th>
      </tr>
      <tr>
         <th>피팅 이미지 업로드</th>
         <th><input type="file" class="btn" id="File" name="File"/>
      </tr>
            <tr id="singleUpload">
            <th>디자인 이미지 업로드</th>
            <th><input type="file" class="btn" id="SingleDesignFile" name="SingleDesignFile"/>
            </tr>
      <tr style="display: none;" id="multiUpload">
         <th>디자인 이미지 업로드</th>
         <th><input type="file"  class="btn" id="DesignFile" name="DesignFile" multiple="multiple" />
  	 </tr>
  	 <tr>
         <th colspan="2"><input type="button" class="btn" value="등록" id="SubBtn"></th>
  	 </tr>
</table>

</form>
</body>
</html>