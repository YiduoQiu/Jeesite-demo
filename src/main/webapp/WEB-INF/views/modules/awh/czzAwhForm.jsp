<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安委会管理</title>
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
		<li><a href="${ctx}/awh/czzAwh/">安委会列表</a></li>
		<li class="active"><a href="${ctx}/awh/czzAwh/form?id=${czzAwh.id}">安委会<shiro:hasPermission name="awh:czzAwh:edit">${not empty czzAwh.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="awh:czzAwh:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="czzAwh" action="${ctx}/awh/czzAwh/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分管工作：</label>
			<div class="controls">
				<form:input path="job" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">职务：</label>
			<div class="controls">
				<form:input path="post" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">安委会子表__副主任：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>姓名</th>
								<th>联系电话</th>
								<th>分管工作</th>
								<th>职务</th>
								<shiro:hasPermission name="awh:czzAwh:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="czzAwhDt1List">
						</tbody>
						<shiro:hasPermission name="awh:czzAwh:edit"><tfoot>
							<tr><td colspan="6"><a href="javascript:" onclick="addRow('#czzAwhDt1List', czzAwhDt1RowIdx, czzAwhDt1Tpl);czzAwhDt1RowIdx = czzAwhDt1RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="czzAwhDt1Tpl">//<!--
						<tr id="czzAwhDt1List{{idx}}">
							<td class="hide">
								<input id="czzAwhDt1List{{idx}}_id" name="czzAwhDt1List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzAwhDt1List{{idx}}_delFlag" name="czzAwhDt1List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="czzAwhDt1List{{idx}}_name" name="czzAwhDt1List[{{idx}}].name" type="text" value="{{row.name}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAwhDt1List{{idx}}_phone" name="czzAwhDt1List[{{idx}}].phone" type="text" value="{{row.phone}}" maxlength="20" class="input-small "/>
							</td>
							<td>
								<input id="czzAwhDt1List{{idx}}_job" name="czzAwhDt1List[{{idx}}].job" type="text" value="{{row.job}}" maxlength="1000" class="input-small "/>
							</td>
							<td>
								<input id="czzAwhDt1List{{idx}}_post" name="czzAwhDt1List[{{idx}}].post" type="text" value="{{row.post}}" maxlength="200" class="input-small "/>
							</td>
							<shiro:hasPermission name="awh:czzAwh:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#czzAwhDt1List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var czzAwhDt1RowIdx = 0, czzAwhDt1Tpl = $("#czzAwhDt1Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(czzAwh.czzAwhDt1List)};
							for (var i=0; i<data.length; i++){
								addRow('#czzAwhDt1List', czzAwhDt1RowIdx, czzAwhDt1Tpl, data[i]);
								czzAwhDt1RowIdx = czzAwhDt1RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">安委会子表_成员：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>姓名</th>
								<th>联系电话</th>
								<th>分管工作</th>
								<th>职务</th>
								<shiro:hasPermission name="awh:czzAwh:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="czzAwhDt2List">
						</tbody>
						<shiro:hasPermission name="awh:czzAwh:edit"><tfoot>
							<tr><td colspan="6"><a href="javascript:" onclick="addRow('#czzAwhDt2List', czzAwhDt2RowIdx, czzAwhDt2Tpl);czzAwhDt2RowIdx = czzAwhDt2RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="czzAwhDt2Tpl">//<!--
						<tr id="czzAwhDt2List{{idx}}">
							<td class="hide">
								<input id="czzAwhDt2List{{idx}}_id" name="czzAwhDt2List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzAwhDt2List{{idx}}_delFlag" name="czzAwhDt2List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="czzAwhDt2List{{idx}}_name" name="czzAwhDt2List[{{idx}}].name" type="text" value="{{row.name}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAwhDt2List{{idx}}_phone" name="czzAwhDt2List[{{idx}}].phone" type="text" value="{{row.phone}}" maxlength="20" class="input-small "/>
							</td>
							<td>
								<input id="czzAwhDt2List{{idx}}_job" name="czzAwhDt2List[{{idx}}].job" type="text" value="{{row.job}}" maxlength="1000" class="input-small "/>
							</td>
							<td>
								<input id="czzAwhDt2List{{idx}}_post" name="czzAwhDt2List[{{idx}}].post" type="text" value="{{row.post}}" maxlength="200" class="input-small "/>
							</td>
							<shiro:hasPermission name="awh:czzAwh:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#czzAwhDt2List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var czzAwhDt2RowIdx = 0, czzAwhDt2Tpl = $("#czzAwhDt2Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(czzAwh.czzAwhDt2List)};
							for (var i=0; i<data.length; i++){
								addRow('#czzAwhDt2List', czzAwhDt2RowIdx, czzAwhDt2Tpl, data[i]);
								czzAwhDt2RowIdx = czzAwhDt2RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" maxlength="100" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/awh/czzAwh" selectMultiple="true"/>
				<span class="help-inline">本企业安全机构成立文件</span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="awh:czzAwh:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>