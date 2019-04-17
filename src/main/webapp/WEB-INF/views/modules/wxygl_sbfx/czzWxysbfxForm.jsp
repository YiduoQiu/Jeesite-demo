<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>重大危险源管理</title>
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
			$("#mention_yes").hide();
			$("#mention_no").hide();
			$("#btnSubmit").hide();
			$("#wxylx").hide();
			//隐藏正文
			var id = '${czzWxysbfx.id}';
			if(id == ''){
				$("#view").hide();
				$("#inputForm").show();
			}
			$("a.jquery-word-export").click(function(event) {
				$("#pagecontent").wordExport($("title").html().substring(0,$("title").html().indexOf("-")-1));
		    });
			show_preFile();
		});
		function calulat(data){
			var str = data.id;
			str=str.substr(0,str.indexOf('_'));
			var max = $("#"+str+"_amountMax").val();
			var cri = $("#"+str+"_amountCri").val();
			var aqr = $("#"+str+"_aqr");
			aqr.val(max/cri);
		}
		function sum() {
			var sum = $("#czzWxysbfxDt1List tr:first td:first input:first");
			var sum_id = sum.attr('id');
			var tr_first = sum_id.substring(sum_id.indexOf("_")-1,sum_id.indexOf("_"));//得到第一个元素的id数
			var tr_num = $("#czzWxysbfxDt1List").find("tr").length;//得到table的总行数
			var aqr_sum = 0;
			var max_sum = 0;
			var cri_sum = 0;
			for(var i=Number(tr_first);i<Number(tr_num)+Number(tr_first);i++){
				if($("#czzWxysbfxDt1List"+i+"_amountMax").length == 0 || $("#czzWxysbfxDt1List"+i+"_amountCri").length == 0){
					tr_num++;
					continue;
				}
				max_sum = Number($("#czzWxysbfxDt1List"+i+"_amountMax").val());
				cri_sum = Number($("#czzWxysbfxDt1List"+i+"_amountCri").val());
				aqr_sum = Number(aqr_sum) + max_sum/cri_sum;
			}
			if (typeof(aqr_sum) == undefined || isNaN(aqr_sum) || !isFinite(aqr_sum)) {
				$("#btnSubmit").hide();
				alert("成分分析表存在非法数据，请删除多余空行，更正数据后再进行计算！");
			} else if(aqr_sum >= 1){
				$("#mention_yes").show();
				$("#mention_no").hide();
				$("#btnSubmit").show();
			} else if (aqr_sum < 1) {
				$("#mention_no").show();
				$("#mention_yes").hide();
				$("#btnSubmit").hide();
			}
		}
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
		<li><a href="${ctx}/wxygl_sbfx/czzWxysbfx/">重大危险源管理列表</a></li>
		<li class="active"><a href="${ctx}/wxygl_sbfx/czzWxysbfx/form?id=${czzWxysbfx.id}">重大危险源管理<shiro:hasPermission name="wxygl_sbfx:czzWxysbfx:edit">${not empty czzWxysbfx.id?'查看':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wxygl_sbfx:czzWxysbfx:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="view" class="form-horizontal">
		<div id="pagecontent">	
			<div class="control-group">
				<label class="control-label">危险源种类：</label>
				<div style="padding-top: 3px;">${fns:getDictLabel(czzWxysbfx.wxyKind, 'type_wxy', '')}</div>
			</div>
			<div class="control-group">
				<label class="control-label">危险源单元名称：</label>
				<div style="padding-top: 3px;">${czzWxysbfx.wxyName}</div>
			</div>
			<div class="control-group">
				<label class="control-label">成分分析表：</label>
				<table id="contentTable" class="table table-striped table-bordered table-condensed" style="width: 85%;">
					<thead>
						<tr>
							<th>危险物质</th>
							<th>最大数量（吨）<a href="${ctx}/wxygl_sbfx/czzWxysbfx/help1" target="_blank">？</a></th>
							<th>相对应的临界量（吨）<a href="${ctx}/wxygl_sbfx/czzWxysbfx/help3" target="_blank">？</a></th>
							<th>辨识指标AQR（最大数量/临界量）</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${czzWxysbfx.czzWxysbfxDt1List}" var="czzWxysbfx">
						<tr>
							<td>
								${czzWxysbfx.name}
							</td>
							<td>
								${czzWxysbfx.amountMax}
							</td>
							<td>
								${czzWxysbfx.amountCri}
							</td>
							<td>
								${czzWxysbfx.aqr}
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="control-group">
				<label class="control-label">位置：</label>
				<div style="padding-top: 3px;">${czzWxysbfx.location}</div>
			</div>
			<div class="control-group">
				<label class="control-label">管理人员：</label>
				<div style="padding-top: 3px;">${czzWxysbfx.person}</div>
			</div>
			<div class="control-group">
				<label class="control-label">管理措施：</label>
				<div style="padding-top: 3px;">${czzWxysbfx.plan}</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div id="view_file" style="padding-top: 3px;margin-left:160px;"></div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wxygl_sbfx:czzWxysbfx:edit"><input id="btnSubmit_1" class="btn btn-primary" type="button" onclick="switch_content()" value="修 改"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<a class="btn jquery-word-export" href="javascript:void(0)">导出为word文档</a>
		</div>
	</div>
	<form:form id="inputForm" modelAttribute="czzWxysbfx" action="${ctx}/wxygl_sbfx/czzWxysbfx/save" method="post" class="form-horizontal" style="display:none;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group" id="wxylx">
			<label class="control-label">危险源类型：</label>
			<div class="controls">
				<form:select path="wxyType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('wxy_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">危险源种类：</label>
			<div class="controls">
				<form:select path="wxyKind" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_wxy')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">危险源单元名称：</label>
			<div class="controls">
				<form:input path="wxyName" htmlEscape="false" maxlength="100" class="input-xlarge required"/><span class="help-inline">
				<font color="red">*</font></span>
				<span class="help-inline">指一个（套）生产装置、设施或场所，或同属一个工厂的且边缘距离小于500m的几个（套）生产装置、设施或场所。 </span>
			</div>
		</div>
		<div class="control-group">
				<label class="control-label">成分分析表：</br><a href="${ctx}/wxygl_sbfx/czzWxysbfx/search" target="_blank">危险化学品临界量一览表</a>
				</br><a href="${ctx}/wxygl_sbfx/czzWxysbfx/help2" target="_blank">危险辨识说明</a></label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>危险物质</th>
								<th>最大数量（吨）<a href="${ctx}/wxygl_sbfx/czzWxysbfx/help1" target="_blank">？</a></th>
								<th>相对应的临界量（吨）<a href="${ctx}/wxygl_sbfx/czzWxysbfx/help3" target="_blank">？</a></th>
								<th>辨识指标AQR（最大数量/临界量）</th>
								<shiro:hasPermission name="wxygl_sbfx:czzWxysbfx:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="czzWxysbfxDt1List">
						</tbody>
						<shiro:hasPermission name="wxygl_sbfx:czzWxysbfx:edit"><tfoot>
							<tr>
								<td colspan="7"><a href="javascript:" onclick="addRow('#czzWxysbfxDt1List', czzWxysbfxDt1RowIdx, czzWxysbfxDt1Tpl);czzWxysbfxDt1RowIdx = czzWxysbfxDt1RowIdx + 1;" class="btn">新增</a></td>
							</tr>
						</tfoot></shiro:hasPermission>
					</table>
					<div>
						<input type="button" id="cal_btn" onclick="sum()" value="计算" class="btn" style="width: 52px;">
						<span>请正确填写单元内所含危险物质，并计算该单元是否属于重大危险源。</span>
					</div>
					<div id="mention_yes" style="color:red;">
						当前单元辨识指标AQR大于或等于1，属于重大危险源。
					</div>
					<div id="mention_no">
						当前单元辨识指标AQR小于1，不属于重大危险源，请录入一般危险源管理台账。
					</div>
					<script type="text/template" id="czzWxysbfxDt1Tpl">//<!--
						<tr id="czzWxysbfxDt1List{{idx}}">
							<td class="hide">
								<input id="czzWxysbfxDt1List{{idx}}_id" name="czzWxysbfxDt1List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzWxysbfxDt1List{{idx}}_delFlag" name="czzWxysbfxDt1List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="czzWxysbfxDt1List{{idx}}_name" name="czzWxysbfxDt1List[{{idx}}].name" type="text" value="{{row.name}}" maxlength="100" onkeyup="calulat(this)" class="input-small "/>
							</td>
							<td>
								<input type="number" min="0" step="0.001" id="czzWxysbfxDt1List{{idx}}_amountMax" name="czzWxysbfxDt1List[{{idx}}].amountMax" type="text" value="{{row.amountMax}}" onkeyup="calulat(this)" class="input-small "/>
							</td>
							<td>
								<input type="number" min="0" step="0.001" id="czzWxysbfxDt1List{{idx}}_amountCri" name="czzWxysbfxDt1List[{{idx}}].amountCri" type="text" value="{{row.amountCri}}" onkeyup="calulat(this)" class="input-small "/>
							</td>
							<td>
								<input id="czzWxysbfxDt1List{{idx}}_aqr" name="czzWxysbfxDt1List[{{idx}}].aqr" type="text" value="{{row.aqr}}" readonly="readonly" class="input-small "/>
							</td>
							<shiro:hasPermission name="wxygl_sbfx:czzWxysbfx:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#czzWxysbfxDt1List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var czzWxysbfxDt1RowIdx = 0, czzWxysbfxDt1Tpl = $("#czzWxysbfxDt1Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(czzWxysbfx.czzWxysbfxDt1List)};
							for (var i=0; i<data.length; i++){
								addRow('#czzWxysbfxDt1List', czzWxysbfxDt1RowIdx, czzWxysbfxDt1Tpl, data[i]);
								czzWxysbfxDt1RowIdx = czzWxysbfxDt1RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="control-group">
			<label class="control-label">位置：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="300" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">管理人员：</label>
			<div class="controls">
				<form:input path="person" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">管理措施：</br><span class="help-inline">必须包括安全措施和</br>应急措施</span></label>
			<div class="controls">
				<form:textarea path="plan" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge " style="display:none"/>
				<sys:ckeditor replace="plan" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/wxygl_sbfx/czzWxysbfx" selectMultiple="true"/>
			</div>
		</div>
		<div>
			<span class="help_line" style="color:red; font-size:21px; display: block; padding-top: 12px;padding-left: 90px;">重大危险源必须向安全管理部门和相关部门报备！</span>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wxygl_sbfx:czzWxysbfx:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function switch_content(){
			$("#view").hide();
			$("#inputForm").show();
			$(".nav .active a").html("重大危险源修改");
		}
	</script>
</body>
</html>