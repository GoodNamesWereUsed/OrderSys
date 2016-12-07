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
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
									<input disabled type="text" value="${pd.MENU_CATEGORIES_NAME}" style="width:98%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜品名称:</td>
								<td><input disabled type="text" value="${pd.DISHES_NAME}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜品简介:</td>
								<td>
									<textarea disabled style="height:80px;width:98%;">${pd.DISHES_SYNOPSIS}</textarea>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜单详情:</td>
								<td>
									<textarea disabled style="height:80px;width:98%;">${pd.DISHES_DETAILS}</textarea>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否推荐菜品:</td>
								<td>
									<c:if test="${pd.IS_RECOMMEND == 1}">
										<input disabled type="text" value="是" style="width:98%;"/>
									</c:if>
									<c:if test="${pd.IS_RECOMMEND == 0}">
										<input disabled type="text" value="否" style="width:98%;"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td>
									<c:if test="${pd.IS_RECOMMEND == 1}">
										<input disabled type="text" value="有" style="width:98%;"/>
									</c:if>
									<c:if test="${pd.IS_RECOMMEND == 0}">
										<input disabled type="text" value="没有" style="width:98%;"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">菜品价格:</td>
								<td><input disabled type="number" value="${pd.DISHES_PRICE}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加人：</td>
								<td><input disabled type="text" value="${pd.ADD_USER}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="top.Dialog.close();">返回</a>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
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
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>