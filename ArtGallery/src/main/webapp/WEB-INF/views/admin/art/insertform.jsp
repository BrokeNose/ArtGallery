<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 작성자 : hyung -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 작품</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style>
	.con_left {
		display: inline-block;
	}
	.left {
		float: left;
	}
	.footer {
	  position: relative;
	  bottom: 0;
	  width: 100%;
	  /* Set the fixed height of the footer here */
	  height: 60px;
	  line-height: 60px; /* Vertically center the text there */
	  background-color: #f5f5f5;
	}
	
	.footer > .container_f {	
	  padding-right: 15px;
	  padding-left: 15px;
	}
	
	code {
	  font-size: 80%;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="../inc/header.jsp">
		<jsp:param name="navMenu" value="art"/>
	</jsp:include>
	
	<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; 작품정보 </h4>
	<form class="form-horizontal" action="insert.do" method="post" enctype="multipart/form-data" id="insertForm">
		<input type="hidden" name="pageNum" value="${param.pageNum }"/>
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword }"/>
		<input type="hidden" name="searchCondition" value="${param.searchCondition }"/>
	
		<div class="panel panel-default">	  
			<div class="panel-body">	    
			  <div class="form-group">
			    	<label class="col-sm-2 control-label">작품명</label>
			    	<div class="col-sm-10">
			      		<input type="text" class="form-control" id="title" name="title">
			    	</div>
			  	</div>		  
			  	<div class="form-group">
			    	<label class="col-sm-2 control-label">제작년도</label>
			    	<div class="col-sm-10">
			    	  	<input type="text" class="form-control" id="createyear" name="createyear" maxlength="4">
			    	</div>
			 	</div>
			  	<div class="form-group">
			  		<label class="col-sm-2 control-label">사이즈</label>
					<div class="col-sm-10">			     
			 	 	 	<input type="text" class="form-control" id="artsize" name="artsize"  maxlength="80">
		 			</div>
			  	</div>
			  	<div class="form-group">
			  		<label class="col-sm-2 control-label">비고</label>
					<div class="col-sm-10">
				    	<textarea name="remark" id="remark" class="form-control" rows="8"></textarea>
					</div>
			  	</div>
			  	<div class="form-group">
			  		<label class="col-sm-2 control-label">서비스 이미지</label>
					<div class="col-sm-10">			     
			    		<input type="file" class="form-control" id="file" name="file">
		 			</div>
			  	</div>	
			</div>
			<div class="panel-footer">
			  	<div class="form-group">
				    <label for="" class="col-sm-2 control-label">작가명</label>
				    <div class="col-sm-8">
				    	<input type="hidden" id="artist" name="artist">
				    	<input type="text" class="form-control" id="artistTxt" name="artistTxt" readonly>
				    </div>
				   <button class="btn btn-default" type="button" id="btnModalA">선택</button>		    
				</div>
			  	<div class="form-group">	  		
				    <label class="col-sm-2 control-label">재료</label>
				    <div class="col-sm-8">
				    	<input type="hidden" id="material" name="material">
				    	<input type="text" class="form-control" id="materialTxt" name="materialTxt" readonly>
				    </div>
				   <button class="btn btn-default" type="button" id="btnModalM">선택</button>		    
				</div>
				<div class="form-group">	  		
				    <label class="col-sm-2 control-label">화파</label>
				    <div class="col-sm-8">	      
				      <input type="hidden" id="painter" name="painter">
				      <input type="text" class="form-control" id="painterTxt" name="painterTxt" readonly>
				    </div>
				   <button class="btn btn-default" type="button" id="btnModalP">선택</button>		    
				</div>	  
			</div>
		</div><!-- //panel  -->	
		<!-- button // -->
		<div class="text-center">
			<button type="button" class="btn btn-primary" id="btnSave">확인</button>
		  	<button type="button" class="btn btn-default" id="btnCancel">취소</button>
		</div>
		<!-- //button  -->
	</form>	
</div><!-- //container-fluid  -->

<!--  modal  -->
<div class="modal fade" id="modalRelForm">
	<!-- modal-lg  | default | modal-sm -->	
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">모달 닫기</span></button>
				<h4 class="modal-title">모달의 제목</h4>
			</div>   
				<input type="hidden" id="categoryCode"/>   
 				<div class="modal-body">
					<div class="row">
						<div class="col-xs-5">				
						    <label style="margin-left:30px;">검색어</label>
						    <input type="text"id="searchCategoryKeyword" name="searchCategoryKeyword">
						    <button type="button" class="btn btn-default" id="btnCategorySearch">검색</button><br />
							<select name="categoryList" id="categoryList" multiple style="width:300px;height:250px;margin-left:30px;">
								<option value="ii">ddd</option>
							</select>
						</div>
						<div class="col-xs-1">
							<br /><br />
							<button type="button" class="btn btn-default" id="btnCategorySelect">&raquo;</button><br /><br />
							<button type="button" class="btn btn-default" id="btnCategoryUnSelect">&laquo;</button>
						</div>
						<div class="col-xs-6">
							<h5>선택 연계 정보</h5>
							<select name="selCategoryList" id="selCategoryList" multiple style="width:300px;height:250px">
							
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="btnCategory">선택완료</button>
				</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../inc/footer.jsp" />
