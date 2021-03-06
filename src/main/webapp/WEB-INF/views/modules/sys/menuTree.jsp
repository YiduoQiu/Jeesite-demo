<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><%--
<html>
<head>
	<title>菜单导航</title>
	<meta name="decorator" content="blank"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".accordion-heading a").click(function(){
				$('.accordion-toggle i').removeClass('icon-chevron-down');
				$('.accordion-toggle i').addClass('icon-chevron-right');
				if(!$($(this).attr('href')).hasClass('in')){
					$(this).children('i').removeClass('icon-chevron-right');
					$(this).children('i').addClass('icon-chevron-down');
				}
			});
			$(".accordion-body a").click(function(){
				$("#menu-${param.parentId} li").removeClass("active");
				$("#menu-${param.parentId} li i").removeClass("icon-white");
				$(this).parent().addClass("active");
				$(this).children("i").addClass("icon-white");
				//loading('正在执行，请稍等...');
			});
			//$(".accordion-body a:first i").click();
			//$(".accordion-body li:first li:first a:first i").click();
		});
	</script>
</head>
<body> --%>
	<c:set var="welcomelist" value="${fns:getWelcomePage()}"/>
	<c:set var="welFlag" value="0"/>
	<c:forEach items="${welcomelist}" var="welcome" varStatus="status">
		<c:if test="${status.index eq '0'}">
			<c:set var="welFlag" value="${welcome.mentionFlag}"/>
		</c:if>
	</c:forEach>
	<div class="accordion" id="menu-${param.parentId}"><c:set var="menuList" value="${fns:getMenuList()}"/><c:if test="${menu.isSingle eq '1'}"><c:set var="firstMenu" value="true"/></c:if><c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
	<c:if test="${menu.parent.id eq (not empty param.parentId ? param.parentId:1)&&menu.isShow eq '1'}">
		<c:set var="Continue" value="0"/>
		<c:if test="${menu.name eq '欢迎使用' && welFlag eq '1'}">
			<c:set var="Continue" value="1"/>
		</c:if>
		<c:if test="${menu.isSingle eq '0' && Continue eq '0'}">
			<div class="accordion-group">
			    <div class="accordion-heading">
			    	<a class="accordion-toggle" data-toggle="collapse" data-parent="#menu-${param.parentId}" data-href="#collapse-${menu.id}" href="#collapse-${menu.id}" title="${menu.remarks}"><i class="icon-chevron-${not empty firstMenu && firstMenu ? 'down' : 'right'}"></i>&nbsp;${menu.name}</a>
			    </div>
			    <div id="collapse-${menu.id}" class="accordion-body collapse ${not empty firstMenu && firstMenu ? 'in' : ''}">
					<div class="accordion-inner">
						<ul class="nav nav-list"><c:forEach items="${menuList}" var="menu2"><c:if test="${menu2.parent.id eq menu.id&&menu2.isShow eq '1'}">
							<li><a data-href=".menu3-${menu2.id}" href="${fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}" target="${not empty menu2.target ? menu2.target : 'mainFrame'}" ><i class="icon-${not empty menu2.icon ? menu2.icon : 'circle-arrow-right'}"></i>&nbsp;${menu2.name}</a>
								<ul class="nav nav-list hide" style="margin:0;padding-right:0;"><c:forEach items="${menuList}" var="menu3"><c:if test="${menu3.parent.id eq menu2.id&&menu3.isShow eq '1'}">
									<li class="menu3-${menu2.id} hide"><a href="${fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '/404'}" target="${not empty menu3.target ? menu3.target : 'mainFrame'}" ><i class="icon-${not empty menu3.icon ? menu3.icon : 'circle-arrow-right'}"></i>&nbsp;${menu3.name}</a></li></c:if>
								</c:forEach></ul></li><c:set var="firstMenu" value="false"/></c:if></c:forEach></ul>
					</div>
			    </div>
			</div>
		</c:if>
		<c:if test="${menu.isSingle eq '1' && Continue eq '0'}">
			<div class="accordion-group">
			    <div class="accordion-heading">
			    	<c:if test="${menu.name ne '法律法规查询'}">
			    		<a class="accordion-toggle" href="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${not empty menu.href ? menu.href : '/404'}" target="${not empty menu.target ? menu.target : 'mainFrame'}" title="${menu.remarks}"><i class="icon-chevron-${not empty firstMenu && firstMenu ? 'down' : 'right'}"></i>&nbsp;${menu.name}</a>
			    	</c:if>
			    	<c:if test="${menu.name eq '法律法规查询'}">
			    		<a class="accordion-toggle" href="${pageContext.request.contextPath}${fns:getFrontPath()}/index-${fnc:getCurrentSiteId()}.html" target="mainFrame" title="${menu.remarks}"><i class="icon-chevron-${not empty firstMenu && firstMenu ? 'down' : 'right'}"></i>&nbsp;${menu.name}</a>
			    	</c:if>
			    </div>
			</div>
		</c:if>
	</c:if>
	</c:forEach></div><%--
</body>
</html> --%>