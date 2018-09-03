<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>DROP TABLE IF EXISTS czz_aqsgbg;管理</title>
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
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/aqsgbg/czzAqsgbg/">安全事故列表</a></li>
		<li class="active"><a href="${ctx}/aqsgbg/czzAqsgbg/form?id=${czzAqsgbg.id}">安全事故<shiro:hasPermission name="aqsgbg:czzAqsgbg:edit">${not empty czzAqsgbg.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="aqsgbg:czzAqsgbg:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="czzAqsgbg" action="${ctx}/aqsgbg/czzAqsgbg/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">事故名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事故性质：</label>
			<div class="controls">
				<form:input path="type" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发生经过：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" maxlength="3000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上报状态：</label>
			<div class="controls">
				<form:select path="sgType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sb_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上报时间：</label>
			<div class="controls">
				<input name="sbTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${czzAqsgbg.sbTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" maxlength="100" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/aqsgbg/czzAqsgbg" selectMultiple="true"/>
			</div>
		</div>
		<div>
			<span class="help_line" style="color:red; font-size:21px; display: block; padding-top: 12px;padding-left: 90px;">请及时上报，一小时内报当地主管部门和应急管理部门</span>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqsgbg:czzAqsgbg:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>