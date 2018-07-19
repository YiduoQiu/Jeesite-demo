<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全考核管理</title>
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
		<li class="active"><a href="${ctx}/aqkh/aqpxPxjh/">安全考核列表</a></li>
		<shiro:hasPermission name="aqkh:aqpxPxjh:edit"><li><a href="${ctx}/aqkh/aqpxPxjh/form">安全考核添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="aqpxPxjh" action="${ctx}/aqkh/aqpxPxjh/" method="post" class="breadcrumb form-search">
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
				<th>创建者</th>
				<th>创建时间</th>
				<shiro:hasPermission name="aqkh:aqpxPxjh:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="aqpxPxjh">
			<tr>
				<td><a href="${ctx}/aqkh/aqpxPxjh/form?id=${aqpxPxjh.id}">
					${aqpxPxjh.title}
				</a></td>
				<td>
					${aqpxPxjh.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${aqpxPxjh.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="aqkh:aqpxPxjh:edit"><td>
    				<a href="${ctx}/aqkh/aqpxPxjh/form?id=${aqpxPxjh.id}">修改</a>
					<a href="${ctx}/aqkh/aqpxPxjh/delete?id=${aqpxPxjh.id}" onclick="return confirmx('确认要删除该安全考核吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>