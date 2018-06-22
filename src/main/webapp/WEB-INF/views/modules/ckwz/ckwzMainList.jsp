<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库物资管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/ckwz/ckwzMain/">仓库物资管理列表</a></li>
		<shiro:hasPermission name="ckwz:ckwzMain:edit"><li><a href="${ctx}/ckwz/ckwzMain/form">仓库物资管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ckwzMain" action="${ctx}/ckwz/ckwzMain/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>品名：</label>
				<form:input path="productname" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>类型：</label>
				<form:input path="type" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginInDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ckwzMain.beginInDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endInDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ckwzMain.endInDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>品名</th>
				<th>类型</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="ckwz:ckwzMain:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ckwzMain">
			<tr>
				<td><a href="${ctx}/ckwz/ckwzMain/form?id=${ckwzMain.id}">
					${ckwzMain.productname}
				</a></td>
				<td>
					${ckwzMain.type}
				</td>
				<td>
					<fmt:formatDate value="${ckwzMain.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${ckwzMain.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${ckwzMain.remarks}
				</td>
				<shiro:hasPermission name="ckwz:ckwzMain:edit"><td>
    				<a href="${ctx}/ckwz/ckwzMain/form?id=${ckwzMain.id}">修改</a>
					<a href="${ctx}/ckwz/ckwzMain/delete?id=${ckwzMain.id}" onclick="return confirmx('确认要删除该仓库物资管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>