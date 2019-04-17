<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>应急演练管理</title>
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
		<li class="active"><a href="${ctx}/yjyl/czzYjyl/">应急演练</a></li>
		<shiro:hasPermission name="yjyl:czzYjyl:edit"><li><a href="${ctx}/yjyl/czzYjyl/form">应急演练添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzYjyl" action="${ctx}/yjyl/czzYjyl/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>演练类型：</label>
				<form:select path="ylType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yl_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>标题：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>演练类型</th>
				<th>标题</th>
				<th>时间</th>
				<th>地点</th>
				<th>更新时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzYjyl">
			<tr>
				<td><a href="${ctx}/yjyl/czzYjyl/form?id=${czzYjyl.id}">
					${fns:getDictLabel(czzYjyl.ylType, 'yl_type', '')}
				</a></td>
				<td>
					${czzYjyl.name}
				</td>
				<td>
					<fmt:formatDate value="${czzYjyl.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${czzYjyl.location}
				</td>
				<td>
					<fmt:formatDate value="${czzYjyl.updateDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
    				<a href="${ctx}/yjyl/czzYjyl/form?id=${czzYjyl.id}">查看</a>
    				<shiro:hasPermission name="yjyl:czzYjyl:edit">
					<a href="${ctx}/yjyl/czzYjyl/delete?id=${czzYjyl.id}" onclick="return confirmx('确认要删除该应急演练吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>