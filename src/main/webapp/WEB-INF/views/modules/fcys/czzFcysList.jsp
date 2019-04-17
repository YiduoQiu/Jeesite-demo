<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>复查验收管理</title>
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
		<li class="active"><a href="${ctx}/fcys/czzFcys/">复查验收</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="czzFcys" action="${ctx}/fcys/czzFcys/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>检查类型：</label>
				<form:select path="checkType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('checktype_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>标题：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>整改状态：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>排查时间：</label>
				<input name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzFcys.beginDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzFcys.endDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>复查时间：</label>
				<input name="beginConfirmdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzFcys.beginConfirmdate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endConfirmdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzFcys.endConfirmdate}" pattern="yyyy-MM-dd"/>"
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
				<th>检查类型</th>
				<th>标题</th>
				<th>排查时间</th>
				<th>地点</th>
				<th>范围</th>
				<th>负责人</th>
				<th>整改状态</th>
				<th>确认人</th>
				<th>复查时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzFcys">
			<tr>
				<td><a href="${ctx}/fcys/czzFcys/form?id=${czzFcys.id}">
					${fns:getDictLabel(czzFcys.checkType, 'checktype_flag', '')}
				</a></td>
				<td>
					${czzFcys.name}
				</td>
				<td>
					<fmt:formatDate value="${czzFcys.date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${czzFcys.location}
				</td>
				<td>
					${czzFcys.extent}
				</td>
				<td>
					${czzFcys.responsible}
				</td>
				<td>
					${fns:getDictLabel(czzFcys.type, 'type_flag', '')}
				</td>
				<td>
					${czzFcys.confirm}
				</td>
				<td>
					<fmt:formatDate value="${czzFcys.confirmdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
    				<a href="${ctx}/fcys/czzFcys/form?id=${czzFcys.id}">查看</a>
    				<shiro:hasPermission name="fcys:czzFcys:edit">
					<a href="${ctx}/fcys/czzFcys/delete?id=${czzFcys.id}" onclick="return confirmx('确认要删除该复查验收吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>