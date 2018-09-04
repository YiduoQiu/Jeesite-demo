<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>隐患排查管理</title>
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
		<li class="active"><a href="${ctx}/yhpc/czzYhpc/">隐患排查列表</a></li>
		<shiro:hasPermission name="yhpc:czzYhpc:edit"><li><a href="${ctx}/yhpc/czzYhpc/form">隐患排查添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzYhpc" action="${ctx}/yhpc/czzYhpc/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>隐患名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>检查时间：</label>
				<input name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzYhpc.beginDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzYhpc.endDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>地点：</label>
				<form:input path="location" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>责任人：</label>
				<form:input path="responsible" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>隐患名称</th>
				<th>检查时间</th>
				<th>地点</th>
				<th>责任人</th>
				<shiro:hasPermission name="yhpc:czzYhpc:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzYhpc">
			<tr>
				<td><a href="${ctx}/yhpc/czzYhpc/form?id=${czzYhpc.id}">
					${czzYhpc.name}
				</a></td>
				<td>
					<fmt:formatDate value="${czzYhpc.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${czzYhpc.location}
				</td>
				<td>
					${czzYhpc.responsible}
				</td>
				<shiro:hasPermission name="yhpc:czzYhpc:edit"><td>
    				<a href="${ctx}/yhpc/czzYhpc/form?id=${czzYhpc.id}">修改</a>
					<a href="${ctx}/yhpc/czzYhpc/delete?id=${czzYhpc.id}" onclick="return confirmx('确认要删除该隐患排查吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>