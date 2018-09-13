<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>隐患排查验收管理</title>
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
			//初始化时
			var yh_ini = $(".select2-chosen").html();
			if(yh_ini == "一般安全事故隐患"){
				$("#zrr").show();
				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$("#content6").hide();
			}
			if(yh_ini == "重大安全事故隐患"){
				$("#zrr").hide();
				$("#content1").show();
				$("#content2").show();
				$("#content3").show();
				$("#content4").show();
				$("#content5").show();
				$("#content6").show();
			}
			//给选择类型绑定事件
			$(".select2-chosen").bind("DOMNodeInserted",function(e){
				var yl_type = $(".select2-chosen").html();
				if(yl_type == "一般安全事故隐患"){
					$("#zrr").show();
					$("#content1").hide();
					$("#content2").hide();
					$("#content3").hide();
					$("#content4").hide();
					$("#content5").hide();
					$("#content6").hide();
				}
				if(yl_type == "重大安全事故隐患"){
					$("#zrr").hide();
					$("#content1").show();
					$("#content2").show();
					$("#content3").show();
					$("#content4").show();
					$("#content5").show();
					$("#content6").show();
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/yhpcys/czzYhpcYs/">隐患排查验收</a></li>
		<li class="active"><a href="${ctx}/yhpcys/czzYhpcYs/form?id=${czzYhpcYs.id}">隐患排查验收<shiro:hasPermission name="yhpcys:czzYhpcYs:edit">${not empty czzYhpcYs.id?'编辑':'添加'}</shiro:hasPermission><shiro:lacksPermission name="yhpcys:czzYhpcYs:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="czzYhpcYs" action="${ctx}/yhpcys/czzYhpcYs/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">隐患名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">隐患类型：</label>
			<div class="controls">
				<form:select path="yhType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yh_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">检查时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${czzYhpcYs.date}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地点：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group" id="zrr">
			<label class="control-label">责任人：</label>
			<div class="controls">
				<form:input path="responsible" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group" id="content1">
			<label class="control-label">治理的目标和任务：</label>
			<div class="controls">
				<form:textarea path="content1" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group" id="content2">
			<label class="control-label">采取的方法和措施：</label>
			<div class="controls">
				<form:textarea path="content2" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group" id="content3">
			<label class="control-label">经费和物资的落实：</label>
			<div class="controls">
				<form:textarea path="content3" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group" id="content4">
			<label class="control-label">负责治理的机构和人员：</label>
			<div class="controls">
				<form:textarea path="content4" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group" id="content5">
			<label class="control-label">治理的时限和要求：</label>
			<div class="controls">
				<form:textarea path="content5" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group" id="content6">
			<label class="control-label">安全措施和应急预案：</label>
			<div class="controls">
				<form:textarea path="content6" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">整改情况：</label>
			<div class="controls">
				<form:textarea path="correctacction" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">验收人：</label>
			<div class="controls">
				<form:input path="confirm" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">验收时间：</label>
			<div class="controls">
				<input name="confirmdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${czzYhpcYs.confirmdate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">整改状态：</label>
			<div class="controls">
				<form:select path="type" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" maxlength="100" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/yhpcys/czzYhpcYs" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="yhpcys:czzYhpcYs:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>