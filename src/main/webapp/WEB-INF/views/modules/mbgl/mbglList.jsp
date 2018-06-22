<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>目标管理管理</title>
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
		<li class="active"><a href="${ctx}/mbgl/mbgl/">目标管理列表</a></li>
		<shiro:hasPermission name="mbgl:mbgl:edit"><li><a href="${ctx}/mbgl/mbgl/form">目标管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="mbgl" action="${ctx}/mbgl/mbgl/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>姓名：</label>
				<form:input path="username" htmlEscape="false" maxlength="64" class="input-medium"/>
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
				<th>姓名</th>
				<th>岗位</th>
				<th>电话</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="mbgl:mbgl:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="mbgl">
			<tr>
				<td><a href="${ctx}/mbgl/mbgl/form?id=${mbgl.id}">
					${mbgl.title}
				</a></td>
				<td>
					${mbgl.username}
				</td>
				<td>
					${mbgl.response}
				</td>
				<td>
					${mbgl.telephone}
				</td>
				<td>
					<fmt:formatDate value="${mbgl.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${mbgl.remarks}
				</td>
				<shiro:hasPermission name="mbgl:mbgl:edit"><td>
    				<a href="${ctx}/mbgl/mbgl/form?id=${mbgl.id}">修改</a>
					<a href="${ctx}/mbgl/mbgl/delete?id=${mbgl.id}" onclick="return confirmx('确认要删除该目标管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>