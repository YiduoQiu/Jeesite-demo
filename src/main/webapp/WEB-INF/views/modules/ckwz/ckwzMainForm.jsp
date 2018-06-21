<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库物资管理管理</title>
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
		<li><a href="${ctx}/ckwz/ckwzMain/">仓库物资管理列表</a></li>
		<li class="active"><a href="${ctx}/ckwz/ckwzMain/form?id=${ckwzMain.id}">仓库物资管理<shiro:hasPermission name="ckwz:ckwzMain:edit">${not empty ckwzMain.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="ckwz:ckwzMain:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="ckwzMain" action="${ctx}/ckwz/ckwzMain/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">物资分类：</label>
			<div class="controls">
				<form:input path="type" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">物资创建人：</label>
			<div class="controls">
				<form:input path="personname" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数量（总计）：</label>
			<div class="controls">
				<form:input path="amount" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新日期：</label>
			<div class="controls">
				<input name="updatetime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${ckwzMain.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">业务数据子表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>库位</th>
								<th>备注信息</th>
								<th>入库时间</th>
								<th>数量</th>
								<th>经手人</th>
								<shiro:hasPermission name="ckwz:ckwzMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="ckwzChildList">
						</tbody>
						<shiro:hasPermission name="ckwz:ckwzMain:edit"><tfoot>
							<tr><td colspan="7"><a href="javascript:" onclick="addRow('#ckwzChildList', ckwzChildRowIdx, ckwzChildTpl);ckwzChildRowIdx = ckwzChildRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="ckwzChildTpl">//<!--
						<tr id="ckwzChildList{{idx}}">
							<td class="hide">
								<input id="ckwzChildList{{idx}}_id" name="ckwzChildList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="ckwzChildList{{idx}}_delFlag" name="ckwzChildList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="ckwzChildList{{idx}}_location" name="ckwzChildList[{{idx}}].location" type="text" value="{{row.location}}" maxlength="200" class="input-small "/>
							</td>
							<td>
								<textarea id="ckwzChildList{{idx}}_remarks" name="ckwzChildList[{{idx}}].remarks" rows="4" maxlength="255" class="input-small ">{{row.remarks}}</textarea>
							</td>
							<td>
								<input id="ckwzChildList{{idx}}_inTinme" name="ckwzChildList[{{idx}}].inTinme" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
									value="{{row.inTinme}}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
							</td>
							<td>
								<input id="ckwzChildList{{idx}}_amount" name="ckwzChildList[{{idx}}].amount" type="text" value="{{row.amount}}" class="input-small "/>
							</td>
							<td>
								<input id="ckwzChildList{{idx}}_name" name="ckwzChildList[{{idx}}].name" type="text" value="{{row.name}}" maxlength="100" class="input-small "/>
							</td>
							<shiro:hasPermission name="ckwz:ckwzMain:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#ckwzChildList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var ckwzChildRowIdx = 0, ckwzChildTpl = $("#ckwzChildTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(ckwzMain.ckwzChildList)};
							for (var i=0; i<data.length; i++){
								addRow('#ckwzChildList', ckwzChildRowIdx, ckwzChildTpl, data[i]);
								ckwzChildRowIdx = ckwzChildRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="ckwz:ckwzMain:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>