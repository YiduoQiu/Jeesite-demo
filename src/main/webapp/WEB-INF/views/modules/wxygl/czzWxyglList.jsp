<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>一般危险源管理</title>
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
		<li class="active"><a href="${ctx}/wxygl/czzWxygl/">一般危险源台账</a></li>
		<shiro:hasPermission name="wxygl:czzWxygl:edit"><li><a href="${ctx}/wxygl/czzWxygl/form">一般危险源添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzWxygl" action="${ctx}/wxygl/czzWxygl/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>危险源名称：</label>
				<form:input path="wxyName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>危险源类型：</label>
				<form:select path="wxyKind" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_wxy')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>位置：</label>
				<form:input path="location" htmlEscape="false" maxlength="300" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>危险源名称</th>
				<th>危险源类型</th>
				<th>位置</th>
				<th>管理人员</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzWxygl">
			<tr>
				<td><a href="${ctx}/wxygl/czzWxygl/form?id=${czzWxygl.id}">
					${czzWxygl.wxyName}
				</a></td>
				<td>
					${fns:getDictLabel(czzWxygl.wxyKind, 'type_wxy', '')}
				</td>
				<td>
					${czzWxygl.location}
				</td>
				<td>
					${czzWxygl.person}
				</td>
				<td>
    				<a href="${ctx}/wxygl/czzWxygl/form?id=${czzWxygl.id}">查看</a>
    				<shiro:hasPermission name="wxygl:czzWxygl:edit">
					<a href="${ctx}/wxygl/czzWxygl/delete?id=${czzWxygl.id}" onclick="return confirmx('确认要删除该危险源管理吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>