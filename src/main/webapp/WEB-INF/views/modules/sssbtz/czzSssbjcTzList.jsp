<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>设施设备台账管理</title>
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
		<li class="active"><a href="${ctx}/sssbtz/czzSssbjcTz/">设施设备台账</a></li>
		<shiro:hasPermission name="sssbtz:czzSssbjcTz:edit"><li><a href="${ctx}/sssbtz/czzSssbjcTz/form">设施设备台账添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzSssbjcTz" action="${ctx}/sssbtz/czzSssbjcTz/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>设备名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label style="width: 100px;">上次检查时间：</label>
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzSssbjcTz.date}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>设备名称</th>
				<th>上次检查时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzSssbjcTz">
			<tr>
				<td><a href="${ctx}/sssbtz/czzSssbjcTz/form?id=${czzSssbjcTz.id}">
					${czzSssbjcTz.name}
				</a></td>
				<td>
					<fmt:formatDate value="${czzSssbjcTz.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
    				<a href="${ctx}/sssbtz/czzSssbjcTz/form?id=${czzSssbjcTz.id}">查看</a>
    				<shiro:hasPermission name="sssbtz:czzSssbjcTz:edit">
					<a href="${ctx}/sssbtz/czzSssbjcTz/delete?id=${czzSssbjcTz.id}" onclick="return confirmx('确认要删除该设施设备台账吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>