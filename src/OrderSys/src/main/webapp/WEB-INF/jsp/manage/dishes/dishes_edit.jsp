<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="dishes/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DISHES_ID" id="DISHES_ID" value="${pd.DISHES_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属分类:</td>
								<td>
									<select class="chosen-select form-control" name="MENU_CATEGORIES_ID" id="MENU_CATEGORIES_ID" style="width: 98%;">
										<c:forEach items="${varList}" var="var" varStatus="vs">
											<option value="${var.MENU_CATEGORIES_ID}">${var.MENU_CATEGORIES_NAME}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜品名称:</td>
								<td><input type="text" name="DISHES_NAME" id="DISHES_NAME" value="${pd.DISHES_NAME}" maxlength="50" placeholder="这里输入菜品名称" title="菜品名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜品简介:</td>
								<td>
									<textarea name="DISHES_SYNOPSIS" id="DISHES_SYNOPSIS" placeholder="这里输入菜品简介" title="菜品简介" style="height:80px;width:98%;">${pd.DISHES_SYNOPSIS}</textarea>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜单详情:</td>
								<td>
									<textarea name="DISHES_DETAILS" id="DISHES_DETAILS" placeholder="这里输入菜单详情" title="菜单详情" style="height:80px;width:98%;">${pd.DISHES_DETAILS}</textarea>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否推荐菜品:</td>
								<td>
									<select class="chosen-select form-control" name="IS_RECOMMEND" id="IS_RECOMMEND" style="width: 98%;">
										<option value="">请选择是否推荐该菜品</option>
										<option value="1">是</option>
										<option value="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td>
									<select class="chosen-select form-control" name="IS_EXISTENCE" id="IS_EXISTENCE" style="width: 98%;">
										<option value="">请选择当天是否有该菜品</option>
										<option value="1">有</option>
										<option value="0">没有</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜品价格:</td>
								<td><input type="number" name="DISHES_PRICE" id="DISHES_PRICE" value="${pd.DISHES_PRICE}" maxlength="32" placeholder="这里输入菜品价格" title="菜品价格" style="width:98%;"/></td>
							</tr>
							<input hidden type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}"/>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());

		$(function () {
			$("#MENU_CATEGORIES_ID").val('${pd.MENU_CATEGORIES_ID}');
			$("#IS_RECOMMEND").val('${pd.IS_RECOMMEND}');
			$("#IS_EXISTENCE").val('${pd.IS_EXISTENCE}');
		})
		//保存
		function save(){
			if($("#DISHES_NAME").val()==""){
				$("#DISHES_NAME").tips({
					side:3,
		            msg:'请输入菜品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISHES_NAME").focus();
			return false;
			}
			if($("#DISHES_SYNOPSIS").val()==""){
				$("#DISHES_SYNOPSIS").tips({
					side:3,
		            msg:'请输入菜品简介',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISHES_SYNOPSIS").focus();
			return false;
			}
			if($("#DISHES_DETAILS").val()==""){
				$("#DISHES_DETAILS").tips({
					side:3,
		            msg:'请输入菜单详情',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISHES_DETAILS").focus();
			return false;
			}
			if($("#IS_RECOMMEND").val()==""){
				$("#IS_RECOMMEND").tips({
					side:3,
		            msg:'请输入是否推荐菜品',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_RECOMMEND").focus();
			return false;
			}
			if($("#DISHES_PRICE").val()==""){
				$("#DISHES_PRICE").tips({
					side:3,
		            msg:'请输入菜品价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISHES_PRICE").focus();
			return false;
			}
			if($("#IS_EXISTENCE").val()==""){
				$("#IS_EXISTENCE").tips({
					side:3,
		            msg:'请输入状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_EXISTENCE").focus();
			return false;
			}
			if($("#MENU_CATEGORIES_ID").val()==""){
				$("#MENU_CATEGORIES_ID").tips({
					side:3,
		            msg:'请输入菜品分类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MENU_CATEGORIES_ID").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		</script>
</body>
</html>