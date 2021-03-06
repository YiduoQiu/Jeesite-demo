<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考核情况</title>
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
			var id = '${czzAqpxKhqk.id}';
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
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/aqpx/khqk/czzAqpxKhqk/">考核情况列表</a></li>
		<li class="active"><a href="${ctx}/aqpx/khqk/czzAqpxKhqk/form?id=${czzAqpxKhqk.id}">考核情况<shiro:hasPermission name="aqpx:khqk:czzAqpxKhqk:edit">${not empty czzAqpxKhqk.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="aqpx:khqk:czzAqpxKhqk:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">标题：</label>
				<div style="padding-top: 3px;">${czzAqpxKhqk.title}</div>
			</div>
			<div class="control-group">
				<label class="control-label">时间：</label>
				<div style="padding-top: 3px;"><fmt:formatDate value="${czzAqpxKhqk.date}" dateStyle="long" /></div>
			</div>
			<div class="control-group">
				<label class="control-label">地点：</label>
				<div style="padding-top: 3px;">${czzAqpxKhqk.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">考场情况：</label>
				<div style="margin-left:160px;margin-right:10px;padding-top: 3px;">${czzAqpxKhqk.content}</div>
			</div>
			<div class="control-group">
				<label class="control-label">成绩：</label>
				<table id="contentTable" class="table table-striped table-bordered table-condensed" style="width: 85%;">
					<thead>
						<tr>
							<th>姓名</th>
							<th>科目</th>
							<th>考试成绩</th>
							<th>是否合格</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${czzAqpxKhqk.czzAqpxKhqkdt1List}" var="czzAqpxKhqk">
						<tr>
							<td>
								${czzAqpxKhqk.name}
							</td>
							<td>
								${czzAqpxKhqk.subject}
							</td>
							<td>
								${czzAqpxKhqk.grade}
							</td>
							<td>
								${fns:getDictLabel(czzAqpxKhqk.standard, 'yes_no', '')}
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上传现场图片：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzAqpxKhqk" action="${ctx}/aqpx/khqk/czzAqpxKhqk/save" method="post" class="form-horizontal" style="display:none;">
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
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${czzAqpxKhqk.date}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地点：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">考场情况：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="content" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">成绩：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>姓名</th>
								<th>科目</th>
								<th>考试成绩</th>
								<th>是否合格</th>
								<shiro:hasPermission name="aqpx:khqk:czzAqpxKhqk:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="czzAqpxKhqkdt1List">
						</tbody>
						<shiro:hasPermission name="aqpx:khqk:czzAqpxKhqk:edit"><tfoot>
							<tr><td colspan="6"><a href="javascript:" onclick="addRow('#czzAqpxKhqkdt1List', czzAqpxKhqkdt1RowIdx, czzAqpxKhqkdt1Tpl);czzAqpxKhqkdt1RowIdx = czzAqpxKhqkdt1RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="czzAqpxKhqkdt1Tpl">//<!--
						<tr id="czzAqpxKhqkdt1List{{idx}}">
							<td class="hide">
								<input id="czzAqpxKhqkdt1List{{idx}}_id" name="czzAqpxKhqkdt1List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzAqpxKhqkdt1List{{idx}}_delFlag" name="czzAqpxKhqkdt1List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="czzAqpxKhqkdt1List{{idx}}_name" name="czzAqpxKhqkdt1List[{{idx}}].name" type="text" value="{{row.name}}" maxlength="24" class="input-small "/>
							</td>
							<td>
								<input id="czzAqpxKhqkdt1List{{idx}}_subject" name="czzAqpxKhqkdt1List[{{idx}}].subject" type="text" value="{{row.subject}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqpxKhqkdt1List{{idx}}_grade" name="czzAqpxKhqkdt1List[{{idx}}].grade" type="text" value="{{row.grade}}" maxlength="6" class="input-small "/>
							</td>
							<td>
								<c:forEach items="${fns:getDictList('yes_no')}" var="dict" varStatus="dictStatus">
									<span><input id="czzAqpxKhqkdt1List{{idx}}_standard${dictStatus.index}" name="czzAqpxKhqkdt1List[{{idx}}].standard" type="radio" value="${dict.value}" data-value="{{row.standard}}"><label for="czzAqpxKhqkdt1List{{idx}}_standard${dictStatus.index}">${dict.label}</label></span>
								</c:forEach>
							</td>
							<shiro:hasPermission name="aqpx:khqk:czzAqpxKhqk:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#czzAqpxKhqkdt1List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var czzAqpxKhqkdt1RowIdx = 0, czzAqpxKhqkdt1Tpl = $("#czzAqpxKhqkdt1Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(czzAqpxKhqk.czzAqpxKhqkdt1List)};
							for (var i=0; i<data.length; i++){
								addRow('#czzAqpxKhqkdt1List', czzAqpxKhqkdt1RowIdx, czzAqpxKhqkdt1Tpl, data[i]);
								czzAqpxKhqkdt1RowIdx = czzAqpxKhqkdt1RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="control-group">
			<label class="control-label">上传现场图片：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/aqpx/khqk/czzAqpxKhqk" selectMultiple="true"/>
				<span class="help-inline">请添加现场图片</span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqpx:khqk:czzAqpxKhqk:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("考核情况修改");
		}
	</script>
</body>
</html>