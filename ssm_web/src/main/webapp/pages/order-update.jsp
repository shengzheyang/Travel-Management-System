<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Sheng's</title>
<meta name="description" content="Sheng's">
<meta name="keywords" content="Sheng's">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<link rel=“stylesheet”
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">


		<jsp:include page="header.jsp"></jsp:include>

		<jsp:include page="aside.jsp"></jsp:include>

		<div class="content-wrapper">

			<section class="content-header">
			<h1>
				Order management <small>All orders</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="${pageContext.request.contextPath}/order/findAll.do">Order management</a></li>
				<li class="active">Edit orders</li>
			</ol>
			</section>

			<section class="content">
			<form action="${pageContext.request.contextPath}/order/update.do"
				method="post">
				<input type="hidden" name="id" value="${orders.id }">
				<input type="hidden" name="product.id" value="${orders.product.id}">
				<div class="panel panel-default">
					<div class="panel-heading">Order info</div>
					<div class="row data-type">

						<div class="col-md-2 title">Order number</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="Order number"
								value="${orders.orderNum }" name="orderNum" readonly="readonly">
						</div>

						<div class="col-md-2 title">Order time</div>
						<div class="col-md-4 data">
							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right"
									id="datepicker-a3" name="orderTime" value="${orders.orderTimeStr}">
							</div>
						</div>
						<div class="col-md-2 title">Route name</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="Route name"
								value="${orders.product.productName }" name="product.productName">
						</div>

						<div class="col-md-2 title">Departure city</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="Departure city"
								value="${orders.product.cityName }" name="product.cityName">
						</div>

						<div class="col-md-2 title">Departure time</div>
						<div class="col-md-4 data">
							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right"
									id="datepicker-a6" value="${orders.product.departureTimeStr }" name="product.departureTime">
							</div>
						</div>
						<div class="col-md-2 title">Number of people</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="Number of people"
								value="${orders.peopleCount}" name="peopleCount">
						</div>

						<div class="col-md-2 title rowHeight2x">Other info</div>
						<div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3" placeholder="Other info" name="orderDesc">
							${orders.orderDesc }
						</textarea>
						</div>

					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">Tourist info</div>

					<table id="dataList"
						class="table table-bordered table-striped table-hover dataTable">
						<thead>
							<tr>
								<th class="">Group</th>
								<th class="">Name</th>
								<th class="">Sex</th>
								<th class="">Phone</th>
								<th class="">ID type</th>
								<th class="">ID number</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="traveller" items="${orders.travellers}" varStatus="vs">
								<input type="hidden" name="travellers[${vs.index }].id" value="${traveller.id}">
								<tr>
									<td>
										<input type="text" value="${traveller.travellerTypeStr}" name="travellers[${vs.index }].travelllerType">
									</td>
									<td>
										<input type="text" size="10" value="${traveller.name }" name="travellers[${vs.index}].name">
									</td>
									<td>
										<input type="text" size="10" value="${traveller.sex }" name="travellers[${vs.index}].sex">
									</td>
									<td>
										<input type="text" size="20" value="${traveller.phoneNum }" name="travellers[${vs.index}].phoneNum">
									</td>
									<td>
										<input type="text" size="15" value="${traveller.credentialsTypeStr}" value="travellers[${vs.index}].credentlsType">
									</td>
									<td>
										<input type="text" size="28" value="${traveller.credentialsNum }" value="travellers[${vs.index}].credentialsNum">
									</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>

				</div>

				<div class="panel panel-default">
					<div class="panel-heading">Contact info</div>
					<div class="row data-type">
						<input type="hidden" name="member.id" value="${orders.member.id}">
						<div class="col-md-2 title">Member</div>
						<div class="col-md-4 data text">
						
							<input type="text" class="form-control" value="${orders.member.nickname }" name="member.nickname">
						
						</div>

						<div class="col-md-2 title">Contact</div>
						<div class="col-md-4 data text">
							
							<input type="text" value="${orders.member.name}" name="member.name" class="form-control">
						
						</div>

						<div class="col-md-2 title">Phone number</div>
						<div class="col-md-4 data text">
							<input type="text" value="${orders.member.phoneNum}" name="member.phoneNum" class="form-control">
						</div>

						<div class="col-md-2 title">Email</div>
						<div class="col-md-4 data text">
							<input type="text" value="${orders.member.email}" name="member.email" class="form-control">
						</div>

					</div>
				</div>

				<c:if test="${orders.orderStatus==1}">
					<div class="panel panel-default">
						<div class="panel-heading">Expense</div>
						<div class="row data-type">

							<div class="col-md-2 title">Payment method</div>
							<div class="col-md-4 data text">Online payment-<input type="text" value="${orders.payTypeStr}" name="payType"></div>

							<div class="col-md-2 title">Money</div>
							<div class="col-md-4 data text">$<input type="text" value="${orders.product.productPrice}" name="product.productPrice"></div>

						</div>
					</div>
				</c:if>

				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">update</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">return</button>
				</div>
			</form>
			</section>



		</div>

		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.8
		</div>
		<strong>Copyright &copy; 2014-2019 <a
				href="http://www.itcast.cn">Sheng's R&D</a>.
		</strong> All rights reserved. </footer>

	</div>

	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>
		$(document).ready(function() {

			$(".select2").select2();


			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {
			$('#datepicker-a3').datetimepicker({
				format : "yyyy-mm-dd hh:ii",
				autoclose : true,
				todayBtn : true,
				language : "zh-CN"
			});
			$('#datepicker-a6').datetimepicker({
				format : "yyyy-mm-dd hh:ii",
				autoclose : true,
				todayBtn : true,
				language : "zh-CN"
			});

			setSidebarActive("order-manage");


			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});

			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
</body>


</html>