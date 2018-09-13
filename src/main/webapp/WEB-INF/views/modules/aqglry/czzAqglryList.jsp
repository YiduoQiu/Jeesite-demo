<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全管理人员管理</title>
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
		<li class="active"><a href="${ctx}/aqglry/czzAqglry/">安全管理人员</a></li>
		<shiro:hasPermission name="aqglry:czzAqglry:edit"><li><a href="${ctx}/aqglry/czzAqglry/form">安全管理人员添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqglry" action="${ctx}/aqglry/czzAqglry/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>职务：</label>
				<form:input path="function" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>姓名：</label>
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
				<th>职务</th>
				<th>姓名</th>
				<th>电话</th>
				<th>职能职责</th>
				<shiro:hasPermission name="aqglry:czzAqglry:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqglry">
			<tr>
				<td><a href="${ctx}/aqglry/czzAqglry/form?id=${czzAqglry.id}">
					${czzAqglry.function}
				</a></td>
				<td>
					${czzAqglry.name}
				</td>
				<td>
					${czzAqglry.phone}
				</td>
				<td>
					${czzAqglry.responsible}
				</td>
				<shiro:hasPermission name="aqglry:czzAqglry:edit"><td>
    				<a href="${ctx}/aqglry/czzAqglry/form?id=${czzAqglry.id}">修改</a>
					<a href="${ctx}/aqglry/czzAqglry/delete?id=${czzAqglry.id}" onclick="return confirmx('确认要删除该安全管理人员吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>