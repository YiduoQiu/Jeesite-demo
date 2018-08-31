<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全投入资金计划管理</title>
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
			$("#title_new"+idx).html(row.amountTitle);
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
		<li><a href="${ctx}/aqtrzj/czzAqtrzj/">安全投入资金计划列表</a></li>
		<li class="active"><a href="${ctx}/aqtrzj/czzAqtrzj/form?id=${czzAqtrzj.id}">安全投入资金计划<shiro:hasPermission name="aqtrzj:czzAqtrzj:edit">${not empty czzAqtrzj.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="aqtrzj:czzAqtrzj:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="czzAqtrzj" action="${ctx}/aqtrzj/czzAqtrzj/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">制定时间：</label>
			<div class="controls">
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${czzAqtrzj.date}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
			<div class="control-group">
				<div class="controls" style="margin-left:10px;">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>资金类目</th>
								<th>一月份</th>
								<th>二月份</th>
								<th>三月份</th>
								<th>四月份</th>
								<th>五月份</th>
								<th>六月份</th>
								<th>七月份</th>
								<th>八月份</th>
								<th>九月份</th>
								<th>十月份</th>
								<th>十一月份</th>
								<th>十二月份</th>
								<th>年度合计</th>
								<shiro:hasPermission name="aqtrzj:czzAqtrzj:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="czzAqtrzjDt1List">
							<c:forEach var="i" begin="0" end="12">
							<tr id="czzAqtrzjDt1List${i}" class="ini">
								<td class="hide">
									<input id="czzAqtrzjDt1List${i}_id" name="czzAqtrzjDt1List[${i}].id" type="hidden" value=""/>
									<input id="czzAqtrzjDt1List${i}_delFlag" name="czzAqtrzjDt1List[${i}].delFlag" type="hidden" value="0"/>
								</td>
								<td>
									<span id="title${i}"></span>
									<input id="czzAqtrzjDt1List${i}_amountTitle" name="czzAqtrzjDt1List[${i}].amountTitle" type="hidden" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountJanuray" name="czzAqtrzjDt1List[${i}].amountJanuray" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountFebruary" name="czzAqtrzjDt1List[${i}].amountFebruary" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountMarch" name="czzAqtrzjDt1List[${i}].amountMarch" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountApril" name="czzAqtrzjDt1List[${i}].amountApril" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountMay" name="czzAqtrzjDt1List[${i}].amountMay" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountJune" name="czzAqtrzjDt1List[${i}].amountJune" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountJuly" name="czzAqtrzjDt1List[${i}].amountJuly" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountAugust" name="czzAqtrzjDt1List[${i}].amountAugust" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountSeptember" name="czzAqtrzjDt1List[${i}].amountSeptember" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountOctober" name="czzAqtrzjDt1List[${i}].amountOctober" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountNovember" name="czzAqtrzjDt1List[${i}].amountNovember" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountDecember" name="czzAqtrzjDt1List[${i}].amountDecember" type="text" value="" maxlength="100" class="input-small "/>
								</td>
								<td>
									<input id="czzAqtrzjDt1List${i}_amountYear" name="czzAqtrzjDt1List[${i}].amountYear" type="text" value="" maxlength="100" class="input-small "/>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<script type="text/template" id="czzAqtrzjDt1Tpl">//<!--
						<tr id="czzAqtrzjDt1List{{idx}}">
							<td class="hide">
								<input id="czzAqtrzjDt1List{{idx}}_id" name="czzAqtrzjDt1List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="czzAqtrzjDt1List{{idx}}_delFlag" name="czzAqtrzjDt1List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<span id="title_new{{idx}}"></span>
								<input id="czzAqtrzjDt1List{{idx}}_amountTitle" name="czzAqtrzjDt1List[{{idx}}].amountTitle" type="hidden" value="{{row.amountTitle}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountJanuray" name="czzAqtrzjDt1List[{{idx}}].amountJanuray" type="text" value="{{row.amountJanuray}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountFebruary" name="czzAqtrzjDt1List[{{idx}}].amountFebruary" type="text" value="{{row.amountFebruary}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountMarch" name="czzAqtrzjDt1List[{{idx}}].amountMarch" type="text" value="{{row.amountMarch}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountApril" name="czzAqtrzjDt1List[{{idx}}].amountApril" type="text" value="{{row.amountApril}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountMay" name="czzAqtrzjDt1List[{{idx}}].amountMay" type="text" value="{{row.amountMay}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountJune" name="czzAqtrzjDt1List[{{idx}}].amountJune" type="text" value="{{row.amountJune}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountJuly" name="czzAqtrzjDt1List[{{idx}}].amountJuly" type="text" value="{{row.amountJuly}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountAugust" name="czzAqtrzjDt1List[{{idx}}].amountAugust" type="text" value="{{row.amountAugust}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountSeptember" name="czzAqtrzjDt1List[{{idx}}].amountSeptember" type="text" value="{{row.amountSeptember}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountOctober" name="czzAqtrzjDt1List[{{idx}}].amountOctober" type="text" value="{{row.amountOctober}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountNovember" name="czzAqtrzjDt1List[{{idx}}].amountNovember" type="text" value="{{row.amountNovember}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountDecember" name="czzAqtrzjDt1List[{{idx}}].amountDecember" type="text" value="{{row.amountDecember}}" maxlength="100" class="input-small "/>
							</td>
							<td>
								<input id="czzAqtrzjDt1List{{idx}}_amountYear" name="czzAqtrzjDt1List[{{idx}}].amountYear" type="text" value="{{row.amountYear}}" maxlength="100" class="input-small "/>
							</td>
							<shiro:hasPermission name="aqtrzj:czzAqtrzj:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#czzAqtrzjDt1List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var czzAqtrzjDt1RowIdx = 0, czzAqtrzjDt1Tpl = $("#czzAqtrzjDt1Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(czzAqtrzj.czzAqtrzjDt1List)};
							if (data.length == 0) {
								$("#title0").html("安全技术措施工程建设");
								$("#title1").html("安全设备、设施、工艺更新和维护");
								$("#title2").html("安全生产宣传、教育、培训");
								$("#title3").html("重大危险源监控和事故隐患整改");
								$("#title4").html("安全生产风险辨识、评估和标准化建设");
								$("#title5").html("劳动防护用品配备与更新");
								$("#title6").html("安全生产新技术、新设备、新材料、新工艺的推广应用");
								$("#title7").html("安全设施、特种设备等设备设施的检测检验");
								$("#title8").html("参加安全生产责任保险");
								$("#title9").html("应急救援队伍建设、应急设备装备和救援物资配备及应急演练");
								$("#title10").html("聘请或委托第三方机构开展安全生产咨询、评价等");
								$("#title11").html("其他与安全生产直接相关的支出");
								$("#title12").html("合计");
								for (var i = 0 ;i<= 12;i++) {
									$("#czzAqtrzjDt1List"+i+"_amountTitle").val($("#title"+i).html());
								}
							} else {
								$(".ini").hide();
							}
							for (var i=0; i<data.length; i++){
								addRow('#czzAqtrzjDt1List', czzAqtrzjDt1RowIdx, czzAqtrzjDt1Tpl, data[i]);
								czzAqtrzjDt1RowIdx = czzAqtrzjDt1RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqtrzj:czzAqtrzj:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>