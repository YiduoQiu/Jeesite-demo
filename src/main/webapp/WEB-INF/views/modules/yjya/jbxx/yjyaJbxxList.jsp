<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>应急预案_基本信息表管理</title>
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
		<li class="active"><a href="${ctx}/yjya/jbxx/yjyaJbxx/">应急预案_基本信息表列表</a></li>
		<shiro:hasPermission name="yjya:jbxx:yjyaJbxx:edit"><li><a href="${ctx}/yjya/jbxx/yjyaJbxx/form">应急预案_基本信息表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="yjyaJbxx" action="${ctx}/yjya/jbxx/yjyaJbxx/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>指挥机构：</label>
				<form:input path="comorganization" htmlEscape="false" maxlength="3000" class="input-medium"/>
			</li>
			<li><label>姓名：</label>
				<sys:treeselect id="username" name="username" value="${yjyaJbxx.username}" labelName="" labelValue="${yjyaJbxx.username}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>指挥机构</th>
				<th>姓名</th>
				<th>职责</th>
				<th>电话</th>
				<shiro:hasPermission name="yjya:jbxx:yjyaJbxx:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="yjyaJbxx">
			<tr>
				<td><a href="${ctx}/yjya/jbxx/yjyaJbxx/form?id=${yjyaJbxx.id}">
					${yjyaJbxx.comorganization}
				</a></td>
				<td>
					${yjyaJbxx.username}
				</td>
				<td>
					${yjyaJbxx.response}
				</td>
				<td>
					${yjyaJbxx.telephone}
				</td>
				<shiro:hasPermission name="yjya:jbxx:yjyaJbxx:edit"><td>
    				<a href="${ctx}/yjya/jbxx/yjyaJbxx/form?id=${yjyaJbxx.id}">修改</a>
					<a href="${ctx}/yjya/jbxx/yjyaJbxx/delete?id=${yjyaJbxx.id}" onclick="return confirmx('确认要删除该应急预案_基本信息表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>