<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>作业安全</title>
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
			var id = '${czzZyaq.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			//$("#zyType_view").html($("#s2id_Type .select2-chosen").html());
			//显示附件名
			show_preFile();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/zyaq/czzZyaq/">作业安全</a></li>
		<li class="active"><a href="${ctx}/zyaq/czzZyaq/form?id=${czzZyaq.id}">作业安全<shiro:hasPermission name="zyaq:czzZyaq:edit">${not empty czzZyaq.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="zyaq:czzZyaq:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">作业名称：</label>
				<div style="padding-top: 3px;">${czzZyaq.name}</div>
			</div>
			<div class="control-group">
				<label class="control-label">作业种类：</label>
				<div style="padding-top: 3px;">${fns:getDictLabel(czzZyaq.type, 'zy_type', '')}</div>
			</div>
			<div class="control-group">
				<label class="control-label">时间：</label>
				<div style="padding-top: 3px;"><fmt:formatDate value="${czzZyaq.date}" dateStyle="long" /></div>
			</div>
			<div class="control-group">
				<label class="control-label">地点：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzZyaq.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">作业人员：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzZyaq.zyPerson}</div>
			</div>
			<div class="control-group">
				<label class="control-label">安全监护人员：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzZyaq.jhPerson}</div>
			</div>
			<div class="control-group">
				<label class="control-label">安全管理措施：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzZyaq.task}</div>
			</div>
			<div class="control-group">
				<label class="control-label">现场作业情况：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzZyaq.performance}</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="zyaq:czzZyaq:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzZyaq" action="${ctx}/zyaq/czzZyaq/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">作业名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">作业种类：</label>
			<div class="controls">
				<form:select path="Type" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('zy_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzZyaq.date}" pattern="yyyy-MM-dd"/>"
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
			<label class="control-label">作业人员：</label>
			<div class="controls">
				<form:input path="zyPerson" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">安全监护人员：</label>
			<div class="controls">
				<form:input path="jhPerson" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">安全管理措施：</br><span class="help-inline">对操作人员进行安全培训</br>对现场作业实施监督</br>做好危险点的重点监控</span></label>
			<div class="controls">
				<form:textarea path="task" htmlEscape="false" rows="4" class="input-xxlarge " style="display:none"/>
				<sys:ckeditor replace="task" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">现场作业情况：</label>
			<div class="controls">
				<form:textarea path="performance" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="performance" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/zyaq/czzZyaq" selectMultiple="true"/>
				<span class="help-inline">添加现场安全作业图片及安全小结</span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="zyaq:czzZyaq:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("安全作业修改");
		}
	</script>
</body>
</html>