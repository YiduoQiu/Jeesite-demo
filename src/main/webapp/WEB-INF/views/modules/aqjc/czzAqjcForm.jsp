<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全检查</title>
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
			$("#cor_status #type").val(0);
			//隐藏正文
			var id = '${czzAqjc.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			show_preFile();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/aqjc/czzAqjc/">安全检查</a></li>
		<li class="active"><a href="${ctx}/aqjc/czzAqjc/form?id=${czzAqjc.id}">安全检查<shiro:hasPermission name="aqjc:czzAqjc:edit">${not empty czzAqjc.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="aqjc:czzAqjc:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">检查类型：</label>
				<div id="checkType_view" style="padding-top: 3px;">${fns:getDictLabel(czzAqjc.checkType, 'checktype_flag', '')}</div>
			</div>
			<div class="control-group">
				<label class="control-label">标题：</label>
				<div style="padding-top: 3px;">${czzAqjc.name}</div>
			</div>
			<div class="control-group">
				<label class="control-label">排查时间：</label>
				<div style="padding-top: 3px;"><fmt:formatDate value="${czzAqjc.date}" dateStyle="long" /></div>
			</div>
			<div class="control-group">
				<label class="control-label">地点：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqjc.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">范围：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqjc.extent}</div>
			</div>
			<div class="control-group">
				<label class="control-label">负责人：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqjc.responsible}</div>
			</div>
			<div class="control-group">
				<label class="control-label">参加人员：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqjc.participate}</div>
			</div>
			<div class="control-group">
				<label class="control-label">检查内容：</label>
				<div id="intervalType_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqjc.checkcontent}</div>
			</div>
			<div class="control-group">
				<label class="control-label">存在问题：</label>
				<div id="remind_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqjc.problem}</div>
			</div>
			<div class="control-group">
				<label class="control-label">整改要求：</label>
				<div id="remind_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqjc.requirements}</div>
			</div>
			<div class="control-group">
				<label class="control-label">整改期限：</label>
				<div id="remind_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;"><fmt:formatDate value="${czzAqjc.deadline}" dateStyle="long" /></div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqjc:czzAqjc:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzAqjc" action="${ctx}/aqjc/czzAqjc/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group" id="lx">
			<label class="control-label">检查类型：</label>
			<div class="controls">
				<form:select path="checkType" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('checktype_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排查时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzAqjc.date}" pattern="yyyy-MM-dd"/>"
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
			<label class="control-label">范围：</label>
			<div class="controls">
				<form:input path="extent" htmlEscape="false" maxlength="2000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">负责人：</label>
			<div class="controls">
				<form:input path="responsible" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">参加人员：</label>
			<div class="controls">
				<form:input path="participate" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">检查内容：</label>
			<div class="controls">
				<form:textarea path="checkcontent" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge"/>
				<sys:ckeditor replace="checkcontent" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">存在问题：</label>
			<div class="controls">
				<form:textarea path="problem" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge"/>
				<sys:ckeditor replace="problem" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">整改要求：</label>
			<div class="controls">
				<form:textarea path="requirements" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge"/>
				<sys:ckeditor replace="requirements" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">整改期限：</label>
			<div class="controls">
				<input name="deadline" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzAqjc.deadline}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="cor_status" style="display:none;">
			<label class="control-label">整改状态：</label>
			<div class="controls">
				<form:select path="type" class="input-xlarge">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" maxlength="100" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/aqjc/czzAqjc" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqjc:czzAqjc:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("安全检查修改");
		}
	</script>
</body>
</html>