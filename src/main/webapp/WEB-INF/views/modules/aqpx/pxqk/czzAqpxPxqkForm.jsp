<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>培训情况管理</title>
	<meta name="decorator" content="default"/>
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
		<li><a href="${ctx}/aqpx/pxqk/czzAqpxPxqk/">培训情况列表</a></li>
		<li class="active"><a href="${ctx}/aqpx/pxqk/czzAqpxPxqk/form?id=${czzAqpxPxqk.id}">培训情况<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit">${not empty czzAqpxPxqk.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="aqpx:pxqk:czzAqpxPxqk:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="czzAqpxPxqk" action="${ctx}/aqpx/pxqk/czzAqpxPxqk/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${czzAqpxPxqk.date}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地点：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">课程表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>时间</th>
								<th>周一</th>
								<th>周二</th>
								<th>周三</th>
								<th>周四</th>
								<th>周五</th>
								<th>周六</th>
								<th>周日</th>
								<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="czzAqpxPxqkdt1List">
						</tbody>
						<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit"><tfoot>
							<tr><td colspan="10"><a href="javascript:" onclick="addRow('#czzAqpxPxqkdt1List', czzAqpxPxqkdt1RowIdx, czzAqpxPxqkdt1Tpl);czzAqpxPxqkdt1RowIdx = czzAqpxPxqkdt1RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="czzAqpxPxqkdt1Tpl">//<!--
						<tr id="czzAqpxPxqkdt1List{{idx}}">
							<td class="hide">
								<input id="czzAqpxPxqkdt1List{{idx}}_id" name="czzAqpxPxqkdt1List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzAqpxPxqkdt1List{{idx}}_delFlag" name="czzAqpxPxqkdt1List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="czzAqpxPxqkdt1List{{idx}}_date" name="czzAqpxPxqkdt1List[{{idx}}].date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
									value="{{row.date}}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});"/>
							</td>
							<td>
								<input id="czzAqpxPxqkdt1List{{idx}}_monday" name="czzAqpxPxqkdt1List[{{idx}}].monday" type="text" value="{{row.monday}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqpxPxqkdt1List{{idx}}_tuesday" name="czzAqpxPxqkdt1List[{{idx}}].tuesday" type="text" value="{{row.tuesday}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqpxPxqkdt1List{{idx}}_wednesday" name="czzAqpxPxqkdt1List[{{idx}}].wednesday" type="text" value="{{row.wednesday}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqpxPxqkdt1List{{idx}}_thursday" name="czzAqpxPxqkdt1List[{{idx}}].thursday" type="text" value="{{row.thursday}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqpxPxqkdt1List{{idx}}_friday" name="czzAqpxPxqkdt1List[{{idx}}].friday" type="text" value="{{row.friday}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqpxPxqkdt1List{{idx}}_saturday" name="czzAqpxPxqkdt1List[{{idx}}].saturday" type="text" value="{{row.saturday}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqpxPxqkdt1List{{idx}}_sunday" name="czzAqpxPxqkdt1List[{{idx}}].sunday" type="text" value="{{row.sunday}}" maxlength="100" class="input-small "/>
							</td>
							<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#czzAqpxPxqkdt1List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var czzAqpxPxqkdt1RowIdx = 0, czzAqpxPxqkdt1Tpl = $("#czzAqpxPxqkdt1Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(czzAqpxPxqk.czzAqpxPxqkdt1List)};
							for (var i=0; i<data.length; i++){
								addRow('#czzAqpxPxqkdt1List', czzAqpxPxqkdt1RowIdx, czzAqpxPxqkdt1Tpl, data[i]);
								czzAqpxPxqkdt1RowIdx = czzAqpxPxqkdt1RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="control-group">
			<label class="control-label">培训内容：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" maxlength="3000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">考勤情况：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" maxlength="100" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/aqpx/pxqk/czzAqpxPxqk" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>