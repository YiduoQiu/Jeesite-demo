<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>作业安全管理</title>
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
		<li class="active"><a href="${ctx}/zyaq/czzZyaq/">作业安全列表</a></li>
		<shiro:hasPermission name="zyaq:czzZyaq:edit"><li><a href="${ctx}/zyaq/czzZyaq/form">作业安全添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzZyaq" action="${ctx}/zyaq/czzZyaq/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>作业名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>时间：</label>
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzZyaq.date}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>地点：</label>
				<form:input path="location" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>作业名称</th>
				<th>时间</th>
				<th>地点</th>
				<th>作业人员</th>
				<th>监护人员</th>
				<shiro:hasPermission name="zyaq:czzZyaq:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzZyaq">
			<tr>
				<td><a href="${ctx}/zyaq/czzZyaq/form?id=${czzZyaq.id}">
					${czzZyaq.name}
				</a></td>
				<td>
					<fmt:formatDate value="${czzZyaq.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${czzZyaq.location}
				</td>
				<td>
					${czzZyaq.zyPerson}
				</td>
				<td>
					${czzZyaq.jhPerson}
				</td>
				<shiro:hasPermission name="zyaq:czzZyaq:edit"><td>
    				<a href="${ctx}/zyaq/czzZyaq/form?id=${czzZyaq.id}">修改</a>
					<a href="${ctx}/zyaq/czzZyaq/delete?id=${czzZyaq.id}" onclick="return confirmx('确认要删除该作业安全吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>