<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>应急演练管理</title>
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
		<li class="active"><a href="${ctx}/yjyl/czzYjyl/">应急演练列表</a></li>
		<shiro:hasPermission name="yjyl:czzYjyl:edit"><li><a href="${ctx}/yjyl/czzYjyl/form">应急演练添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzYjyl" action="${ctx}/yjyl/czzYjyl/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>时间：</label>
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzYjyl.date}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>地点：</label>
				<form:input path="location" htmlEscape="false" maxlength="255" class="input-medium"/>
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
				<th>事故经过</th>
				<shiro:hasPermission name="yjyl:czzYjyl:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzYjyl">
			<tr>
				<td><a href="${ctx}/yjyl/czzYjyl/form?id=${czzYjyl.id}">
					${czzYjyl.name}
				</a></td>
				<td>
					<fmt:formatDate value="${czzYjyl.date}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${czzYjyl.location}
				</td>
				<td>
					${czzYjyl.accident}
				</td>
				<shiro:hasPermission name="yjyl:czzYjyl:edit"><td>
    				<a href="${ctx}/yjyl/czzYjyl/form?id=${czzYjyl.id}">修改</a>
					<a href="${ctx}/yjyl/czzYjyl/delete?id=${czzYjyl.id}" onclick="return confirmx('确认要删除该应急演练吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>