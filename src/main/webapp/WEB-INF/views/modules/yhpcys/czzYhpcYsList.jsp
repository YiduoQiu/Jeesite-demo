<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>隐患排查验收管理</title>
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
		<li class="active"><a href="${ctx}/yhpcys/czzYhpcYs/">隐患排查验收列表</a></li>
		<shiro:hasPermission name="yhpcys:czzYhpcYs:edit"><li><a href="${ctx}/yhpcys/czzYhpcYs/form">隐患排查验收添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzYhpcYs" action="${ctx}/yhpcys/czzYhpcYs/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>隐患名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>检查时间：</label>
				<input name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzYhpcYs.beginDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzYhpcYs.endDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>地点：</label>
				<form:input path="location" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>责任人：</label>
				<form:input path="responsible" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>确认人：</label>
				<form:input path="confirm" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>确认时间：</label>
				<input name="beginConfirmdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzYhpcYs.beginConfirmdate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endConfirmdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzYhpcYs.endConfirmdate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>整改状态：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>隐患名称</th>
				<th>检查时间</th>
				<th>地点</th>
				<th>责任人</th>
				<th>确认人</th>
				<th>确认时间</th>
				<th>整改状态</th>
				<shiro:hasPermission name="yhpcys:czzYhpcYs:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzYhpcYs">
			<tr>
				<td><a href="${ctx}/yhpcys/czzYhpcYs/form?id=${czzYhpcYs.id}">
					${czzYhpcYs.name}
				</a></td>
				<td>
					<fmt:formatDate value="${czzYhpcYs.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${czzYhpcYs.location}
				</td>
				<td>
					${czzYhpcYs.responsible}
				</td>
				<td>
					${czzYhpcYs.confirm}
				</td>
				<td>
					<fmt:formatDate value="${czzYhpcYs.confirmdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(czzYhpcYs.type, 'type_flag', '')}
				</td>
				<shiro:hasPermission name="yhpcys:czzYhpcYs:edit"><td>
    				<a href="${ctx}/yhpcys/czzYhpcYs/form?id=${czzYhpcYs.id}">修改</a>
					<a href="${ctx}/yhpcys/czzYhpcYs/delete?id=${czzYhpcYs.id}" onclick="return confirmx('确认要删除该隐患排查验收吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>