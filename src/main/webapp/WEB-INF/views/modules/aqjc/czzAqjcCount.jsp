<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="decorator" content="default"/>
		<script src="${ctxStatic}/echarts/jquery-3.1.1.min.js" type="text/javascript"></script>
		<script src="${ctxStatic}/echarts/echarts.common.min.js" type="text/javascript"></script>
		<style type="text/css">
			html, body {
				padding: 0;
				margin: 0;
			}
			.statistics-container {
				padding: 20px;
				width: 100%;
				height: auto;
				box-sizing: border-box;
				display: flex;
				justify-content: flex-start;
				flex-wrap: wrap;
			}
			.module1 {
				width: 100%;
				height: 400px;
				margin: 10px 8px;
				border-radius: 5px;
				box-shadow: 0 0 8px 3px #eee;
			}
			.module2 {
				width: 100%;
				height: 400px;
				margin: 10px 8px;
				border-radius: 5px;
				box-shadow: 0 0 8px 3px #eee;
			}
			.module3 {
				width: 32%;
				height: 400px;
				margin: 10px 8px;
				border-radius: 5px;
				box-shadow: 0 0 8px 3px #eee;
			}
			.module4 {
				width: 64%;
				height: 400px;
				margin: 10px 8px;
				border-radius: 5px;
				box-shadow: 0 0 8px 3px #eee;
			}
			.module1 > div {
				width: 100%;
				height: 100%;
			}
			.module2 > div {
				width: 100%;
				height: 100%;
			}
			.module3 > div {
				width: 100%;
				height: 100%;
			}
			.module4 > div {
				width: 100%;
				height: 100%;
			}
		</style>
	</head>
	<body>
		<form:form id="searchForm" modelAttribute="czzSjcx" action="${ctx}/sjcx/czzSjcx/countdata" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
			<li><label>查询时间：</label>
				<input name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzAqjc.beginDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzAqjc.endDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
		</form:form>
		<div class="statistics-container">
			<div class="module2">
				<div id="module2"></div>
			</div>
			<div class="module1">
				<div id="module1"></div>
			</div>
			<div class="module3">
				<div id="module3"></div>
			</div>
			<div class="module4">
				<div id="module4"></div>
			</div>
			<div class="module1">
				<div id="module5"></div>
			</div>
		</div>
		
		<script>
