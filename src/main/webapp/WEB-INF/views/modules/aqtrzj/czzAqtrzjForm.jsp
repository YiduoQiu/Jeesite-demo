<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全投入资金计划管理</title>
	<style type="text/css">
			html, body {
				width: 100%;
				height: 100%;
				/*overflow: hidden;*/
				margin: 0;
				padding: 0;
				font-family: "微软雅黑", arial, helvetica;
				position: relative;
				background: #fff;
				font-size: 14px;
			}
			.aqtr-table-list {
				width: 100%;
				height: auto;
				padding: 20px;
				box-sizing: border-box;
				/*border: 1px solid #ddd;*/
			}
			.aqtr-table {
				width: 100%;
				border-collapse: collapse;
				border: 1px solid #dfdfdf;
			}
			.aqtr-table thead {
				height: 30px;
			}
			.aqtr-table thead th {
				width: 70px!important;
				font-size: 12px;
				color: #666;
				height: 30px;
				background: #eee;
			}
			.aqtr-table td input {
				width: 70px;
				padding: 0 0 0 5px;
				box-sizing: border-box;
				outline: none;
				border: 1px solid #fff;
				line-height: 30px;
				color: #666;
				font-size: 14px;
			}
			.aqtr-table td input:focus {
				border: 1px solid #39f;
			}
			.aqtr-table tr th.tab-name {
				width: 120px!important;
			}
