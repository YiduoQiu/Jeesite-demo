<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>隐患排查</title>
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
			//初始化时
			$("#cor_status #type").val(0);
			var yh_ini = $(".select2-chosen").html();
			if(yh_ini == "一般安全事故隐患"){
				$("#czwt").show();
				$("#zgcs").show();
				$("#zgqx").show();
				$("#trjf").show();
				$("#normal_view").show();
				$("#zw1").hide();
				$("#zw2").hide();
				$("#zw3").hide();
				$("#zw4").hide();
				$("#zw5").hide();
				$("#zw6").hide();
				$("#important_view").hide();
			}
			if(yh_ini == "重大安全事故隐患"){
				$("#czwt").hide();
				$("#zgcs").hide();
				$("#zgqx").hide();
				$("#trjf").hide();
				$("#normal_view").hide();
				$("#zw1").show();
				$("#zw2").show();
				$("#zw3").show();
				$("#zw4").show();
				$("#zw5").show();
				$("#zw6").show();
				$("#important_view").show();
			}
			
			//隐藏正文
			var id = '${czzYhpc.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			show_preFile();
			$("#tb_status").html($('input:radio[name="notice"]:checked').next().html());
			//通报情况初始化
			var notice = $("input[name='notice']");
			var noticed = $("input[name='notice']:checked").val();
			if(noticed == '1'){
				alert("请及时告知从业人员!");
			}
			
			//给选择类型绑定事件
			$(".select2-chosen").bind("DOMNodeInserted",function(e){
				var yl_type = $(".select2-chosen").html();
				if(yl_type == "一般安全事故隐患"){
					$("#czwt").show();
					$("#zgcs").show();
					$("#zgqx").show();
					$("#trjf").show();
					$("#zw1").hide();
					$("#zw2").hide();
					$("#zw3").hide();
					$("#zw4").hide();
					$("#zw5").hide();
					$("#zw6").hide();
				}
				if(yl_type == "重大安全事故隐患"){
					$("#czwt").hide();
					$("#zgcs").hide();
					$("#zgqx").hide();
					$("#trjf").hide();
					$("#zw1").show();
					$("#zw2").show();
					$("#zw3").show();
					$("#zw4").show();
					$("#zw5").show();
					$("#zw6").show();
				}
			});
			
			//给通报情况绑定事件
			notice.bind("click",function(e){
				if($(this).val() == '1') {
					alert("请及时告知从业人员!");
				}
			});
			
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/yhpc/czzYhpc/">隐患排查</a></li>
		<li class="active"><a href="${ctx}/yhpc/czzYhpc/form?id=${czzYhpc.id}">隐患排查<shiro:hasPermission name="yhpc:czzYhpc:edit">${not empty czzYhpc.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="yhpc:czzYhpc:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">隐患名称：</label>
				<div style="padding-top: 3px;">${czzYhpc.name}</div>
			</div>
			<div class="control-group">
				<label class="control-label">隐患类型：</label>
				<div id="yh_type" style="padding-top: 3px;">${fns:getDictLabel(czzYhpc.yhType, 'yh_type', '')}</div>
			</div>
			<div class="control-group">
				<label class="control-label">排查时间：</label>
				<div style="padding-top: 3px;"><fmt:formatDate value="${czzYhpc.date}" dateStyle="long" /></div>
			</div>
			<div class="control-group">
				<label class="control-label">地点：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">责任人：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.responsible}</div>
			</div>
			<div class="control-group">
				<label class="control-label">通报情况：</label>
				<div id="tb_status" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.notice}</div>
			</div>
			<div id="normal_view">
				<div class="control-group">
					<label class="control-label">存在问题：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.problem}</div>
				</div>
				<div class="control-group">
					<label class="control-label">整改措施：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.requirements}</div>
				</div>
				<div class="control-group">
					<label class="control-label">整改期限：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;"><fmt:formatDate value="${czzYhpc.deadline}" dateStyle="long" /></div>
				</div>
				<div class="control-group">
					<label class="control-label">投入经费：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.amount}</div>
				</div>
			</div>
			<div id="important_view">
				<div class="control-group">
					<label class="control-label">治理的目标和任务：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.content1}</div>
				</div>
				<div class="control-group">
					<label class="control-label">采取的方法和措施：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.content2}</div>
				</div>
				<div class="control-group">
					<label class="control-label">经费和物资的落实：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.content3}</div>
				</div>
				<div class="control-group">
					<label class="control-label">负责治理的机构和人员：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.content4}</div>
				</div>
				<div class="control-group">
					<label class="control-label">治理的时限和要求：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.content5}</div>
				</div>
				<div class="control-group">
					<label class="control-label">安全措施和应急预案：</label>
					<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzYhpc.content6}</div>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="yhpc:czzYhpc:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzYhpc" action="${ctx}/yhpc/czzYhpc/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">隐患名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">隐患类型：</label>
			<div class="controls" id="lx">
				<form:select path="yhType" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yh_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排查时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzYhpc.date}" pattern="yyyy-MM-dd"/>"
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
			<label class="control-label">责任人：</label>
			<div class="controls">
				<form:input path="responsible" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">通报情况：</label>
			<div class="controls">
				<form:radiobuttons path="notice" items="${fns:getDictList('notice_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="czwt">
			<label class="control-label">存在问题：</label>
			<div class="controls">
				<form:textarea path="problem" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="problem" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="zw1">
			<label class="control-label">治理的目标和任务：</label>
			<div class="controls">
				<form:textarea path="content1" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="content1" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="zw2">
			<label class="control-label">采取的方法和措施：</label>
			<div class="controls">
				<form:textarea path="content2" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="content2" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="zw3">
			<label class="control-label">经费和物资的落实：</label>
			<div class="controls">
				<form:textarea path="content3" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="content3" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="zw4">
			<label class="control-label">负责治理的机构和人员：</label>
			<div class="controls">
				<form:textarea path="content4" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="content4" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="zw5">
			<label class="control-label">治理的时限和要求：</label>
			<div class="controls">
				<form:textarea path="content5" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="content5" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="zw6">
			<label class="control-label">安全措施和应急预案：</label>
			<div class="controls">
				<form:textarea path="content6" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="content6" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="zgcs">
			<label class="control-label">整改措施：</label>
			<div class="controls">
				<form:textarea path="requirements" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="requirements" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="zgqx">
			<label class="control-label">整改期限：</label>
			<div class="controls">
				<input name="deadline" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzYhpc.deadline}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="trjf">
			<label class="control-label">投入经费：</label>
			<div class="controls">
				<form:input path="amount" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
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
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/yhpc/czzYhpc" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="yhpc:czzYhpc:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("隐患排查修改");
		}
	</script>
</body>
</html>