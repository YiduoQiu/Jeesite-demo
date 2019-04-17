<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>应急演练</title>
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
			//给选择类型绑定事件
			$(".select2-chosen").bind("DOMNodeInserted",function(e){
				var yl_type = $(".select2-chosen").html();
				if(yl_type == "综合演练"){
					$("#ylfa").html("综合演练方案");
					$("#ylgc").html("综合演练过程");
					$("#ylpg").html("综合演练评估");
				}
				if(yl_type == "专项演练"){
					$("#ylfa").html("专项演练方案");
					$("#ylgc").html("专项演练过程");
					$("#ylpg").html("专项演练评估");
				}
				if(yl_type == "现场演练"){
					$("#ylfa").html("现场演练方案");
					$("#ylgc").html("现场演练过程");
					$("#ylpg").html("现场演练评估");
				}
			});
			//隐藏正文
			var id = '${czzYjyl.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			//$("#ylType_view").html($("#s2id_ylType .select2-chosen").html());
			//显示附件名
			show_preFile();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/yjyl/czzYjyl/">应急演练</a></li>
		<li class="active"><a href="${ctx}/yjyl/czzYjyl/form?id=${czzYjyl.id}">应急演练<shiro:hasPermission name="yjyl:czzYjyl:edit">${not empty czzYjyl.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="yjyl:czzYjyl:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">演练类型：</label>
				<div id="ylType_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${fns:getDictLabel(czzYjyl.ylType, 'yl_type', '')}</div>
			</div>
			<div class="control-group">
				<label class="control-label">标题：</label>
				<div style="padding-top: 3px;">${czzYjyl.name}</div>
			</div>
			<div class="control-group">
				<label class="control-label">时间：</label>
				<div style="padding-top: 3px;"><fmt:formatDate value="${czzYjyl.date}" dateStyle="long" /></div>
			</div>
			<div class="control-group">
				<label class="control-label">地点：</label>
				<div style="padding-top: 3px;">${czzYjyl.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">演练方案：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYjyl.plan}</div>
			</div>
			<div class="control-group">
				<label class="control-label">演练过程：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYjyl.accident}</div>
			</div>
			<div class="control-group">
				<label class="control-label">演练评估：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYjyl.evaluate}</div>
			</div>
			<div class="control-group">
				<label class="control-label">预案修订及发布：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYjyl.revise}</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="yjyl:czzYjyl:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzYjyl" action="${ctx}/yjyl/czzYjyl/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">演练类型：</label>
			<div class="controls">
				<form:select path="ylType" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yl_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzYjyl.date}" pattern="yyyy-MM-dd"/>"
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
			<label class="control-label" id="ylfa">演练方案：</label>
			<div class="controls">
				<form:textarea path="plan" htmlEscape="false" rows="4" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="plan" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" id="ylgc">演练过程：</label>
			<div class="controls">
				<form:textarea path="accident" htmlEscape="false" rows="4" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="accident" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" id="ylpg">演练评估：</label>
			<div class="controls">
				<form:textarea path="evaluate" htmlEscape="false" rows="4" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="evaluate" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预案修订及发布：</label>
			<div class="controls">
				<form:textarea path="revise" htmlEscape="false" rows="4" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="revise" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/yjyl/czzYjyl" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="yjyl:czzYjyl:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("应急演练修改");
		}
	</script>
</body>
</html>