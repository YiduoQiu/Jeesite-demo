<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>重大危险源管理管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/prefile_common.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#wxylx").hide();
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
		<li class="active"><a href="${ctx}/wxygl_sbfx/czzWxysbfx/">重大危险源台账</a></li>
		<shiro:hasPermission name="wxygl_sbfx:czzWxysbfx:edit"><li><a href="${ctx}/wxygl_sbfx/czzWxysbfx/form">重大危险源添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzWxysbfx" action="${ctx}/wxygl_sbfx/czzWxysbfx/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>危险源种类：</label>
				<form:select path="wxyKind" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_wxy')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>危险源种类</th>
				<th>危险源单元名称</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzWxysbfx">
			<tr>
				<td>
					<a href="${ctx}/wxygl_sbfx/czzWxysbfx/form?id=${czzWxysbfx.id}">
					${fns:getDictLabel(czzWxysbfx.wxyKind, 'type_wxy', '')}</a>
				</td>
				<td>
					${czzWxysbfx.wxyName}
				</td>
					<td>
    				<a href="${ctx}/wxygl_sbfx/czzWxysbfx/form?id=${czzWxysbfx.id}">查看</a>
    				<shiro:hasPermission name="wxygl_sbfx:czzWxysbfx:edit">
					<a href="${ctx}/wxygl_sbfx/czzWxysbfx/delete?id=${czzWxysbfx.id}" onclick="return confirmx('确认要删除该重大危险源管理吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>