<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全考核</title>
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
			var id = '${czzAqkh.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			$("#kh_type").html($("#s2id_type .select2-chosen").html());
			show_preFile();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/aqkh/czzAqkh/">安全考核</a></li>
		<li class="active"><a href="${ctx}/aqkh/czzAqkh/form?id=${czzAqkh.id}">安全考核<shiro:hasPermission name="aqkh:czzAqkh:edit">${not empty czzAqkh.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="aqkh:czzAqkh:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">考核类型：</label>
				<div id="kh_type" style="padding-top: 3px;"></div>
			</div>
			<div class="control-group">
				<label class="control-label">标题：</label>
				<div style="padding-top: 3px;">${czzAqkh.title}</div>
			</div>
			<div class="control-group">
				<label class="control-label">考核对象：</label>
				<div style="padding-top: 3px;">${czzAqkh.person}</div>
			</div>
			<div class="control-group">
				<label class="control-label">考核内容：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqkh.content}</div>
			</div>
			<div class="control-group">
				<label class="control-label">考核结果：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqkh.feedback}</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div>
			<span class="help_line" style="color:red; font-size:21px; display: block; padding-top: 12px;padding-left: 100px;">请将考核结果反馈给业绩考核部门和企业主要负责人以及分管负责人！</span>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqkh:czzAqkh:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzAqkh" action="${ctx}/aqkh/czzAqkh/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">考核类型：</label>
			<div class="controls">
				<form:select path="type" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_kh')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">考核对象：</label>
			<div class="controls">
				<form:input path="person" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">考核内容：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" class="input-xxlarge " style="display:none"/>
				<sys:ckeditor replace="content" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">考核结果：</label>
			<div class="controls">
				<form:textarea path="feedback" htmlEscape="false" rows="4" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="feedback" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/aqkh/czzAqkh" selectMultiple="true"/>
			</div>
		</div>
		<div>
			<span class="help_line" style="color:red; font-size:21px; display: block; padding-top: 12px;padding-left: 100px;">请将考核结果反馈给业绩考核部门和企业主要负责人以及分管负责人！</span>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqkh:czzAqkh:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("安全考核修改");
		}
	</script>
</body>
</html>