<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>一般危险源管理</title>
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
			var id = '${czzWxygl.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			$("#gl_type").html($("#s2id_wxyKind .select2-chosen").html());
			$("#wxylx").hide();
			show_preFile();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wxygl/czzWxygl/">一般危险源台账</a></li>
		<li class="active"><a href="${ctx}/wxygl/czzWxygl/form?id=${czzWxygl.id}">一般危险源<shiro:hasPermission name="wxygl:czzWxygl:edit">${not empty czzWxygl.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wxygl:czzWxygl:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">危险源类别：</label>
				<div id="gl_type" style="padding-top: 3px;"></div>
			</div>
			<div class="control-group">
				<label class="control-label">危险源名称：</label>
				<div style="padding-top: 3px;">${czzWxygl.wxyName}</div>
			</div>
			<div class="control-group">
				<label class="control-label">数量：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzWxygl.amount}</div>
			</div>
			<div class="control-group">
				<label class="control-label">位置：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzWxygl.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">管理人员：</label>
				<div id="tb_status" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzWxygl.person}</div>
			</div>
			<div class="control-group">
				<label class="control-label">管理措施：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzWxygl.plan}</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div>
			<span class="help_line" style="color:red; font-size:21px; display: block; padding-top: 12px;padding-left: 90px;">重大危险源必须向安全管理部门和相关部门报备！</span>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wxygl:czzWxygl:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzWxygl" action="${ctx}/wxygl/czzWxygl/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group" id="wxylx">
			<label class="control-label">危险源类型：</label>
			<div class="controls">
				<form:select path="wxyType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('wxy_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">危险源类别：</label>
			<div class="controls">
				<form:select path="wxyKind" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_wxy')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">危险源名称：</label>
			<div class="controls">
				<form:input path="wxyName" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数量：</label>
			<div class="controls">
				<form:input path="amount" htmlEscape="false" maxlength="300" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">位置：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="300" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">管理人员：</label>
			<div class="controls">
				<form:input path="person" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">管理措施：</br><span class="help-inline">必须包括安全措施和</br>应急措施</span></label>
			<div class="controls">
				<form:textarea path="plan" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge " style="display:none"/>
				<sys:ckeditor replace="plan" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/wxygl/czzWxygl" selectMultiple="true"/>
			</div>
		</div>
		<div>
			<span class="help_line" style="color:red; font-size:21px; display: block; padding-top: 12px;padding-left: 90px;">重大危险源必须向安全管理部门和相关部门报备！</span>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wxygl:czzWxygl:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("一般危险源管理修改");
		}
	</script>
</body>
</html>