<script>
	var separator1="${separator1}";
	var separator2="${separator2}";
	
	$("#btnCancel").click(function(){
		var isOk=confirm("작성을 취소하시겠습니까?\r\n목록으로 되돌아갑니다.");
		if(isOk){
			history.back();
			return;
		}		
	});
	
	$("#btnSave").click(function(){
		var FileFilter = /\.(jpg|gif|tif|bmp|png)$/i;
		var extArray = new Array(".jpg", ".gif", ".tif", ".bmp", ".png");     
		
		if($("#title").val()<= '   '){
			alert('작품명을 입력바랍니다.');
			$("#title").focus();
			return;
		}
		if($("#file").val()<= '   '){
			alert('서비스 이미지를  선택바랍니다.');
			return;
		}
		
		if(!$("#file").val().match(FileFilter)){
			alert("다음 파일만 업로드가 가능합니다.\n\n"  + (extArray.join("  ")) + "\n\n 업로드할 파일을 "
				     + " 다시 선택하여 주세요.");
			return;
		}
		
		$("#insertForm").submit();
	});
	
	//-------------------------------------------------
	// 카테고리 연계 관련 처리 시작
	//-------------------------------------------------
	$("#btnModalA, #btnModalM, #btnModalP").click(function(){
		var btnId=$(this).attr("id");
		var code=btnId.substring(btnId.length-1, btnId.length);	// 카테고리 코드
		var categoryNm="";
		var category="";
		
		$("#categoryCode").val(code);
		if ( code == "A"){
			categoryNm="아티스트";
			category=$("#artist").val();
		}else if ( code == "M"){
			categoryNm="재료";
			category=$("#material").val();
		}else if ( code == "P"){
			categoryNm="화파";
			category=$("#painter").val();
		} 
		
		//초기화
		$(".modal-title").text(categoryNm + " 연계")
		$("#searchCategoryKeyword").val("");
		$("#categoryList").empty("");
		$("#selCategoryList").empty("");
		
		//선택된 연계정보 세팅
		//console.log(category);
		if ( category != undefined && category != '') {
			var items=category.split(separator1);
			for(var i=0; i<items.length; i++){
				var item=items[i].split(separator2);	
				$("#selCategoryList").append(new Option(item[1], item[0]));
			}
		}
		$("#modalRelForm").modal("show");
	});
	
	//연계 검색어 검색
	$("#btnCategorySearch").click(function(){
		var keyword=$("#searchCategoryKeyword").val();
		var code=$("#categoryCode").val();
		
		$("#categoryList").empty();
		$.ajax({
			url:"../category/categorySearchJson.do",
			method:"post",
			data:{"keyword":keyword,
				  "code": code},
			success:function(data) {
				$.each( data, function( idx, value ) {
					$('#categoryList').append(new Option(value.name ,value.seq+separator2+value.name));
				});
			}
		});
	});
		
	//연계 선택
	$("#btnCategorySelect").click(function(){
		var items=$("#categoryList").val();		//선택한 options array
		$.each(items, function(idx, value){
			var item=value.split(separator2);
			if ( funcDupcheck(item[0]) == false ) {
				$("#selCategoryList").append(new Option(item[1], item[0]));
			}
		});
	});
	
	// 선택 연계 중복 체크
	function funcDupcheck(item){
		var objs=$("#selCategoryList option");
		var size=$("#selCategoryList option").length;
		for(i=0; i<size; i++){
			if (item == objs.eq(i).val() ) {
				return true;
			}
		}
		return false;
	}
	
	// 연계선택 취소
	$("#btnCategoryUnSelect").click(function(){
		var objs=$("#selCategoryList option");
		var size=$("#selCategoryList option").length;
		//console.log(size);
		for(i=(size-1); i>=0; i--){
			//console.log(objs[i].selected + "==" + objs[i].value);
			if (objs[i].selected==true){
				$("#selCategoryList option[value='"+objs[i].value+"']").remove();
			}
		}
		
	});
	
	
	//연계선택완료
	$("#btnCategory").click(function(){
		console.log("#btnCategory");
		var code=$("#categoryCode").val();
		var objs=$("#selCategoryList option");
		var size=$("#selCategoryList option").length;
		var category='';
		var categoryTxt='';
	
		for(i=0; i<size; i++) {
			category += separator1 +objs[i].value +separator2+objs[i].text;
			categoryTxt += ','+objs[i].text;
		}
		console.log(category + " = " + categoryTxt);
		console.log(code);
		if (category !=''){
			category=category.substring(3, category.length);
			categoryTxt=categoryTxt.substring(1, categoryTxt.length);
		}
		if(code=='A'){
			$("#artist").val(category);
			$("#artistTxt").val(categoryTxt);
		}else if(code=='M'){
			$("#material").val(category);
			$("#materialTxt").val(categoryTxt);
		}else if(code=='P'){
			$("#painter").val(category);
			$("#painterTxt").val(categoryTxt);
		}
		
		$("#modalRelForm").modal("hide");
	});
	//-------------------------------------------------
	// 카테고리 연계 관련 처리 끝
	//-------------------------------------------------

</script>
</body>
</html>
