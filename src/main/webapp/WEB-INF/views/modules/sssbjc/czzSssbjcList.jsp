<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>设施设备安全检查管理</title>
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
		<li class="active"><a href="${ctx}/sssbjc/czzSssbjc/">设施设备安全检查列表</a></li>
		<shiro:hasPermission name="sssbjc:czzSssbjc:edit"><li><a href="${ctx}/sssbjc/czzSssbjc/form">设施设备安全检查添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzSssbjc" action="${ctx}/sssbjc/czzSssbjc/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>设备名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>时间：</label>
				<input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzSssbjc.date}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>地点：</label>
				<form:input path="location" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>设施设备安全状态（0：优，1：良，2：差）：</label>
				<form:select path="aqType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('aq_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>设备名称</th>
				<th>时间</th>
				<th>地点</th>
				<th>设施设备安全状态（0：优，1：良，2：差）</th>
				<shiro:hasPermission name="sssbjc:czzSssbjc:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzSssbjc">
			<tr>
				<td><a href="${ctx}/sssbjc/czzSssbjc/form?id=${czzSssbjc.id}">
					${czzSssbjc.name}
				</a></td>
				<td>
					<fmt:formatDate value="${czzSssbjc.date}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${czzSssbjc.location}
				</td>
				<td>
					${fns:getDictLabel(czzSssbjc.aqType, 'aq_type', '')}
				</td>
				<shiro:hasPermission name="sssbjc:czzSssbjc:edit"><td>
    				<a href="${ctx}/sssbjc/czzSssbjc/form?id=${czzSssbjc.id}">修改</a>
					<a href="${ctx}/sssbjc/czzSssbjc/delete?id=${czzSssbjc.id}" onclick="return confirmx('确认要删除该设施设备安全检查吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>