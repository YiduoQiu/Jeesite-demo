<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
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
				height:30px;
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
			$('#view input').attr('readonly',true);
		});
	</script>
</head>
	<div class="control-group" id="title_view">
				<label class="control-label">标题：</label>
				<div style="padding-top: 3px;">${czzAqtrzj.title}</div>
			</div>
			<div class="control-group" id="time_view">
				<label class="control-label">制定时间：</label>
				<div style="padding-top: 3px;"><fmt:formatDate value="${czzAqtrzj.date}" dateStyle="long" /></div>
			</div>
	<div class="aqtr-table-list">
		<table class="aqtr-table" border="1" cellspacing="0" cellpadding="0">
		<span id="title13_v" style="display: block;text-align: center;font-size:20px;padding-bottom: 10px;"></span>
			<thead>
				<tr>
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
			<thead id="czzAqtrzjDt1List_foot">
				<tr id="list13" class="ini">
					<td>
						<div class="total-num" id="list13_amountJanuray"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountFebruary"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountMarch"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountApril"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountMay"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountJune"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountJuly"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountAugust"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountSeptember"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountOctober"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountNovember"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountDecember"></div>
					</td>
					<td>
						<div class="total-num" id="list13_amountYear"></div>
					</td>
				</tr>
			</thead>
		</table>
	</div>
	
	<div class="aqtr-table-list">
		<table class="aqtr-table" border="1" cellspacing="0" cellpadding="0">
		<span style="display: block;text-align: center;font-size:20px;padding-bottom: 10px;">安全投入支出明细</span>
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
				<tr id="list${i}" class="ini">
					<td>
						<span id="title_v${i}"></span>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountJanuray" class="one item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountFebruary" class="two item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountMarch" class="three item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountApril" class="four item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountMay" class="five item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountJune" class="six item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountJuly" class="seven item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountAugust" class="eight item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountSeptember" class="nine item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountOctober" class="ten item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountNovember" class="eleven item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountDecember" class="twelve item${i}"></div>
					</td>
					<td>
						<div class="total-num" id="list${i}_amountYear" class="all-total"></div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot id="czzAqtrzjDt1List_foot">
				<tr id="list12" class="ini">
					<td>
						<span id="title_v12"></span>
					</td>
					<td>
						<div class="total-num" id="list12_amountJanuray" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountFebruary" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountMarch" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountApril" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountMay" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountJune" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountJuly" class="total-num"></div>
					</td>
					<td>	
						<div class="total-num" id="list12_amountAugust" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountSeptember" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountOctober" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountNovember" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountDecember" class="total-num"></div>
					</td>
					<td>
						<div class="total-num" id="list12_amountYear"></div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var oldData = ${fns:toJson(czzAqtrzj.czzAqtrzjDt1List)};

			//把类目合计单独拿出
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
			
			//把个人防护使用情况单独拿出
			var copyData2 = oldData || [];
			var total2 = copyData2.filter(function(item){
				if (item.amountTitle == '安全生产费用提取额') {
					return item;
				}
			});

			for (var i in oldData) {
				if (oldData[i].amountTitle == '安全生产费用提取额') {
					oldData.splice(i, 1);
				}
			}

			if (oldData.length != 0) {
				for (var i=0; i<oldData.length; i++){
					$("#title_v"+i).html(oldData[i].amountTitle);
					if(oldData[i].amountJanuray != ""){
						$("#list"+i+"_amountJanuray").html(parseFloat(oldData[i].amountJanuray).toFixed(2));
					}
					if(oldData[i].amountFebruary != ""){
						$("#list"+i+"_amountFebruary").html(parseFloat(oldData[i].amountFebruary).toFixed(2));
					}
					if(oldData[i].amountMarch != ""){
						$("#list"+i+"_amountMarch").html(parseFloat(oldData[i].amountMarch).toFixed(2));
					}
					if(oldData[i].amountApril != ""){
						$("#list"+i+"_amountApril").html(parseFloat(oldData[i].amountApril).toFixed(2));
					}
					if(oldData[i].amountMay != ""){
						$("#list"+i+"_amountMay").html(parseFloat(oldData[i].amountMay).toFixed(2));
					}
					if(oldData[i].amountJune != ""){
						$("#list"+i+"_amountJune").html(parseFloat(oldData[i].amountJune).toFixed(2));
					}
					if(oldData[i].amountJuly != ""){
						$("#list"+i+"_amountJuly").html(parseFloat(oldData[i].amountJuly).toFixed(2));
					}
					if(oldData[i].amountAugust != ""){
						$("#list"+i+"_amountAugust").html(parseFloat(oldData[i].amountAugust).toFixed(2));
					}
					if(oldData[i].amountSeptember != ""){
						$("#list"+i+"_amountSeptember").html(parseFloat(oldData[i].amountSeptember).toFixed(2));
					}
					if(oldData[i].amountOctober != ""){
						$("#list"+i+"_amountOctober").html(parseFloat(oldData[i].amountOctober).toFixed(2));
					}
					if(oldData[i].amountNovember != ""){
						$("#list"+i+"_amountNovember").html(parseFloat(oldData[i].amountNovember).toFixed(2));
					}
					if(oldData[i].amountDecember != ""){
						$("#list"+i+"_amountDecember").html(parseFloat(oldData[i].amountDecember).toFixed(2));
					}
					$("#list"+i+"_amountYear").html(oldData[i].amountYear);
				}
				$("#title_v12").html(total[0].amountTitle);
				$("#list12_amountJanuray").html(total[0].amountJanuray);
				$("#list12_amountFebruary").html(total[0].amountFebruary);
				$("#list12_amountMarch").html(total[0].amountMarch);
				$("#list12_amountApril").html(total[0].amountApril);
				$("#list12_amountMay").html(total[0].amountMay);
				$("#list12_amountJune").html(total[0].amountJune);
				$("#list12_amountJuly").html(total[0].amountJuly);
				$("#list12_amountAugust").html(total[0].amountAugust);
				$("#list12_amountSeptember").html(total[0].amountSeptember);
				$("#list12_amountOctober").html(total[0].amountOctober);
				$("#list12_amountNovember").html(total[0].amountNovember);
				$("#list12_amountDecember").html(total[0].amountDecember);
				$("#list12_amountYear").html(total[0].amountYear);
				
				$("#title13_v").html(total2[0].amountTitle);
				if(total2[0].amountJanuray != ""){
					$("#list13_amountJanuray").html(parseFloat(total2[0].amountJanuray).toFixed(2));
				}
				if(total2[0].amountFebruary != ""){
					$("#list13_amountFebruary").html(parseFloat(total2[0].amountFebruary).toFixed(2));
				}
				if(total2[0].amountMarch != ""){
					$("#list13_amountMarch").html(parseFloat(total2[0].amountMarch).toFixed(2));
				}
				if(total2[0].amountApril != ""){
					$("#list13_amountApril").html(parseFloat(total2[0].amountApril).toFixed(2));
				}
				if(total2[0].amountMay != ""){
					$("#list13_amountMay").html(parseFloat(total2[0].amountMay).toFixed(2));
				}
				if(total2[0].amountJune != ""){
					$("#list13_amountJune").html(parseFloat(total2[0].amountJune).toFixed(2));
				}
				if(total2[0].amountJuly != ""){
					$("#list13_amountJuly").html(parseFloat(total2[0].amountJuly).toFixed(2));
				}
				if(total2[0].amountAugust != ""){
					$("#list13_amountAugust").html(parseFloat(total2[0].amountAugust).toFixed(2));
				}
				if(total2[0].amountSeptember != ""){
					$("#list13_amountSeptember").html(parseFloat(total2[0].amountSeptember).toFixed(2));
				}
				if(total2[0].amountOctober != ""){
					$("#list13_amountOctober").html(parseFloat(total2[0].amountOctober).toFixed(2));
				}
				if(total2[0].amountNovember != ""){
					$("#list13_amountNovember").html(parseFloat(total2[0].amountNovember).toFixed(2));
				}
				if(total2[0].amountDecember != ""){
					$("#list13_amountDecember").html(parseFloat(total2[0].amountDecember).toFixed(2));
				}
				$("#list13_amountYear").html(total2[0].amountYear);
				
			}
		});
	</script>