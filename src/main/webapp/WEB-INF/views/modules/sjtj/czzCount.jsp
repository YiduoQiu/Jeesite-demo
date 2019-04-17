<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
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
				width: 32%;
				height: 400px;
				margin: 10px 8px;
				border-radius: 5px;
				box-shadow: 0 0 8px 3px #eee;
			}
			.module1 > div {
				width: 100%;
				height: 100%;
			}
		</style>
	</head>
	<body>
		<div class="statistics-container">
			<div class="module1">
				<div id="module1"></div>
			</div>
			<div class="module1">
				<div id="module2"></div>
			</div>
			<div class="module1">
				<div id="module3"></div>
			</div>
			<div class="module1">
				<div id="module4"></div>
			</div>
		</div>
		
		<script>
//			$(funtion(){
			function getOption (result) {
				var option = {
				    color: [result.barColor[0], result.barColor[1]],
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
				        data:[result.item[0], result.item[1]]
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
				            data : [result.label[0], result.label[1]],
				            axisLine: {
				            		lineStyle: {
				            			color: '#777'
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
				            data: result.rectify
				        },
				        {
				            name:result.item[1],
				            type:'bar',
				            barWidth: '25%',
				            data: result.notRectify
				        },
				    ]
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
				
			function module1 () {
				var moduleChart = echarts.init(document.getElementById('module1'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
//				var data = [12, 39, 55, 20]; 
				var data = getData();
				var returnObj = reSetData(data);
				returnObj.title = '安全检查管理统计表';
				returnObj.label = ['专项检查', '全面检查'];
				returnObj.item = ['已整改', '未整改'];
				returnObj.barColor = ['#2ec7c9', '#b6a2de'];
				var option = getOption(returnObj);
				moduleChart.setOption(option);
			}
			
			function module2 () {
				var moduleChart = echarts.init(document.getElementById('module2'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
				var data = [29, 9, 18, 10]; 
				var returnObj = reSetData(data);
				returnObj.title = '隐患排查统计表';
				returnObj.label = ['一般事故安全隐患', '重大事故安全隐患'];
				returnObj.item = ['已整改', '未整改'];
				returnObj.barColor = ['#5ab1ef', '#ffb980'];
				var option = getOption(returnObj);
				moduleChart.setOption(option);
			}
			
			function module3 () {
				var moduleChart = echarts.init(document.getElementById('module3'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
				var data = [129, 40, 188, 75]; 
				var returnObj = reSetData(data);
				returnObj.title = '统计表名称';
				returnObj.label = ['检查类型1', '检查类型2'];
				returnObj.item = ['整改状态1', '整改状态2'];
				returnObj.barColor = ['#d87a80', '#8d98b3'];
				var option = getOption(returnObj);
				moduleChart.setOption(option);
			}
			
			function module4 () {
				var moduleChart = echarts.init(document.getElementById('module4'));
				// 模拟接口返回数据 [已整改，未整改，已整改，未整改]
				var data = [129, 40, 188, 75]; 
				var returnObj = reSetData(data);
				returnObj.title = '统计表名称';
				returnObj.label = ['检查类型1', '检查类型2'];
				returnObj.item = ['整改状态1', '整改状态2'];
				returnObj.barColor = ['#f5994e', '#97b552'];
				var option = getOption(returnObj);
				moduleChart.setOption(option);
			}
			
			function getData(){
				var request = ${requestScope.count};
				return request;
			}
			
			module1();
			module2();
			module3();
			module4();
		</script>
		
	</body>
</html>