<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全检查管理</title>
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
		<li class="active"><a href="${ctx}/aqjc/czzAqjc/">安全检查列表</a></li>
		<shiro:hasPermission name="aqjc:czzAqjc:edit"><li><a href="${ctx}/aqjc/czzAqjc/form">安全检查添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqjc" action="${ctx}/aqjc/czzAqjc/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>整改状态：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>检查类型：</label>
				<form:select path="checkType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('checktype_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>标题：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>时间：</label>
				<input name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzAqjc.beginDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzAqjc.endDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
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
				<th>检查类型</th>
				<th>标题</th>
				<th>时间</th>
				<th>地点</th>
				<th>范围</th>
				<th>负责人</th>
				<th>参加人员</th>
				<th>整改状态</th>
				<shiro:hasPermission name="aqjc:czzAqjc:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqjc">
			<tr>
				<td><a href="${ctx}/aqjc/czzAqjc/form?id=${czzAqjc.id}">
					${fns:getDictLabel(czzAqjc.checkType, 'checktype_flag', '')}
				</a></td>
				<td>
					${czzAqjc.name}
				</td>
				<td>
					<fmt:formatDate value="${czzAqjc.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${czzAqjc.location}
				</td>
				<td>
					${czzAqjc.extent}
				</td>
				<td>
					${czzAqjc.responsible}
				</td>
				<td>
					${czzAqjc.participate}
				</td>
				<td>
					${fns:getDictLabel(czzAqjc.type, 'type_flag', '')}
				</td>
				<shiro:hasPermission name="aqjc:czzAqjc:edit"><td>
    				<a href="${ctx}/aqjc/czzAqjc/form?id=${czzAqjc.id}">修改</a>
					<a href="${ctx}/aqjc/czzAqjc/delete?id=${czzAqjc.id}" onclick="return confirmx('确认要删除该安全检查吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>