<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全投入资金计划管理</title>
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
		<li class="active"><a href="${ctx}/aqtrzj/czzAqtrzj/">安全投入资金计划</a></li>
		<shiro:hasPermission name="aqtrzj:czzAqtrzj:edit"><li><a href="${ctx}/aqtrzj/czzAqtrzj/form">安全投入资金计划添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqtrzj" action="${ctx}/aqtrzj/czzAqtrzj/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>制定时间：</label>
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzAqtrzj.date}" pattern="yyyy-MM-dd"/>"
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
				<th>制定时间</th>
				<th>更新时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqtrzj">
			<tr>
				<td><a href="${ctx}/aqtrzj/czzAqtrzj/form?id=${czzAqtrzj.id}">
					${czzAqtrzj.title}
				</a></td>
				<td>
					<fmt:formatDate value="${czzAqtrzj.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<fmt:formatDate value="${czzAqtrzj.updateDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
    				<a href="${ctx}/aqtrzj/czzAqtrzj/form?id=${czzAqtrzj.id}">查看</a>
    				<shiro:hasPermission name="aqtrzj:czzAqtrzj:edit">
					<a href="${ctx}/aqtrzj/czzAqtrzj/delete?id=${czzAqtrzj.id}" onclick="return confirmx('确认要删除该安全投入资金计划吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>