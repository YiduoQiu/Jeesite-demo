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
		<li class="active"><a href="${ctx}/aqkh/czzAqkh/">安全考核列表</a></li>
		<shiro:hasPermission name="aqkh:czzAqkh:edit"><li><a href="${ctx}/aqkh/czzAqkh/form">安全考核添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqkh" action="${ctx}/aqkh/czzAqkh/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>考核类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_kh')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
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
				<th>考核类型</th>
				<th>标题</th>
				<shiro:hasPermission name="aqkh:czzAqkh:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqkh">
			<tr>
				<td><a href="${ctx}/aqkh/czzAqkh/form?id=${czzAqkh.id}">
					${fns:getDictLabel(czzAqkh.type, 'type_kh', '')}
				</a></td>
				<td>
					${czzAqkh.title}
				</td>
				<shiro:hasPermission name="aqkh:czzAqkh:edit"><td>
    				<a href="${ctx}/aqkh/czzAqkh/form?id=${czzAqkh.id}">修改</a>
					<a href="${ctx}/aqkh/czzAqkh/delete?id=${czzAqkh.id}" onclick="return confirmx('确认要删除该安全考核吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>