//			$(funtion(){
			function getOption_double (result) {
				var option = {
				    color: result.barColor,
				    title : {
				        text: result.title,
				        textStyle: {
				        		color: '#686868',
				        		fontSize: 15,
				        },
				        left: '35',
				        top: '10'
				    },
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				    		right: '15',
				    		top: '35',
				    		align: 'right',
				    		textStyle: {
				    			color: '#888'
				    		},
				        data:result.item
				    },
				    grid: {
				    	top: '20%',
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data : result.label,
				            axisLine: {
				            		lineStyle: {
				            			color: '#777'
				            		}
				            },
					        axisLabel: {
	                            interval:0, //设置成 0 强制显示所有标签。
	                            formatter:function(value){  
                                    var ret = "";//拼接加\n返回的类目项  
                                    var maxLength = 11;//每项显示文字个数  
                                    var valLength = value.length;//X轴类目项的文字个数  
                                    var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数  
                                    if (rowN > 1){//如果类目项的文字大于3,  
                                        for (var i = 0; i < rowN; i++) {  
                                            var temp = "";//每次截取的字符串  
                                            var start = i * maxLength;//开始截取的位置  
                                            var end = start + maxLength;//结束截取的位置  
                                            //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧  
                                            temp = value.substring(start, end) + "\n";  
                                            ret += temp; //凭借最终的字符串  
                                        }  
                                        return ret;  
                                    }  
                                    else {  
                                        return value;  
                                    }  
                                }
	                         }
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            minInterval:1,
				            axisLine: {
				            		lineStyle: {
				            			color: '#777'
				            		}
				            }
				        }
				    ],
				    series : [
				    	{
				            name: result.item[0],
				            type:'bar',
				            barWidth: '25%',
				            data: result.total
				        },
				        {
				            name: result.item[1],
				            type:'bar',
				            barWidth: '25%',
				            data: result.rectify
				        },
				        {
				            name:result.item[2],
				            type:'bar',
				            barWidth: '25%',
				            data: result.notRectify
				        },
				    ]
				};
				return option;
			}
			
			function getOption_single (result) {
				var option = {
						title : {
					        text: result.title,
					        textStyle: {
					        		color: '#686868',
					        		fontSize: 15,
					        },
					        left: '35',
					        top: '10'
					    },
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
					    },
					    legend: {
				    		right: '15',
				    		top: '35',
				    		align: 'right',
				    		textStyle: {
				    			color: '#888'
				    		},
				    		data:['个数']
				    	},
				    	grid: {
					    	top: '20%',
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
					    },
			            xAxis: [
			            	{
			                	data: result.label,
			                	axisLabel: {
		                            interval:0, //设置成 0 强制显示所有标签。
		                            formatter:function(value){  
	                                    var ret = "";//拼接加\n返回的类目项  
	                                    var maxLength = 11;//每项显示文字个数  
	                                    var valLength = value.length;//X轴类目项的文字个数  
	                                    var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数  
	                                    if (rowN > 1){//如果类目项的文字大于3,  
	                                        for (var i = 0; i < rowN; i++) {  
	                                            var temp = "";//每次截取的字符串  
	                                            var start = i * maxLength;//开始截取的位置  
	                                            var end = start + maxLength;//结束截取的位置  
	                                            //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧  
	                                            temp = value.substring(start, end) + "\n";  
	                                            ret += temp; //凭借最终的字符串  
	                                        }  
	                                        return ret;  
	                                    }  
	                                    else {  
	                                        return value;  
	                                    }  
	                                }
		                         }
			            	}
			            ],
			            yAxis: [{
			            	type : 'value',
			            	minInterval:1
			            	}],
			            series: [{
			                name: '个数',
			                type: 'bar',
			                data: result.data
			            }]
			        };
				return option;
			}
			
			/**
			 * 重组数据为：
			 * result: {
			 * 		rectify: [已整改, 已整改],
			 * 		notRectify: [未整改, 未整改]
			 * }
			 */
 			function reSetData (data) {
				var returnObj = {};
				var rectify = [];
				var notRectify = [];
				if (data && data.length > 0) {
					rectify[0] = data[0];
					if (data[2]) {
						rectify[1] = data[2];
					}
					notRectify[0] = data[1];
					if (data[3]) {
						notRectify[1] = data[3];
					}
					returnObj.rectify = rectify;
					returnObj.notRectify = notRectify;
				} else {
					returnObj.rectify = [0, 0];
					returnObj.notRectify = [0, 0];
				}
				return returnObj;
			}
			 
			 /**
				 * 重组数据为：
				 * result: {
				 * 		rectify: [已整改, 已整改],
				 * 		notRectify: [未整改, 未整改]
				* 		total: [合计, 合计]
				 * }
				 */
	 			function reSetData1 (data) {
					var returnObj = {};
					var rectify = [];
					var notRectify = [];
					for(var i = 0; i<data.length; i++){
						if(i%2 != 0){
							rectify.push(data[i]);
						}else{
							notRectify.push(data[i]);
						}
					}
					returnObj.rectify = rectify;
					returnObj.notRectify = notRectify;
					return returnObj;
				}
				 
				 function reSetData2 (data) {
						var returnObj = {};
						var total = [];
						var rectify = [];
						var notRectify = [];
						for(var i = 0; i<data.length; i++){
							if(i == 0 || i == 3 || i == 6 || i == 9 || i == 12){
								total.push(data[i]);
							}else if(i == 1 || i == 4 || i == 7 || i == 10 || i == 13){
								rectify.push(data[i]);
							}else{
								notRectify.push(data[i]);
							}
						}
						returnObj.rectify = rectify;
						returnObj.notRectify = notRectify;
						returnObj.total = total;
						return returnObj;
					}
				 
			function module_aqjc () {
				var moduleChart = echarts.init(document.getElementById('module1'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
//				var data = [12, 39, 55, 20]; 
				var data = getData();
				data = data.slice(0,1);
				data = data[0];
				var returnObj = reSetData2(data);
				returnObj.title = '安全检查管理统计表';
				returnObj.label = ['专项检查', '全面检查', '定期安全生产检查', '经常性安全生产检查', '季节性、节假日安全检查'];
				returnObj.item = ['合计','未整改', '已整改'];
				returnObj.barColor = ['#5ab1ef','#2ec7c9', '#b6a2de'];
				var option = getOption_double(returnObj);
				moduleChart.setOption(option);
			}
			
			function module_aqkh () {
				var moduleChart = echarts.init(document.getElementById('module2'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
				//var data = [29, 9, 18, 10]; 
				var data = getData();
				data = data.slice(1,2);
				data = data[0];
				var returnObj = [];
				returnObj.data = data;
				returnObj.title = '安全考核统计表';
				returnObj.label = ['合计', '日常考核', '月度考核', '隐患排查治理考核', '重大危险源管理考核', '工作任务落实考核', '培训教育考核', '应急演练考核'];
				//returnObj.barColor = ['#5ab1ef', '#ffb980'];
				var option = getOption_single(returnObj);
				moduleChart.setOption(option);
			}
			
			function module_aqsg () {
				var moduleChart = echarts.init(document.getElementById('module3'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
				//var data = [129, 40, 188, 75]; 
				var data = getData();
				data = data.slice(2,3);
				data = data[0];
				var returnObj = [];
				returnObj.data = data;
				returnObj.title = '安全事故统计表';
				returnObj.label = ['合计', '未上报', '已上报'];
				//returnObj.item = ['整改状态1', '整改状态2'];
				returnObj.barColor = ['#d87a80', '#8d98b3'];
				var option = getOption_single(returnObj);
				moduleChart.setOption(option);
			}
			
			function module_yhpc () {
				var moduleChart = echarts.init(document.getElementById('module4'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
				//var data = [129, 40, 188, 75]; 
				//var returnObj = reSetData(data);
				var data = getData();
				data = data.slice(3,4);
				data = data[0];
				var returnObj = reSetData2(data);
				returnObj.title = '隐患排查统计表';
				returnObj.label = ['一般事故安全隐患', '重大事故安全隐患'];
				returnObj.item = ['合计', '未整改', '已整改'];
				returnObj.barColor = ['#5ab1ef', '#f5994e', '#97b552'];
				var option = getOption_double(returnObj);
				moduleChart.setOption(option);
			}
			
			function module_zyaq () {
				var moduleChart = echarts.init(document.getElementById('module5'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
				//var data = [29, 9, 18, 10]; 
				var data = getData();
				data = data.slice(4,5);
				data = data[0];
				var returnObj = [];
				returnObj.data = data;
				returnObj.title = '作业安全统计表';
				returnObj.label = ['合计', '动火作业', '高温作业', '高压作业', '带电作业', '密闭空间', '高空作业'];
				//returnObj.barColor = ['#5ab1ef', '#ffb980'];
				var option = getOption_single(returnObj);
				moduleChart.setOption(option);
			}
			
			function getData(){
				var request = ${requestScope.count};
				return request;
			}
			
			module_aqjc();
			module_aqkh();
			module_aqsg();
			module_yhpc();
			module_zyaq();
		</script>
		
	</body>
</html>