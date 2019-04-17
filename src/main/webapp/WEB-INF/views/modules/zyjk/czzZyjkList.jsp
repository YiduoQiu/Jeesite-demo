<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>职业健康管理</title>
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
		<li class="active"><a href="${ctx}/zyjk/czzZyjk/">职业健康</a></li>
		<shiro:hasPermission name="zyjk:czzZyjk:edit"><li><a href="${ctx}/zyjk/czzZyjk/form">职业健康添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzZyjk" action="${ctx}/zyjk/czzZyjk/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>危害类别：</label>
				<form:input path="type" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>人员：</label>
				<form:input path="person" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>有无职业病：</label>
				<form:radiobuttons path="diseaseFlag" items="${fns:getDictList('disease_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>职业危害类别</th>
				<th>人员</th>
				<th>有无职业病</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzZyjk">
			<tr>
				<td><a href="${ctx}/zyjk/czzZyjk/form?id=${czzZyjk.id}">
					${czzZyjk.type}
				</a></td>
				<td>
					${czzZyjk.person}
				</td>
				<td>
					${fns:getDictLabel(czzZyjk.diseaseFlag, 'disease_flag', '')}
				</td>
				<td>
    				<a href="${ctx}/zyjk/czzZyjk/form?id=${czzZyjk.id}">查看</a>
    				<shiro:hasPermission name="zyjk:czzZyjk:edit">
					<a href="${ctx}/zyjk/czzZyjk/delete?id=${czzZyjk.id}" onclick="return confirmx('确认要删除该职业健康吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>