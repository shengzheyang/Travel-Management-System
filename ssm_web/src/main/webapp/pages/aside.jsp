<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>
					<security:authentication property="principal.username" />
				</p>
				<a href="#"><i class="fa fa-circle text-success"></i> online</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">Menu</li>
			<li id="admin-index"><a
				href="${pageContext.request.contextPath}/pages/main.jsp"><i
					class="fa fa-dashboard"></i> <span>Home</span></a></li>
			<security:authorize access="hasRole('ROLE_ADMIN')">
			<li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
					<span>System management</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>


			</a>
				<ul class="treeview-menu">

					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/user/findAll"> <i
							class="fa fa-circle-o"></i> User management
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/role/findAll"> <i
							class="fa fa-circle-o"></i> Role management
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/permission/findAll">
							<i class="fa fa-circle-o"></i> Permission management
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/pages/syslog-list.jsp"> <i
							class="fa fa-circle-o"></i> Log
					</a></li>
				</ul></li>
			</security:authorize>
			<li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
					<span>Basic data</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/product/findAll">
							<i class="fa fa-circle-o"></i> Product management
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/order/findAll">
							<i class="fa fa-circle-o"></i> Order management
					</a></li>

				</ul></li>

		</ul>
	</section>
	<!-- /.sidebar -->
</aside>