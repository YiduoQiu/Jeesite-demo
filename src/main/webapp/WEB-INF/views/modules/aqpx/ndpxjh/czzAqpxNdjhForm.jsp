<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>年度培训计划</title>
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
			var id = '${czzAqpxNdjh.id}';
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
		<li><a href="${ctx}/aqpx/ndpxjh/czzAqpxNdjh/">年度培训计划</a></li>
		<li class="active"><a href="${ctx}/aqpx/ndpxjh/czzAqpxNdjh/form?id=${czzAqpxNdjh.id}">年度培训计划<shiro:hasPermission name="aqpx:ndpxjh:czzAqpxNdjh:edit">${not empty czzAqpxNdjh.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="aqpx:ndpxjh:czzAqpxNdjh:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">标题：</label>
				<div style="padding-top: 3px;">${czzAqpxNdjh.title}</div>
			</div>
			<div class="control-group">
				<label class="control-label">内容：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqpxNdjh.content}</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqpx:ndpxjh:czzAqpxNdjh:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzAqpxNdjh" action="${ctx}/aqpx/ndpxjh/czzAqpxNdjh/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" class="input-xxlarge " style="display:none"/>
				<sys:ckeditor replace="content" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/aqpx/ndpxjh/czzAqpxNdjh" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqpx:ndpxjh:czzAqpxNdjh:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("年度培训计划修改");
		}
	</script>
</body>
</html>