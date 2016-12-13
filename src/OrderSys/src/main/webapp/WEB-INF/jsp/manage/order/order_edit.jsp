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
					
					<form action="order/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ORDER_ID" id="ORDER_ID" value="${pd.ORDER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">餐桌号:</td>
								<td>
									<select name="TABLE_ID" id="TABLE_ID">
										<c:if test="${msg =='save'}">
											<option disabled selected hidden>---请选择餐桌---</option>
										</c:if>
										<c:forEach var="var" items="${tableList}">
											<option value="${var.TABLE_ID}">${var.TABLE_NUM}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单状态:</td>
								<td>
									<select name="ORDER_STATUS" id="ORDER_STATUS">
										<option value="0" selected>未完成</option>
										<option value="1">已完成</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用餐人数:</td>
								<td><input max="20" min="0" type="number" name="PERSON_NUM" id="PERSON_NUM"
										   value="${pd.PERSON_NUM}" maxlength="32" placeholder="这里输入用餐人数" title="用餐人数"
										   style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">员工编号:</td>
								<td><input type="text" name="WAITER_ID" id="WAITER_ID" value="${pd.WAITER_ID}" maxlength="255" placeholder="这里输入员工编号" title="员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">折扣(%):</td>
								<td><input max="100" min="0" type="number" name="DISCOUNT" id="DISCOUNT"
										   value="${pd.DISCOUNT}" maxlength="255" placeholder="这里输入折扣" title="折扣"
										   style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单原价:</td>
								<td><input type="number" name="ORDER_PRICE" id="ORDER_PRICE" value="${pd.ORDER_PRICE}"
										   maxlength="255" placeholder="这里输入订单原价" title="订单原价" style="width:98%;"/></td>
							</tr>
							<tr hidden>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input class="span10 date-picker" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="添加时间" title="添加时间" style="width:98%;"/></td>
							</tr>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());

		$('#ORDER_PRICE').blur(function () {
			var money = $(this).val() - 0.0;
			$(this).val(money.toFixed(2));
		});

		//保存
		function save(){

			if ($("#TABLE_ID option:selected").attr("value") == null) {
				$("#TABLE_ID").tips({
					side:3,
					msg: '请选择餐桌号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TABLE_ID").focus();
			return false;
			}
			if ($("#ORDER_STATUS option:selected").attr("value") == null) {
				$("#ORDER_STATUS").tips({
					side:3,
		            msg:'请输入订单状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDER_STATUS").focus();
			return false;
			}
			if($("#PERSON_NUM").val()==""){
				$("#PERSON_NUM").tips({
					side:3,
		            msg:'请输入用餐人数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PERSON_NUM").focus();
			return false;
			}
			if($("#WAITER_ID").val()==""){
				$("#WAITER_ID").tips({
					side:3,
		            msg:'请输入员工编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WAITER_ID").focus();
			return false;
			}
			if($("#DISCOUNT").val()==""){
				$("#DISCOUNT").tips({
					side:3,
		            msg:'请输入折扣',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISCOUNT").focus();
			return false;
			}
			if($("#ORDER_PRICE").val()==""){
				$("#ORDER_PRICE").tips({
					side:3,
		            msg:'请输入订单原价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDER_PRICE").focus();
			return false;
			}
			/*			if($("#ADD_TIME").val()==""){
				$("#ADD_TIME").tips({
					side:3,
		            msg:'请输入添加时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_TIME").focus();
			return false;
			 }*/

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