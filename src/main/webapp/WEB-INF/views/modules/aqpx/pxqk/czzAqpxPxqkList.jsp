<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>培训情况管理</title>
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
		<li class="active"><a href="${ctx}/aqpx/pxqk/czzAqpxPxqk/">培训情况</a></li>
		<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit"><li><a href="${ctx}/aqpx/pxqk/czzAqpxPxqk/form">培训情况添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqpxPxqk" action="${ctx}/aqpx/pxqk/czzAqpxPxqk/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>时间：</label>
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzAqpxPxqk.date}" pattern="yyyy-MM-dd"/>"
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
				<th>时间</th>
				<th>地点</th>
				<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqpxPxqk">
			<tr>
				<td><a href="${ctx}/aqpx/pxqk/czzAqpxPxqk/form?id=${czzAqpxPxqk.id}">
					${czzAqpxPxqk.title}
				</a></td>
				<td>
					<fmt:formatDate value="${czzAqpxPxqk.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${czzAqpxPxqk.location}
				</td>
				<td>
    				<a href="${ctx}/aqpx/pxqk/czzAqpxPxqk/form?id=${czzAqpxPxqk.id}">查看</a>
    				<shiro:hasPermission name="aqpx:pxqk:czzAqpxPxqk:edit">
					<a href="${ctx}/aqpx/pxqk/czzAqpxPxqk/delete?id=${czzAqpxPxqk.id}" onclick="return confirmx('确认要删除该培训情况吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>