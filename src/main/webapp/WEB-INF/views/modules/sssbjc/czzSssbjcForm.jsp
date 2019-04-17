<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>设施设备安全检查</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/jQuery-Word-Export/FileSaver.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jQuery-Word-Export/jquery.wordexport.js" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/prefile_common.js" type="text/javascript"></script>
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
			//隐藏正文
			var id = '${czzSssbjc.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			//显示附件名
			show_preFile();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sssbjc/czzSssbjc/">设施设备安全检查列表</a></li>
		<li class="active"><a href="${ctx}/sssbjc/czzSssbjc/form?id=${czzSssbjc.id}">设施设备安全检查<shiro:hasPermission name="sssbjc:czzSssbjc:edit">${not empty czzSssbjc.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sssbjc:czzSssbjc:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">设备名称：</label>
				<div id="kh_type" style="padding-top: 3px;">${czzSssbjc.name}</div>
			</div>
			<div class="control-group">
				<label class="control-label">时间：</label>
				<div id="yh_type" style="padding-top: 3px;"><fmt:formatDate value="${czzSssbjc.date}" dateStyle="long" /></div>
			</div>
			<div class="control-group">
				<label class="control-label">地点：</label>
				<div style="padding-top: 3px;">${czzSssbjc.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">检查内容：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzSssbjc.checkcontent}</div>
			</div>
			<div class="control-group">
				<label class="control-label">相关责任人签字：</label>
				<div id="alert_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzSssbjc.relatedPer}</div>
			</div>
			<div class="control-group">
				<label class="control-label">设施设备安全状态：</label>
				<div id="complete_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${fns:getDictLabel(czzSssbjc.aqType, 'aq_type', '')}</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sssbjc:czzSssbjc:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzSssbjc" action="${ctx}/sssbjc/czzSssbjc/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">设备名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzSssbjc.date}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地点：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">检修内容：</br><span class="help-inline">须包括定期、维护、保养、检测</span></label>
			<div class="controls">
				<form:textarea path="checkcontent" htmlEscape="false" rows="4" class="input-xxlarge " style="display:none"/>
				<sys:ckeditor replace="checkcontent" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">相关责任人签字：</label>
			<div class="controls">
				<form:input path="relatedPer" htmlEscape="false" maxlength="255" class="input-xlarge "/>
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
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/sssbjc/czzSssbjc" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sssbjc:czzSssbjc:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("设施设备检查修改");
		}
	</script>
</body>
</html>