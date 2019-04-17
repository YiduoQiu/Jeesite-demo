<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>职业健康</title>
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
			var id = '${czzZyjk.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			//显示附件名
			show_preFile();
			var check = $("input[name='diseaseFlag']");
			var checked = $("input[name='diseaseFlag']:checked").val();
			if(checked == '1'){
				$("#czff").show();
			} else {
				$("#czff").hide();
			}
			check.bind("click",function(e){
				if($(this).val() == '0') {
					$("#czff").hide();
				} else {
					$("#czff").show();
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
		<li><a href="${ctx}/zyjk/czzZyjk/">职业健康</a></li>
		<li class="active"><a href="${ctx}/zyjk/czzZyjk/form?id=${czzZyjk.id}">职业健康<shiro:hasPermission name="zyjk:czzZyjk:edit">${not empty czzZyjk.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="zyjk:czzZyjk:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">职业危害类别：</label>
				<div style="padding-top: 3px;">${czzZyjk.type}</div>
			</div>
			<div class="control-group">
				<label class="control-label">涉及人员名单：</label>
				<div style="padding-top: 3px;">${czzZyjk.person}</div>
			</div>
			<div class="control-group">
				<label class="control-label">危害登记：</label>
				<div style="padding-top: 3px;">${czzZyjk.harm}</div>
			</div>
			<div class="control-group">
				<label class="control-label">现场检测：</label>
				<div style="padding-top: 3px;">${czzZyjk.onsitetest}</div>
			</div>
			<div class="control-group">
				<label class="control-label">个人防护使用情况：</label>
				<div style="padding-top: 3px;">${czzZyjk.perprotect}</div>
			</div>
			<div class="control-group">
				<label class="control-label">个体防护：</label>
				<table id="contentTable" class="table table-striped table-bordered table-condensed" style="width: 85%;">
					<thead>
						<tr>
							<th>装备名称</th>
							<th>数量</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${czzZyjk.czzZyjkDt1List}" var="czzZyjk">
						<tr>
							<td>
								${czzZyjk.name}
							</td>
							<td>
								${czzZyjk.account}
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="control-group">
				<label class="control-label">体检情况：</label>
				<div style="padding-top: 3px;">${czzZyjk.phycheck}</div>
			</div>
			<div class="control-group">
				<label class="control-label">有无职业病：</label>
				<div style="padding-top: 3px;">${fns:getDictLabel(czzZyjk.diseaseFlag, 'disease_flag', '')}</div>
			</div>
			<c:if test="${fns:getDictLabel(czzZyjk.diseaseFlag, 'disease_flag', '') eq '有'}">
				<div class="control-group">
					<label class="control-label">处置方法：</label>
					<div style="padding-top: 3px;">${czzZyjk.method}</div>
				</div>
			</c:if>
		</div>
		<div class="control-group">
			<label class="control-label">考勤情况附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="zyjk:czzZyjk:edit"><input id="btnSubmit" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzZyjk" action="${ctx}/zyjk/czzZyjk/save" method="post" class="form-horizontal" style="display:none;" >
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">职业危害类别：</label>
			<div class="controls">
				<form:input path="type" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<a href="${ctx}/zybwh_cx/czzZybflCx" target="_blank"><span class="help-inline">职业危害类别查询</span></a>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">涉及人员名单：</label>
			<div class="controls">
				<form:textarea path="person" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<span class="help-inline">姓名间请用逗号隔开</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">危害登记：</label>
			<div class="controls">
				<form:textarea path="harm" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="harm" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">现场检测：</label>
			<div class="controls">
				<form:textarea path="onsitetest" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="onsitetest" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">个人防护使用情况：</label>
			<div class="controls">
				<form:textarea path="perprotect" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="perprotect" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
				<label class="control-label">个体防护：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>装备名称</th>
								<th>数量</th>
								<shiro:hasPermission name="zyjk:czzZyjk:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="czzZyjkDt1List">
						</tbody>
						<shiro:hasPermission name="zyjk:czzZyjk:edit"><tfoot>
							<tr><td colspan="5"><a href="javascript:" onclick="addRow('#czzZyjkDt1List', czzZyjkDt1RowIdx, czzZyjkDt1Tpl);czzZyjkDt1RowIdx = czzZyjkDt1RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="czzZyjkDt1Tpl">//<!--
						<tr id="czzZyjkDt1List{{idx}}">
							<td class="hide">
								<input id="czzZyjkDt1List{{idx}}_id" name="czzZyjkDt1List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzZyjkDt1List{{idx}}_delFlag" name="czzZyjkDt1List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="czzZyjkDt1List{{idx}}_name" name="czzZyjkDt1List[{{idx}}].name" type="text" value="{{row.name}}" maxlength="200" class="input-small "/>
							</td>
							<td>
								<input id="czzZyjkDt1List{{idx}}_account" name="czzZyjkDt1List[{{idx}}].account" type="text" value="{{row.account}}" class="input-small "/>
							</td>
							<shiro:hasPermission name="zyjk:czzZyjk:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#czzZyjkDt1List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var czzZyjkDt1RowIdx = 0, czzZyjkDt1Tpl = $("#czzZyjkDt1Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(czzZyjk.czzZyjkDt1List)};
							for (var i=0; i<data.length; i++){
								addRow('#czzZyjkDt1List', czzZyjkDt1RowIdx, czzZyjkDt1Tpl, data[i]);
								czzZyjkDt1RowIdx = czzZyjkDt1RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="control-group">
			<label class="control-label">体检情况：</label>
			<div class="controls">
				<form:textarea path="phycheck" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge" style="display:none"/>
				<sys:ckeditor replace="phycheck" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">有无职业病：</label>
			<div class="controls">
				<form:radiobuttons path="diseaseFlag" items="${fns:getDictList('disease_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" id="czff">
			<label class="control-label">处置方法：</label>
			<div class="controls">
				<form:textarea path="method" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge required" style="display:none"/>
				<sys:ckeditor replace="method" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/zyjk/czzZyjk" selectMultiple="true"/>
				<span class="help-inline">请添加相关方面资料</span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="zyjk:czzZyjk:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("职业健康修改");
		}
	</script>
</body>
</html>