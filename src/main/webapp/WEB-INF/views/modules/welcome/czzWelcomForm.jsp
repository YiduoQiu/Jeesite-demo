<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>欢迎页面</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			function cus_close() {
				window.close();
			}
		});
	</script>
	<style type="text/css">
	.control-label{
		width: 200px !important;
	}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/welcome/czzWelcom/form?id=${czzWelcom.id}">欢迎使用<shiro:lacksPermission name="welcome:czzWelcom:edit">——只能查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="control-group" style="margin-left:10px;">安全生产管家婆提示：</div>
	<form:form id="inputForm" modelAttribute="czzWelcom" action="${ctx}/welcome/czzWelcom/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">是否建立生产安全管理机构：</label>
			<div class="controls">
				<form:radiobuttons path="organFlag" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否制定安全生产职责：</label>
			<div class="controls">
				<form:radiobuttons path="responFlag" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否建立安全生产责任制度：</label>
			<div class="controls">
				<form:radiobuttons path="ruleFlag" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">安全生产证书是否齐全：</label>
			<div class="controls">
				<form:radiobuttons path="certiFlag" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否进行安全评价：</label>
			<div class="controls">
				<form:radiobuttons path="commentFlag" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否进行职业健康评价：</label>
			<div class="controls">
				<form:radiobuttons path="healthyFlag" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否建立应急预案：</label>
			<div class="controls">
				<form:radiobuttons path="yjyaFlag" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否再次显示本页面：</label>
			<div class="controls">
				<form:radiobuttons path="mentionFlag" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="welcome:czzWelcom:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="关 闭" onclick="window.close();"/>
		</div>
	</form:form>
</body>
</html>