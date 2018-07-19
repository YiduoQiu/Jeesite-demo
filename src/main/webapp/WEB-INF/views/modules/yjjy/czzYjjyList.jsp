<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>应急救援管理</title>
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
		<li class="active"><a href="${ctx}/yjjy/czzYjjy/">应急救援列表</a></li>
		<shiro:hasPermission name="yjjy:czzYjjy:edit"><li><a href="${ctx}/yjjy/czzYjjy/form">应急救援添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzYjjy" action="${ctx}/yjjy/czzYjjy/" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="yjjy:czzYjjy:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzYjjy">
			<tr>
				<td><a href="${ctx}/yjjy/czzYjjy/form?id=${czzYjjy.id}">
					${czzYjjy.title}
				</a></td>
				<shiro:hasPermission name="yjjy:czzYjjy:edit"><td>
    				<a href="${ctx}/yjjy/czzYjjy/form?id=${czzYjjy.id}">修改</a>
					<a href="${ctx}/yjjy/czzYjjy/delete?id=${czzYjjy.id}" onclick="return confirmx('确认要删除该应急救援吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>