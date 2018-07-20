<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考核情况管理</title>
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
		<li class="active"><a href="${ctx}/aqpx/khqk/czzAqpxKhqk/">考核情况列表</a></li>
		<shiro:hasPermission name="aqpx:khqk:czzAqpxKhqk:edit"><li><a href="${ctx}/aqpx/khqk/czzAqpxKhqk/form">考核情况添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqpxKhqk" action="${ctx}/aqpx/khqk/czzAqpxKhqk/" method="post" class="breadcrumb form-search">
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
				<th>时间</th>
				<th>地点</th>
				<shiro:hasPermission name="aqpx:khqk:czzAqpxKhqk:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqpxKhqk">
			<tr>
				<td><a href="${ctx}/aqpx/khqk/czzAqpxKhqk/form?id=${czzAqpxKhqk.id}">
					${czzAqpxKhqk.title}
				</a></td>
				<td>
					<fmt:formatDate value="${czzAqpxKhqk.date}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${czzAqpxKhqk.location}
				</td>
				<shiro:hasPermission name="aqpx:khqk:czzAqpxKhqk:edit"><td>
    				<a href="${ctx}/aqpx/khqk/czzAqpxKhqk/form?id=${czzAqpxKhqk.id}">修改</a>
					<a href="${ctx}/aqpx/khqk/czzAqpxKhqk/delete?id=${czzAqpxKhqk.id}" onclick="return confirmx('确认要删除该考核情况吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>