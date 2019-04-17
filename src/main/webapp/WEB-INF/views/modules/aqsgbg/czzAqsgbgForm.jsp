<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全事故报告</title>
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
			var id = '${czzAqsgbg.id}';
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
		<li><a href="${ctx}/aqsgbg/czzAqsgbg/">安全事故列表</a></li>
		<li class="active"><a href="${ctx}/aqsgbg/czzAqsgbg/form?id=${czzAqsgbg.id}">安全事故<shiro:hasPermission name="aqsgbg:czzAqsgbg:edit">${not empty czzAqsgbg.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="aqsgbg:czzAqsgbg:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">事故名称：</label>
				<div style="padding-top: 3px;">${czzAqsgbg.name}</div>
			</div>
			<div class="control-group">
				<label class="control-label">事故性质：</label>
				<div style="padding-top: 3px;">${czzAqsgbg.sgType}</div>
			</div>
			<div class="control-group">
				<label class="control-label">发生经过：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqsgbg.content}</div>
			</div>
			<div class="control-group">
				<label class="control-label">上报状态：</label>
				<div style="padding-top: 3px;">${fns:getDictLabel(czzAqsgbg.type, 'sb_flag', '')}</div>
			</div>
			<div class="control-group">
				<label class="control-label">上报时间：</label>
				<div style="padding-top: 3px;"><fmt:formatDate value="${czzAqsgbg.sbTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqsgbg:czzAqsgbg:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzAqsgbg" action="${ctx}/aqsgbg/czzAqsgbg/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">事故名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事故性质：</label>
			<div class="controls">
				<form:input path="sgType" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发生经过：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" maxlength="3000" class="input-xxlarge"/>
				<sys:ckeditor replace="content" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上报状态：</label>
			<div class="controls">
				<form:select path="type" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sb_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上报时间：</label>
			<div class="controls">
				<input name="sbTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzAqsgbg.sbTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
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
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("安全事故上报修改");
		}
	</script>
</body>
</html>