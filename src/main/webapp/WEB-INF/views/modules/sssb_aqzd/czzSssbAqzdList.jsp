<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>设备管理制度</title>
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
		<li class="active"><a href="${ctx}/sssb_aqzd/czzSssbAqzd/">设备管理制度列表</a></li>
		<shiro:hasPermission name="sssb_aqzd:czzSssbAqzd:edit"><li><a href="${ctx}/sssb_aqzd/czzSssbAqzd/form">设备管理制度添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzSssbAqzd" action="${ctx}/sssb_aqzd/czzSssbAqzd/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="500" class="input-medium"/>
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
				<th>更新时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzSssbAqzd">
			<tr>
				<td><a href="${ctx}/sssb_aqzd/czzSssbAqzd/form?id=${czzSssbAqzd.id}">
					${czzSssbAqzd.title}
				</a></td>
				<td>
					<fmt:formatDate value="${czzSssbAqzd.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
    				<a href="${ctx}/sssb_aqzd/czzSssbAqzd/form?id=${czzSssbAqzd.id}">查看</a>
    				<shiro:hasPermission name="sssb_aqzd:czzSssbAqzd:edit">
					<a href="${ctx}/sssb_aqzd/czzSssbAqzd/delete?id=${czzSssbAqzd.id}" onclick="return confirmx('确认要删除该设备管理制度吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>