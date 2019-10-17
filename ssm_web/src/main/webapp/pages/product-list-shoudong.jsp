<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Sheng's</title>
<meta name="description" content="Sheng's">
<meta name="keywords" content="Sheng's">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

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
				Product management <small>All products</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> Home</a></li>
				<li><a
						href="${pageContext.request.contextPath}/pages/product-list.jsp">Product management</a></li>

				<li class="active">All products</li>
			</ol>
		</section>

		<section class="content"> <!-- .box-body -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">list</h3>
				</div>

				<div class="box-body">

					<div class="table-box">

						<div class="pull-left">
							<div class="form-group form-inline">
								<div class="btn-group">
									<button type="button" class="btn btn-default" title="add"
											onclick='location.href="${pageContext.request.contextPath}/pages/product-add.jsp"'>
										<i class="fa fa-file-o"></i> add
									</button>
									<button type="button" class="btn btn-default" title="delete"
											onclick='delMany()'>
										<i class="fa fa-trash-o"></i> delete
									</button>
									<button type="button" class="btn btn-default" title="open"
											onclick='confirm("Are you sure you want to open it?")'>
										<i class="fa fa-check"></i> open
									</button>
									<button type="button" class="btn btn-default" title="block"
											onclick='confirm("Are you sure you want to block it?")'>
										<i class="fa fa-ban"></i> block
									</button>
									<button type="button" class="btn btn-default" title="refresh"
											onclick="window.location.reload();">
										<i class="fa fa-refresh"></i> refresh
									</button>
								</div>
							</div>
						</div>
						<div class="box-tools pull-right">
							<div class="has-feedback">
								<input type="text" class="form-control input-sm"
									   placeholder="search"> <span
									class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>

						<form id="delForm" action="${pageContext.request.contextPath}/product/delMany">

							<table id="dataList"
								   class="table table-bordered table-striped table-hover dataTable">
								<thead>
								<tr>
									<th class="" style="padding-right: 0px;"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
									</th>
									<th class="sorting_asc">ID</th>

									<th class="sorting">Product number</th>
									<th class="sorting">Product name</th>
									<th class="sorting">Departure city</th>
									<th class="sorting">Departure time</th>
									<th class="sorting">Price</th>
									<th class="sorting">Product status</th>

									<th class="text-center">Operation</th>
								</tr>
								</thead>
								<tbody>

								<c:forEach items="${pageInfo.list}" var="product">
									<tr>
										<td><input name="ids" type="checkbox" value="${product.id}"></td>
										<td>${product.id}</td>

										<td>${product.productNum}</td>
										<td>${product.productName}</td>
										<td>${product.cityName}</td>
										<td>
											<fmt:formatDate value="${product.departureTime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
										</td>
										<td>${product.productPrice}</td>
										<td>${product.productStatus == 1?"open":"close"}</td>

										<td class="text-center">
											<button type="button" class="btn bg-olive btn-xs"
													onclick='delOne(${product.id})'>delete</button>
											<button type="button" class="btn bg-olive btn-xs"
													onclick='location.href="all-order-manage-edit.html"'>Order</button>
											<button type="button" class="btn bg-olive btn-xs"
													onclick='location.href="${pageContext.request.contextPath}/product/updateUI?id=${product.id}"'>update</button>
										</td>
									</tr>
								</c:forEach>
								</tbody>

							</table>

						</form>

						<div class="pull-left">
							<div class="form-group form-inline">
								<div class="btn-group">
									<button type="button" class="btn btn-default" title="add"
											onclick='location.href="all-order-manage-edit.html"'>
										<i class="fa fa-file-o"></i> add
									</button>
									<button type="button" class="btn btn-default" title="delete"
											onclick='confirm("Are you sure you want to delete it?")'>
										<i class="fa fa-trash-o"></i> delete
									</button>
									<button type="button" class="btn btn-default" title="open"
											onclick='confirm("Are you sure you want to open it?")'>
										<i class="fa fa-check"></i> open
									</button>
									<button type="button" class="btn btn-default" title="block"
											onclick='confirm("Are you sure you want to block it?")'>
										<i class="fa fa-ban"></i> block
									</button>
									<button type="button" class="btn btn-default" title="refresh"
											onclick="window.location.reload();">
										<i class="fa fa-refresh"></i> refresh
									</button>
								</div>
							</div>
						</div>
						<div class="box-tools pull-right">
							<div class="has-feedback">
								<input type="text" class="form-control input-sm"
									   placeholder="search"> <span
									class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>


					</div>


				</div>

				<div class="box-footer">
					<div class="pull-left">
						<div class="form-group form-inline">
							${pageInfo.pages} pages in total, ${pageInfo.total} items in total.
							<select id="pageSize" onchange="gotoPage(1)" class="form-control">
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="5" selected="selected">5</option>
								<option value="10">10</option>
							</select> items per page
						</div>
					</div>

					<div class="box-tools pull-right">
						<ul class="pagination">

							<li><a href="javascript:gotoPage(1)" aria-label="Previous">Home</a></li>
							<li><a href="javascript:gotoPage(${pageInfo.prePage})">Prev</a></li>

							<c:forEach begin="${pageInfo.navigateFirstPage}" end="${pageInfo.navigateLastPage}" var="i">
								<li><a href="javascript:gotoPage(${i})">${i}</a></li>
							</c:forEach>
							<li><a href="javascript:gotoPage(${pageInfo.nextPage})">Next</a></li>
							<li><a href="javascript:gotoPage(${pageInfo.pages})" aria-label="Next">Last</a></li>
						</ul>
					</div>

				</div>
				<!-- /.box-footer-->

			</div>

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
<script type="text/javascript">

    $("#pageSize option[value=${pageInfo.pageSize}]").prop("selected","selected");

    function gotoPage(currPage){

        var pageSize = $("#pageSize").val();
        if(currPage < 1){
            return ;
        }
        if(currPage > ${pageInfo.pages}){
            return ;
        }
        location.href="${pageContext.request.contextPath}/product/findAll?currPage="+currPage+"&pageSize="+pageSize;
    }





    function delOne(id){
        if(confirm("Are you sure you want to delete it?")){
            location.href="${pageContext.request.contextPath}/product/delOne?id="+id;
        }
    }

    function delMany(){
        if(confirm("Are you sure you want to delete these?")) {
            var delForm = $("#delForm");
            delForm.submit();
        }
    }
</script>
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