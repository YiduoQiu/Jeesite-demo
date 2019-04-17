<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>职业病危害因素分类目录查询管理</title>
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
		<li class="active"><a href="${ctx}/zybwh_cx/czzZybflCx/">职业病危害因素分类目录</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="czzZybflCx" action="${ctx}/zybwh_cx/czzZybflCx/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>排序：</label>
				<form:input path="sortId" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label style="width:100px">危害因素大类：</label>
				<form:input path="type" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label style="width:150px">职业病危害因素名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>排序</th>
				<th>危害因素大类</th>
				<th>职业病危害因素名称</th>
				<th>CAS号</th>
				<th>备注信息</th>
				<shiro:hasPermission name="zybwh_cx:czzZybflCx:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="czzZybflCx">
			<tr>
				<td><a href="${ctx}/zybwh_cx/czzZybflCx/form?id=${czzZybflCx.id}">
					${czzZybflCx.sortId}
				</a></td>
				<td>
					${czzZybflCx.type}
				</td>
				<td>
					${czzZybflCx.name}
				</td>
				<td>
					${czzZybflCx.cas}
				</td>
				<td>
					${czzZybflCx.remarks}
				</td>
				<shiro:hasPermission name="zybwh_cx:czzZybflCx:edit"><td>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>