<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
	<title>智能提醒</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/jQuery-Word-Export/FileSaver.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jQuery-Word-Export/jquery.wordexport.js" type="text/javascript"></script>
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
			var yh_ini = $("#lx .select2-chosen").html();
            if(yh_ini == "安全生产许可证" || yh_ini == '特种作业操作证'){
                $("#intervaltime").val(3);
                $("#intervaltime").attr('readonly','readonly');
                $("#sjlx .select2-chosen").html("年");
                $("#sjlx #intervalType").val(0);
                $('#sjlx .controls').css('display', 'none');
                $('#sjlx #jgsjlx').css('display', 'block');
                $('#sjlx #jgsjlx').val('年');
                $('#sjlx #jgsjlx').attr('readonly', 'readonly');
            } else if (yh_ini == "安全管理资格证" || yh_ini == '法人资格证' || yh_ini == '管理员资格证') {
                $("#intervaltime").val(1);
                $("#intervaltime").attr('readonly','readonly');
                $("#sjlx .select2-chosen").html("年");
                $("#sjlx #intervalType").val(0);
                $('#sjlx .controls').css('display', 'none');
                $('#sjlx #jgsjlx').css('display', 'block');
                $('#sjlx #jgsjlx').val('年');
                $('#sjlx #jgsjlx').attr('readonly', 'readonly');
			} else if (yh_ini == '隐患排查') {
                $("#intervaltime").val(1);
                $("#intervaltime").attr('readonly','readonly');
                $("#sjlx .select2-chosen").html("月");
                $("#sjlx #intervalType").val(1);
                $('#sjlx .controls').css('display', 'none');
                $('#sjlx #jgsjlx').css('display', 'block');
                $('#sjlx #jgsjlx').val('月');
                $('#sjlx #jgsjlx').attr('readonly', 'readonly');
			} else if (yh_ini == '安全检查') {
                $("#intervaltime").val(15);
                $("#intervaltime").attr('readonly','readonly');
                $("#sjlx .select2-chosen").html("日");
                $("#sjlx #intervalType").val(2);
                $('#sjlx .controls').css('display', 'none');
                $('#sjlx #jgsjlx').css('display', 'block');
                $('#sjlx #jgsjlx').val('日');
                $('#sjlx #jgsjlx').attr('readonly', 'readonly');
			} else {
                $("#intervaltime").removeAttr('readonly');
                /* $("#intervaltime").val('');
                $("#sjlx .select2-chosen").html('');
                $("#sjlx #intervalType").val(''); */
                $('#sjlx .controls').css('display', 'block');
                $('#sjlx #jgsjlx').css('display', 'none');
			}

            //给提醒选择类型绑定事件
            $("#lx .select2-chosen").bind("DOMNodeInserted",function(e){
                var yl_type = $("#lx .select2-chosen").html();
                if(yl_type == "安全生产许可证" || yl_type == '特种作业操作证'){
                    $("#intervaltime").val(3);
                    $("#intervaltime").attr('readonly','readonly');
                    $("#sjlx .select2-chosen").html("年");
                    $("#sjlx #intervalType").val(0);
                    $('#sjlx .controls').css('display', 'none');
                    $('#sjlx #jgsjlx').css('display', 'block');
                    $('#sjlx #jgsjlx').val('年');
                    $('#sjlx #jgsjlx').attr('readonly', 'readonly');
                } else if (yl_type == "安全管理资格证" || yl_type == '法人资格证' || yl_type == '管理员资格证') {
                    $("#intervaltime").val(1);
                    $("#intervaltime").attr('readonly','readonly');
                    $("#sjlx .select2-chosen").html("年");
                    $("#sjlx #intervalType").val(0);
                    $('#sjlx .controls').css('display', 'none');
                    $('#sjlx #jgsjlx').css('display', 'block');
                    $('#sjlx #jgsjlx').val('年');
                    $('#sjlx #jgsjlx').attr('readonly', 'readonly');
				} else if (yl_type == '隐患排查') {
                    $("#intervaltime").val(1);
                    $("#intervaltime").attr('readonly','readonly');
                    $("#sjlx .select2-chosen").html("月");
                    $("#sjlx #intervalType").val(1);
                    $('#sjlx .controls').css('display', 'none');
                    $('#sjlx #jgsjlx').css('display', 'block');
                    $('#sjlx #jgsjlx').val('月');
                    $('#sjlx #jgsjlx').attr('readonly', 'readonly');
				} else if (yl_type == '安全检查') {
                    $("#intervaltime").val(15);
                    $("#intervaltime").attr('readonly','readonly');
                    $("#sjlx .select2-chosen").html("日");
                    $("#sjlx #intervalType").val(2);
                    $('#sjlx .controls').css('display', 'none');
                    $('#sjlx #jgsjlx').css('display', 'block');
                    $('#sjlx #jgsjlx').val('日');
                    $('#sjlx #jgsjlx').attr('readonly', 'readonly');
				} else {
                    $("#intervaltime").removeAttr('readonly');
                    $("#intervaltime").val('');
                    $("#sjlx .select2-chosen").html('');
                    $("#sjlx #intervalType").val('');
                    $('#sjlx .controls').css('display', 'block');
                    $('#sjlx #jgsjlx').css('display', 'none');
				}
            });
          	//隐藏正文
			var id = '${czzZntx.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			
			//显示查看页面信息
			$("#zntxType_view").html($("#lx .select2-chosen").html());
			$("#intervalType_view").html($("#sjlx .select2-chosen").html());
			$("#remind_view").html($('input:radio[name="remind"]:checked').next().html());
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/zntx/czzZntx/">该条提醒</a></li>
		<li class="active"><a href="${ctx}/zntx/czzZntx/form?id=${czzZntx.id}">该条提醒<shiro:hasPermission name="zntx:czzZntx:edit">${not empty czzZntx.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="zntx:czzZntx:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">类型：</label>
				<div id="zntxType_view" style="padding-top: 3px;"></div>
			</div>
			<div class="control-group">
				<label class="control-label">标题：</label>
				<div style="padding-top: 3px;">${czzZntx.title}</div>
			</div>
			<div class="control-group">
				<label class="control-label">接收人：</label>
				<div style="padding-top: 3px;">${czzZntx.person}</div>
			</div>
			<div class="control-group">
				<label class="control-label">接收人电话：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzZntx.phone}</div>
			</div>
			<div class="control-group">
				<label class="control-label">开始日期：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">
					<fmt:formatDate value="${czzZntx.startDate}" dateStyle="long" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">结束日期：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">
					<fmt:formatDate value="${czzZntx.endDate}" dateStyle="long" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">间隔时间：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzZntx.intervaltime}</div>
			</div>
			<div class="control-group">
				<label class="control-label">间隔时间类型：</label>
				<div id="intervalType_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;"></div>
			</div>
			<div class="control-group">
				<label class="control-label">是否提醒：</label>
				<div id="remind_view" style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzZntx.remind}</div>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="zntx:czzZntx:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzZntx" action="${ctx}/zntx/czzZntx/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group" id="lx">
			<label class="control-label">类型：</label>
			<div class="controls" id="zntxType">
				<form:select path="type" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('remind_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="display:none">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" maxlength="1000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接收人：</label>
			<div class="controls">
				<form:textarea path="person" htmlEscape="false" rows="4" maxlength="1000" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<span class="help-inline">请填写接收人姓名，若有多个接收人，请将姓名用逗号(,)隔开</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接收人电话：</label>
			<div class="controls">
				<form:textarea path="phone" htmlEscape="false" rows="4" maxlength="1000" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<span class="help-inline">请填写接收人手机号码，若有多个接收人，请将手机号码用逗号(,)隔开</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开始日期：</label>
			<div class="controls">
				<input name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzZntx.startDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结束日期：</label>
			<div class="controls">
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzZntx.endDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">间隔时间：</label>
			<div class="controls">
				<form:input path="intervaltime" htmlEscape="false" maxlength="10" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="sjlx">
			<label class="control-label">间隔时间类型：</label>
			<input style="display: none; margin-left: 180px;" type="text" id="jgsjlx" />
			<div class="controls">
				<form:select path="intervalType" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('interval_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否提醒：</label>
			<div class="controls">
				<form:radiobuttons path="remind" items="${fns:getDictList('remind_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="zntx:czzZntx:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("智能提醒修改");
		}
	</script>
</body>
</html>