/* 			.aqtr-table tr th.year-total {
				width: 150px!important;
			} */
			.aqtr-table td {
				text-align: center;
				color: #888;
				height: 30px;
			}
			.aqtr-table td span.all-total {
				text-align: center;
				color: #666;
				font-size: 14px;
				font-weight: bold;
			}
			.aqtr-table tfoot td.total-account {
				height: 40px;
				color: #666666;
				font-weight: bold;
				font-size: 14px;
			}
			.aqtr-table tfoot td span {
				color: #666666;
				font-weight: bold;
			}
			.aqtr-table tfoot td span#allItemTotal {
				color: #666666;
				font-weight: bold;
				font-size: 15px;
			}
		</style>
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
					value="<fmt:formatDate value="${czzAqtrzj.date}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="aqtr-table-list">
			<table class="aqtr-table" border="1" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th class="tab-name">名称</th>
						<th>一月</th>
						<th>二月</th>
						<th>三月</th>
						<th>四月</th>
						<th>五月</th>
						<th>六月</th>
						<th>七月</th>
						<th>八月</th>
						<th>九月</th>
						<th>十月</th>
						<th>十一月</th>
						<th>十二月</th>
						<th class="year-total">年度总计(元)</th>
					</tr>
				</thead>
				<tbody id="czzAqtrzjDt1List">
					<c:forEach var="i" begin="0" end="11">
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
							<input type="number" min="0" class="one item${i}" colum-id="month1" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountJanuray" name="czzAqtrzjDt1List[${i}].amountJanuray" />
						</td>
						<td>
							<input type="number" min="0" class="two item${i}" colum-id="month2" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountFebruary" name="czzAqtrzjDt1List[${i}].amountFebruary"/>
						</td>
						<td>
							<input type="number" min="0" class="three item${i}" colum-id="month3" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountMarch" name="czzAqtrzjDt1List[${i}].amountMarch"/>
						</td>
						<td>
							<input type="number" min="0" class="four item${i}" colum-id="month4" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountApril" name="czzAqtrzjDt1List[${i}].amountApril"/>
						</td>
						<td>
							<input type="number" min="0" class="five item${i}" colum-id="month5" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountMay" name="czzAqtrzjDt1List[${i}].amountMay"/>
						</td>
						<td>
							<input type="number" min="0" class="six item${i}" colum-id="month6" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountJune" name="czzAqtrzjDt1List[${i}].amountJune"/>
						</td>
						<td>
							<input type="number" min="0" class="seven item${i}" colum-id="month7" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountJuly" name="czzAqtrzjDt1List[${i}].amountJuly"/>
						</td>
						<td>
							<input type="number" min="0" class="eight item${i}" colum-id="month8" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountAugust" name="czzAqtrzjDt1List[${i}].amountAugust"/>
						</td>
						<td>
							<input type="number" min="0" class="nine item${i}" colum-id="month9" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountSeptember" name="czzAqtrzjDt1List[${i}].amountSeptember"/>
						</td>
						<td>
							<input type="number" min="0" class="ten item${i}" colum-id="month10" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountOctober" name="czzAqtrzjDt1List[${i}].amountOctober"/>
						</td>
						<td>
							<input type="number" min="0" class="eleven item${i}" colum-id="month11" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountNovember" name="czzAqtrzjDt1List[${i}].amountNovember"/>
						</td>
						<td>
							<input type="number" min="0" class="twelve item${i}" colum-id="month12" row-id="item${i+1}" onkeyup="caculationAmount(this)" id="czzAqtrzjDt1List${i}_amountDecember" name="czzAqtrzjDt1List[${i}].amountDecember"/>
						</td>
						<td>
							<input class="all-total" id="czzAqtrzjDt1List${i}_amountYear" readonly="readonly" name="czzAqtrzjDt1List[${i}].amountYear" value="" maxlength="100" class="input-small "/>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot id="czzAqtrzjDt1List_foot">
					<tr id="czzAqtrzjDt1List12" class="ini">
						<td class="hide">
							<input id="czzAqtrzjDt1List12_id" name="czzAqtrzjDt1List[12].id" type="hidden" value=""/>
							<input id="czzAqtrzjDt1List12_delFlag" name="czzAqtrzjDt1List[12].delFlag" type="hidden" value="0"/>
						</td>
						<td>
							<span id="title12"></span>
							<input id="czzAqtrzjDt1List12_amountTitle" name="czzAqtrzjDt1List[12].amountTitle" type="hidden" value="" maxlength="100" class="total-account"/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountJanuray" readonly="readonly" name="czzAqtrzjDt1List[12].amountJanuray" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountFebruary" readonly="readonly" name="czzAqtrzjDt1List[12].amountFebruary" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountMarch" readonly="readonly" name="czzAqtrzjDt1List[12].amountMarch" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountApril" readonly="readonly" name="czzAqtrzjDt1List[12].amountApril" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountMay" readonly="readonly" name="czzAqtrzjDt1List[12].amountMay" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountJune" readonly="readonly" name="czzAqtrzjDt1List[12].amountJune" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountJuly" readonly="readonly" name="czzAqtrzjDt1List[12].amountJuly" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountAugust" readonly="readonly" name="czzAqtrzjDt1List[12].amountAugust" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountSeptember" readonly="readonly" name="czzAqtrzjDt1List[12].amountSeptember" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountOctober" readonly="readonly" name="czzAqtrzjDt1List[12].amountOctober" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountNovember" readonly="readonly" name="czzAqtrzjDt1List[12].amountNovember" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input class="total-num" id="czzAqtrzjDt1List12_amountDecember" readonly="readonly" name="czzAqtrzjDt1List[12].amountDecember" value="" maxlength="100" class="input-small "/>
						</td>
						<td>
							<input id="czzAqtrzjDt1List12_amountYear" readonly="readonly" name="czzAqtrzjDt1List[12].amountYear" value="" maxlength="100" class="input-small "/>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="aqtrzj:czzAqtrzj:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		$(document).ready(function() {
			var oldData = ${fns:toJson(czzAqtrzj.czzAqtrzjDt1List)};
			
			if (oldData.length == 0) {
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
				$("#title12").html("类目合计");
				for (var i = 0 ;i<= 12;i++) {
					$("#czzAqtrzjDt1List"+i+"_amountTitle").val($("#title"+i).html());
				}
			} else {
				//$(".ini").hide();
			}
			
			var copyData = oldData || [];
			var total = copyData.filter(function(item){
				if (item.amountTitle == '类目合计') {
					return item;
				}
			});
	
			for (var i in oldData) {
				if (oldData[i].amountTitle == '类目合计') {
					oldData.splice(i, 1);
				}
			}
			
			if (oldData.length != 0) {
				for (var i=0; i<oldData.length; i++){
					$("#czzAqtrzjDt1List"+i+"_id").val(oldData[i].id);
					$("#czzAqtrzjDt1List"+i+"_delFlag").val('0');
					$("#title"+i).html(oldData[i].amountTitle);
					$("#czzAqtrzjDt1List"+i+"_amountTitle").val(oldData[i].amountTitle);
					$("#czzAqtrzjDt1List"+i+"_amountJanuray").val(oldData[i].amountJanuray);
					$("#czzAqtrzjDt1List"+i+"_amountFebruary").val(oldData[i].amountFebruary);
					$("#czzAqtrzjDt1List"+i+"_amountMarch").val(oldData[i].amountMarch);
					$("#czzAqtrzjDt1List"+i+"_amountApril").val(oldData[i].amountApril);
					$("#czzAqtrzjDt1List"+i+"_amountMay").val(oldData[i].amountMay);
					$("#czzAqtrzjDt1List"+i+"_amountJune").val(oldData[i].amountJune);
					$("#czzAqtrzjDt1List"+i+"_amountJuly").val(oldData[i].amountJuly);
					$("#czzAqtrzjDt1List"+i+"_amountAugust").val(oldData[i].amountAugust);
					$("#czzAqtrzjDt1List"+i+"_amountSeptember").val(oldData[i].amountSeptember);
					$("#czzAqtrzjDt1List"+i+"_amountOctober").val(oldData[i].amountOctober);
					$("#czzAqtrzjDt1List"+i+"_amountNovember").val(oldData[i].amountNovember);
					$("#czzAqtrzjDt1List"+i+"_amountDecember").val(oldData[i].amountDecember);
					$("#czzAqtrzjDt1List"+i+"_amountYear").val(oldData[i].amountYear);
				}
				$("#czzAqtrzjDt1List12_id").val(total[0].id);
				$("#czzAqtrzjDt1List12_delFlag").val('0');
				$("#title12").html(total[0].amountTitle);
				$("#czzAqtrzjDt1List12_amountTitle").val(total[0].amountTitle);
				$("#czzAqtrzjDt1List12_amountJanuray").val(total[0].amountJanuray);
				$("#czzAqtrzjDt1List12_amountFebruary").val(total[0].amountFebruary);
				$("#czzAqtrzjDt1List12_amountMarch").val(total[0].amountMarch);
				$("#czzAqtrzjDt1List12_amountApril").val(total[0].amountApril);
				$("#czzAqtrzjDt1List12_amountMay").val(total[0].amountMay);
				$("#czzAqtrzjDt1List12_amountJune").val(total[0].amountJune);
				$("#czzAqtrzjDt1List12_amountJuly").val(total[0].amountJuly);
				$("#czzAqtrzjDt1List12_amountAugust").val(total[0].amountAugust);
				$("#czzAqtrzjDt1List12_amountSeptember").val(total[0].amountSeptember);
				$("#czzAqtrzjDt1List12_amountOctober").val(total[0].amountOctober);
				$("#czzAqtrzjDt1List12_amountNovember").val(total[0].amountNovember);
				$("#czzAqtrzjDt1List12_amountDecember").val(total[0].amountDecember);
				$("#czzAqtrzjDt1List12_amountYear").val(total[0].amountYear);
			}
		});
	</script>
	<script type="text/javascript">
		var oneToOne = [
			{columnId: 'czzAqtrzjDt1List12_amountJanuray', rowId: 'czzAqtrzjDt1List0_amountYear', rowCls: '.item0', columCls: '.one'},
			{columnId: 'czzAqtrzjDt1List12_amountFebruary', rowId: 'czzAqtrzjDt1List1_amountYear', rowCls: '.item1', columCls: '.two'},
			{columnId: 'czzAqtrzjDt1List12_amountMarch', rowId: 'czzAqtrzjDt1List2_amountYear', rowCls: '.item2', columCls: '.three'},
			{columnId: 'czzAqtrzjDt1List12_amountApril', rowId: 'czzAqtrzjDt1List3_amountYear', rowCls: '.item3', columCls: '.four'},
			{columnId: 'czzAqtrzjDt1List12_amountMay', rowId: 'czzAqtrzjDt1List4_amountYear', rowCls: '.item4', columCls: '.five'},
			{columnId: 'czzAqtrzjDt1List12_amountJune', rowId: 'czzAqtrzjDt1List5_amountYear', rowCls: '.item5', columCls: '.six'},
			{columnId: 'czzAqtrzjDt1List12_amountJuly', rowId: 'czzAqtrzjDt1List6_amountYear', rowCls: '.item6', columCls: '.seven'},
			{columnId: 'czzAqtrzjDt1List12_amountAugust', rowId: 'czzAqtrzjDt1List7_amountYear', rowCls: '.item7', columCls: '.eight'},
			{columnId: 'czzAqtrzjDt1List12_amountSeptember', rowId: 'czzAqtrzjDt1List8_amountYear', rowCls: '.item8', columCls: '.nine'},
			{columnId: 'czzAqtrzjDt1List12_amountOctober', rowId: 'czzAqtrzjDt1List9_amountYear', rowCls: '.item9', columCls: '.ten'},
			{columnId: 'czzAqtrzjDt1List12_amountNovember', rowId: 'czzAqtrzjDt1List10_amountYear', rowCls: '.item10', columCls: '.eleven'},
			{columnId: 'czzAqtrzjDt1List12_amountDecember', rowId: 'czzAqtrzjDt1List11_amountYear', rowCls: '.item11', columCls: '.twelve'}
		];
			
		function caculationAmount (data) {
			var columAttr = data.getAttribute('colum-id');
			var rowAttr = data.getAttribute('row-id');
			
			// 按月份计算总和
			for (var i = 0, len = oneToOne.length; i < len; i++) {
				if (columAttr === 'month'+ (i + 1)) {
					var columnList = document.querySelectorAll(oneToOne[i].columCls);
					var sum = 0;
					var totalValue = columnList.forEach(function (item) {
						var val = parseFloat(item.value) || 0;
						sum += val;
					});
					document.getElementById(oneToOne[i].columnId).value = sum.toFixed(2);
				}
			}
			
			// 按年度计算各项总和
			for (var j = 0, len = oneToOne.length; j < len; j++) {
				if (rowAttr === 'item' + (j + 1)) {
					var rowList = document.querySelectorAll(oneToOne[j].rowCls);
					var rowSum = 0;
					var totalRow = rowList.forEach(function (item) {
						var rowVal = parseFloat(item.value) || 0;
						rowSum += rowVal;
					});
					document.getElementById(oneToOne[j].rowId).value = rowSum.toFixed(2);
				}
			}
			
			// 计算所有项的总和
			var allItemTotalNodes = document.querySelectorAll('.all-total');
			var allSum = 0;
			allItemTotalNodes.forEach(function (item) {
				var rowItemSum = parseFloat(item.value) || 0;
				allSum += rowItemSum;
			});
			document.getElementById('czzAqtrzjDt1List12_amountYear').value = allSum.toFixed(2);
		}
		</script>
	</body>
</html>