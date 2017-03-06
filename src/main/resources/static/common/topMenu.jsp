<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Top Menu Items start -->
<ul class="nav navbar-right top-nav">
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<i class="fa fa-user"></i> <%=(String)request.getSession().getAttribute("userName") %> 
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu">
			<li><a href="#"  data-toggle="modal" data-target="#myModal"><i class="fa fa-fw fa-user"></i> 个人资料</a>
			</li>
			<li><a href="#"><i class="fa fa-fw fa-envelope"></i> 收件箱</a></li>
			<li><a href="#"><i class="fa fa-fw fa-gear"></i> 设置</a>
			</li>
			<li class="divider"></li>
			
		</ul>
	</li>
	<li>
		<a href="<%=request.getContextPath()%>/action/logoutAction.do"><i class="fa fa-sign-out"></i> 退出</a>
	</li>
	<li><div class="nav-string">|</div></li>
	<li><a href="<%=request.getContextPath()%>/introDoc.jsp"><i class="fa fa-info-circle"></i> 用户手册</a></li>
	<li><a href="<%=request.getContextPath()%>/contactUs.jsp"><i class="fa fa-comment-o"></i> 联系我们</a></li>
	
</ul>

<!-- Top Menu Items end -->