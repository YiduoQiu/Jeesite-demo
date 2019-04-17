<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安委会成员管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/prefile_common.js" type="text/javascript"></script>
	<style>
		.line-zz{height:20px;display:block;/*内联对象需加*/width:100%;overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/}
		.line{height:20px;}
		#post_l{
		   overflow: hidden;
		   text-overflow: ellipsis;
		   white-space: nowrap;
		   width:20em;
		   height:78px;
		   margin-left: 30px;
		}
	</style>
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
		<li class="active"><a href="${ctx}/awh_x/czzAwhX/">安委会成员列表</a></li>
		<shiro:hasPermission name="awh_x:czzAwhX:edit"><li><a href="${ctx}/awh_x/czzAwhX/form">安委会成员添加</a></li></shiro:hasPermission>
		<!-- <li style="float:right;"><button id="show_search" onclick="show_search()">搜索</button><button id="hide_search" onclick="hide_search()">隐藏</button></li>
		<li style="float:right;"><a id="show_search" href="javascript:show_search();">搜索</a><a id="hide_search" href="javascript:hide_search();">隐藏</a></li>-->
	</ul>
	<div>
	<form:form id="searchForm" modelAttribute="czzAwhX" action="${ctx}/awh_x/czzAwhX/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>职务：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('zw_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<c:forEach items="${page.list}" var="czzAwhX">
				<c:if test="${fns:getDictLabel(czzAwhX.type, 'zw_flag', '') eq '主任'}">
					<tr>
						<td style="padding-left: 15px;">
							<div style="font-size:16px;"><a href="${ctx}/awh_x/czzAwhX/form?id=${czzAwhX.id}">${fns:getDictLabel(czzAwhX.type, 'zw_flag', '')}</a>：&nbsp&nbsp${czzAwhX.name}</div>
							联系电话：${czzAwhX.phone}
							<br/>职责：
							<br/><div id="post_l">${czzAwhX.post}</div>
						</td>
						<td>
								<div><span>操作</span> </div>
								<div>
				    				<a href="${ctx}/awh_x/czzAwhX/form?id=${czzAwhX.id}">查看</a>
				    				<shiro:hasPermission name="awh_x:czzAwhX:edit">
									<a href="${ctx}/awh_x/czzAwhX/delete?id=${czzAwhX.id}" onclick="return confirmx('确认要删除该安委会成员吗？', this.href)">删除</a>
									</shiro:hasPermission>
								</div>
						</td>
					</tr>
				</c:if>
			</c:forEach>

			<c:forEach items="${page.list}" var="czzAwhX">
				<c:if test="${fns:getDictLabel(czzAwhX.type, 'zw_flag', '') eq '副主任'}">
					<tr>
						<td style="padding-left: 15px;">
							<div style="font-size:16px;"><a href="${ctx}/awh_x/czzAwhX/form?id=${czzAwhX.id}">${fns:getDictLabel(czzAwhX.type, 'zw_flag', '')}</a>：&nbsp&nbsp${czzAwhX.name}</div>
							联系电话：${czzAwhX.phone}
							<br/>职责：
							<br/><div id="post_l">${czzAwhX.post}</div>
						</td>
						<td>
								<div><span>操作</span> </div>
								<div>
				    				<a href="${ctx}/awh_x/czzAwhX/form?id=${czzAwhX.id}">查看</a>
				    				<shiro:hasPermission name="awh_x:czzAwhX:edit">
									<a href="${ctx}/awh_x/czzAwhX/delete?id=${czzAwhX.id}" onclick="return confirmx('确认要删除该安委会成员吗？', this.href)">删除</a>
									</shiro:hasPermission>
								</div>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			
			<c:forEach items="${page.list}" var="czzAwhX">
				<c:if test="${fns:getDictLabel(czzAwhX.type, 'zw_flag', '') eq '成员'}">
					<tr>
						<td style="padding-left: 15px;">
							<div style="font-size:16px;"><a href="${ctx}/awh_x/czzAwhX/form?id=${czzAwhX.id}">${fns:getDictLabel(czzAwhX.type, 'zw_flag', '')}</a>：&nbsp&nbsp${czzAwhX.name}</div>
							联系电话：${czzAwhX.phone}
							<br/>职责：
							<br/><div id="post_l">${czzAwhX.post}</div>
						</td>
						<td>
								<div><span>操作</span> </div>
								<div>
				    				<a href="${ctx}/awh_x/czzAwhX/form?id=${czzAwhX.id}">查看</a>
				    				<shiro:hasPermission name="awh_x:czzAwhX:edit">
									<a href="${ctx}/awh_x/czzAwhX/delete?id=${czzAwhX.id}" onclick="return confirmx('确认要删除该安委会成员吗？', this.href)">删除</a>
									</shiro:hasPermission>
								</div>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	</div>
</body>
</html>