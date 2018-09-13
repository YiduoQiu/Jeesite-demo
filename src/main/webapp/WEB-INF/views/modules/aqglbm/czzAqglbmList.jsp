<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全管理部门管理</title>
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
		<li class="active"><a href="${ctx}/aqglbm/czzAqglbm/">安全管理部门</a></li>
		<shiro:hasPermission name="aqglbm:czzAqglbm:edit"><li><a href="${ctx}/aqglbm/czzAqglbm/form">安全管理部门添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqglbm" action="${ctx}/aqglbm/czzAqglbm/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>机构名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>机构名称</th>
				<th>职能职责</th>
				<shiro:hasPermission name="aqglbm:czzAqglbm:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqglbm">
			<tr>
				<td><a href="${ctx}/aqglbm/czzAqglbm/form?id=${czzAqglbm.id}">
					${czzAqglbm.name}
				</a></td>
				<td>
					${czzAqglbm.function}
				</td>
				<shiro:hasPermission name="aqglbm:czzAqglbm:edit"><td>
    				<a href="${ctx}/aqglbm/czzAqglbm/form?id=${czzAqglbm.id}">修改</a>
					<a href="${ctx}/aqglbm/czzAqglbm/delete?id=${czzAqglbm.id}" onclick="return confirmx('确认要删除该安全管理部门吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>