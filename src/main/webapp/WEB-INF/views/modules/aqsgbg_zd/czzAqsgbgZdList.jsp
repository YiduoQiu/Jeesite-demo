<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全事故报告制度管理</title>
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
		<li class="active"><a href="${ctx}/aqsgbg_zd/czzAqsgbgZd/">安全事故报告制度列表</a></li>
		<shiro:hasPermission name="aqsgbg_zd:czzAqsgbgZd:edit"><li><a href="${ctx}/aqsgbg_zd/czzAqsgbgZd/form">安全事故报告制度添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqsgbgZd" action="${ctx}/aqsgbg_zd/czzAqsgbgZd/" method="post" class="breadcrumb form-search">
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
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqsgbgZd">
			<tr>
				<td><a href="${ctx}/aqsgbg_zd/czzAqsgbgZd/form?id=${czzAqsgbgZd.id}">
					${czzAqsgbgZd.title}
				</a></td>
				<td>
    				<a href="${ctx}/aqsgbg_zd/czzAqsgbgZd/form?id=${czzAqsgbgZd.id}">查看</a>
    				<shiro:hasPermission name="aqsgbg_zd:czzAqsgbgZd:edit">
					<a href="${ctx}/aqsgbg_zd/czzAqsgbgZd/delete?id=${czzAqsgbgZd.id}" onclick="return confirmx('确认要删除该安全事故报告制度吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>