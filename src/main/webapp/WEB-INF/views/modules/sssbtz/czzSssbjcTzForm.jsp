<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>设施设备台账</title>
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
			
			var check = $("input[name='bzFlag']");
			var checked = $("input[name='bzFlag']:checked").val();
			if(checked == '1'){
				alert("无安全警示标志，请及时检修！");
			}
			
			var aqType = $(".select2-chosen").html();
			if(aqType == "差"){
				alert("设施设备完好状况为差，请及时检修！");
			}

			//给下拉框绑定事件
			$(".select2-chosen").bind("DOMNodeInserted",function(e){
				var aqType = $(".select2-chosen").html();
				if(aqType == "优" || aqType == "良"){
					alert("请继续保持！");
				}
				if(aqType == "差"){
					alert("请及时检修！");
				}
			});
			//给有无警示标志绑定事件
			check.bind("click",function(e){
				if($(this).val() == '0') {
					alert("请继续保持！");
				} else {
					alert("请及时检修！");
				}
			});
			//隐藏正文
			var id = '${czzSssbjcTz.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			//$("#alert_view").html($('input:radio[name="bzFlag"]:checked').next().html());
			//显示附件名
			show_preFile();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sssbtz/czzSssbjcTz/">设施设备台账</a></li>
		<li class="active"><a href="${ctx}/sssbtz/czzSssbjcTz/form?id=${czzSssbjcTz.id}">设施设备台账<shiro:hasPermission name="sssbtz:czzSssbjcTz:edit">${not empty czzSssbjcTz.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sssbtz:czzSssbjcTz:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">设备名称：</label>
				<div id="kh_type" style="padding-top: 3px;">${czzSssbjcTz.name}</div>
			</div>
			<div class="control-group">
				<label class="control-label">上次检查时间：</label>
				<div style="padding-top: 3px;"><fmt:formatDate value="${czzSssbjcTz.date}" dateStyle="long" /></div>
			</div>
			<div class="control-group">
				<label class="control-label">设备地点：</label>
				<div style="padding-top: 3px;">${czzSssbjcTz.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">检测、检修、保养情况：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzSssbjcTz.situation}</div>
			</div>
			<div class="control-group">
				<label class="control-label">有无设备安全警示标志：</label>
				<div id="alert_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${fns:getDictLabel(czzSssbjcTz.bzFlag, 'sbjs_flag', '')}</div>
			</div>
			<div class="control-group">
				<label class="control-label">设施设备完好状况：</label>
				<div id="complete_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${fns:getDictLabel(czzSssbjcTz.aqType, 'aq_type', '')}</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sssbtz:czzSssbjcTz:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzSssbjcTz" action="${ctx}/sssbtz/czzSssbjcTz/save" method="post" class="form-horizontal" style="display:none;">
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
			<label class="control-label">上次检查时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzSssbjcTz.date}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设备地点：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">检测、检修、保养情况：</label>
			<div class="controls">
				<form:textarea path="situation" htmlEscape="false" rows="4" class="input-xxlarge " style="display:none"/>
				<sys:ckeditor replace="situation" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">有无设备安全警示标志：</label>
			<div class="controls">
				<form:radiobuttons path="bzFlag" items="${fns:getDictList('sbjs_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设施设备完好状况：</label>
			<div class="controls">
				<form:select path="aqType" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('aq_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/sssbtz/czzSssbjcTz" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sssbtz:czzSssbjcTz:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("设施设备台账修改");
		}
	</script>
</body>
</html>