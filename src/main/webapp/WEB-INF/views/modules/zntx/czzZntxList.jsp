<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>该条提醒管理</title>
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
		<li class="active"><a href="${ctx}/zntx/czzZntx/">该条提醒</a></li>
		<shiro:hasPermission name="zntx:czzZntx:edit"><li><a href="${ctx}/zntx/czzZntx/form">该条提醒添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzZntx" action="${ctx}/zntx/czzZntx/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>接收人：</label>
				<form:input path="person" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>开始日期：</label>
				<input name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzZntx.startDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>结束日期：</label>
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzZntx.endDate}" pattern="yyyy-MM-dd"/>"
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
				<th>标题</th>
				<th>接收人</th>
				<th>开始日期</th>
				<th>结束日期</th>
				<shiro:hasPermission name="zntx:czzZntx:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzZntx">
			<tr>
				<td><a href="${ctx}/zntx/czzZntx/form?id=${czzZntx.id}">
					${czzZntx.title}
				</a></td>
				<td>
					${czzZntx.person}
				</td>
				<td>
					<fmt:formatDate value="${czzZntx.startDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<fmt:formatDate value="${czzZntx.endDate}" pattern="yyyy-MM-dd"/>
				</td>
				<shiro:hasPermission name="zntx:czzZntx:edit"><td>
    				<a href="${ctx}/zntx/czzZntx/form?id=${czzZntx.id}">查看</a>
					<a href="${ctx}/zntx/czzZntx/delete?id=${czzZntx.id}" onclick="return confirmx('确认要删除该该条提醒吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>