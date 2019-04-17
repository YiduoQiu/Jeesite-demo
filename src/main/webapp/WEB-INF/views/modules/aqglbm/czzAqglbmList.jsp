<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全管理部门管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/prefile_common.js" type="text/javascript"></script>
	<style type="text/css">
		#function{
		   overflow: hidden;
		   text-overflow: ellipsis;
		   white-space: nowrap;
		   width:20em;
		   height:30px;
		}
	</style>
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
		<li class="active"><a href="${ctx}/aqglbm/czzAqglbm/">安全管理部门</a></li>
		<shiro:hasPermission name="aqglbm:czzAqglbm:edit"><li><a href="${ctx}/aqglbm/czzAqglbm/form">安全管理部门添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqglbm" action="${ctx}/aqglbm/czzAqglbm/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>机构名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>机构名称</th>
				<th>职能职责</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqglbm">
			<tr>
				<td><a href="${ctx}/aqglbm/czzAqglbm/form?id=${czzAqglbm.id}">
					${czzAqglbm.name}
				</a></td>
				<td>
					<div id="function">${czzAqglbm.function}</div>
				</td>
				<td>
    				<a href="${ctx}/aqglbm/czzAqglbm/form?id=${czzAqglbm.id}">查看</a>
    				<shiro:hasPermission name="aqglbm:czzAqglbm:edit">
					<a href="${ctx}/aqglbm/czzAqglbm/delete?id=${czzAqglbm.id}" onclick="return confirmx('确认要删除该安全管理部门吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>