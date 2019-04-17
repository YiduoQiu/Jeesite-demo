<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>DROP TABLE IF EXISTS czz_aqsgbg;管理</title>
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
		<li class="active"><a href="${ctx}/aqsgbg/czzAqsgbg/">安全事故列表</a></li>
		<shiro:hasPermission name="aqsgbg:czzAqsgbg:edit"><li><a href="${ctx}/aqsgbg/czzAqsgbg/form">安全事故添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="czzAqsgbg" action="${ctx}/aqsgbg/czzAqsgbg/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>事故名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>上报状态：</label>
				<form:select path="sgType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sb_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>上报时间：</label>
				<input name="sbTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${czzAqsgbg.sbTime}" pattern="yyyy-MM-dd"/>"
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
				<th>事故名称</th>
				<th>上报状态</th>
				<th>上报时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzAqsgbg">
			<tr>
				<td><a href="${ctx}/aqsgbg/czzAqsgbg/form?id=${czzAqsgbg.id}">
					${czzAqsgbg.name}
				</a></td>
				<td>
					${fns:getDictLabel(czzAqsgbg.type, 'sb_flag', '')}
				</td>
				<td>
					<fmt:formatDate value="${czzAqsgbg.sbTime}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td>
    				<a href="${ctx}/aqsgbg/czzAqsgbg/form?id=${czzAqsgbg.id}">查看</a>
    				<shiro:hasPermission name="aqsgbg:czzAqsgbg:edit">
					<a href="${ctx}/aqsgbg/czzAqsgbg/delete?id=${czzAqsgbg.id}" onclick="return confirmx('确认要删除该DROP TABLE IF EXISTS czz_aqsgbg;吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>