<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全生产操作规程管理</title>
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
		<li class="active"><a href="${ctx}/aqsc_czgc/czzAqglCzgc/">安全生产操作规程</a></li>
		<shiro:hasPermission name="aqsc_czgc:czzAqglCzgc:edit"><li><a href="${ctx}/aqsc_czgc/czzAqglCzgc/form">安全生产操作规程添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqglCzgc" action="${ctx}/aqsc_czgc/czzAqglCzgc/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<shiro:hasPermission name="aqsc_czgc:czzAqglCzgc:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqglCzgc">
			<tr>
				<td><a href="${ctx}/aqsc_czgc/czzAqglCzgc/form?id=${czzAqglCzgc.id}">
					${czzAqglCzgc.title}
				</a></td>
				<shiro:hasPermission name="aqsc_czgc:czzAqglCzgc:edit"><td>
    				<a href="${ctx}/aqsc_czgc/czzAqglCzgc/form?id=${czzAqglCzgc.id}">修改</a>
					<a href="${ctx}/aqsc_czgc/czzAqglCzgc/delete?id=${czzAqglCzgc.id}" onclick="return confirmx('确认要删除该安全生产操作规程吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>