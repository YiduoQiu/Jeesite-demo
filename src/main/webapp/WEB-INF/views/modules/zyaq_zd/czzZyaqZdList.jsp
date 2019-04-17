<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>作业安全制度管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/prefile_common.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			search_event();
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
		<li class="active"><a href="${ctx}/zyaq_zd/czzZyaqZd/">作业安全制度列表</a></li>
		<shiro:hasPermission name="zyaq_zd:czzZyaqZd:edit"><li><a href="${ctx}/zyaq_zd/czzZyaqZd/form">作业安全制度添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzZyaqZd" action="${ctx}/zyaq_zd/czzZyaqZd/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="500" class="input-medium"/>
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
				<shiro:hasPermission name="zyaq_zd:czzZyaqZd:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzZyaqZd">
			<tr>
				<td><a href="${ctx}/zyaq_zd/czzZyaqZd/form?id=${czzZyaqZd.id}">
					${czzZyaqZd.title}
				</a></td>
				<shiro:hasPermission name="zyaq_zd:czzZyaqZd:edit"><td>
    				<a href="${ctx}/zyaq_zd/czzZyaqZd/form?id=${czzZyaqZd.id}">修改</a>
					<a href="${ctx}/zyaq_zd/czzZyaqZd/delete?id=${czzZyaqZd.id}" onclick="return confirmx('确认要删除该作业安全制度吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>