<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安委会管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//location.reload();
			$("#filePreview").nextAll().hide();
			$("#help_message").show();
			for(var i=0;i<$("ol li").length;i++){
				$("ol li")[i].innerHTML = $("ol li")[i].innerText.substr(0, $("ol li")[i].innerText.length - 1);
			}
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/awh/czzAwh/form?id=${czzAwh.id}">安委会</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="czzAwh" action="${ctx}/awh/czzAwh/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
				<label class="control-label">主任：</label>
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
						<tbody>
							<tr>
							<td>
								<span>${czzAwh.name}</span>
							</td>
							<td>
								<span>${czzAwh.phone}</span>
							</td>
							<td>
								<span>${czzAwh.job}</span>
							</td>
							<td>
								<span>${czzAwh.post}</span>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">副主任：</label>
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
					</table>
					<script type="text/template" id="czzAwhDt1Tpl">//<!--
						<tr id="czzAwhDt1List{{idx}}">
							<td class="hide">
								<input id="czzAwhDt1List{{idx}}_id" name="czzAwhDt1List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzAwhDt1List{{idx}}_delFlag" name="czzAwhDt1List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<span>{{row.name}}</span>
							</td>
							<td>
								<span>{{row.phone}}</span>
							</td>
							<td>
								<span>{{row.job}}</span>
							</td>
							<td>
								<span>{{row.post}}</span>
							</td>
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
				<label class="control-label">成员：</label>
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
					</table>
					<script type="text/template" id="czzAwhDt2Tpl">//<!--
						<tr id="czzAwhDt2List{{idx}}">
							<td class="hide">
								<input id="czzAwhDt2List{{idx}}_id" name="czzAwhDt2List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzAwhDt2List{{idx}}_delFlag" name="czzAwhDt2List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<span>{{row.name}}</span>
							</td>
							<td>
								<span>{{row.phone}}</span>
							</td>
							<td>
								<span>{{row.job}}</span>
							</td>
							<td>
								<span>{{row.post}}</span>
							</td>
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
					<span class="help-inline" id="help_message">本企业安全管理人员任命文件</span>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="awh:czzAwh:edit">
				<a href="${ctx}/awh/czzAwh/list?id=${czzAwh.id}"><input id="btnSubmit" class="btn btn-primary" type="button" value="修 改"/>&nbsp;</a>
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>