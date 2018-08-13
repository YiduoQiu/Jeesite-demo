<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>设施设备安全检查管理</title>
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
			//给选择类型绑定事件
			$(".select2-chosen").bind("DOMNodeInserted",function(e){
				var yl_type = $(".select2-chosen").html();
				if(yl_type == "优"){
					alert("请继续保持");
				}
				if(yl_type == "良"){
					alert("请加强巡查");
				}
				if(yl_type == "差"){
					alert("请立即整改");
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sssbjc/czzSssbjc/">设施设备安全检查列表</a></li>
		<li class="active"><a href="${ctx}/sssbjc/czzSssbjc/form?id=${czzSssbjc.id}">设施设备安全检查<shiro:hasPermission name="sssbjc:czzSssbjc:edit">${not empty czzSssbjc.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sssbjc:czzSssbjc:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="czzSssbjc" action="${ctx}/sssbjc/czzSssbjc/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">设备名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${czzSssbjc.date}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地点：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">检修内容：</label>
			<div class="controls">
				<form:textarea path="checkcontent" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">验收情况：</label>
			<div class="controls">
				<form:textarea path="returninfo" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设施设备安全状态：</label>
			<div class="controls">
				<form:select path="aqType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('aq_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" maxlength="100" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/sssbjc/czzSssbjc" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sssbjc:czzSssbjc:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>