<%--<jsp:useBean id="authUser" scope="session" type="Model.User"/>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Smart Home</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/TemplateAdmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/TemplateAdmin/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"
           href="${pageContext.request.contextPath}/Admin/Product/ShowProduct">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Admin Smart Home</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/Admin/Product/ShowProduct">
                <span>Quản lý bài viết</span></a>
        </li>


        <hr class="sidebar-divider">


        <div class="sidebar-heading">
            Quản lý category
        </div>

        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCategory"
               aria-expanded="true" aria-controls="collapseTwo">
                <span>Danh Mục</span>
            </a>
            <div id="collapseCategory" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Lựa chọn:</h6>
                    <a class="collapse-item" href="<c:url value="/admin/addCategory"/>">Thêm danh mục</a>
                    <a class="collapse-item" href="<c:url value="/admin/listCategory"/>">Danh sách danh mục</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Quản lý người dùng
        </div>
        <li class="nav-item">
            <a class="nav-link collapsed" href="${pageContext.request.contextPath}/Admin/User/ShowUser"
               aria-expanded="true">
                <span>Danh sách người dùng</span>
            </a>
        </li>

        <!-- Nav Item - Tables -->

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>


    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>


                <ul class="navbar-nav ml-auto">


                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
                            <img class="img-profile rounded-circle"
                                 src="../../../TemplateAdmin/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Quay về trang chủ.
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>

            <div class="container-fluid  ">

                <div class="row ">
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Tổng số sản phẩm
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"> ${total}</div>
                                    </div>
                                    <div class="col-auto">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Danh sách sản phẩm</h1>
                    <!-- DataTales Example -->
                    <div class="d-flex justify-content-end ">
                        <a href="#"
                           class="btn btn-success btn-icon-split align-content-center"
                           data-target="#addSanPham" data-toggle="modal">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-plus"></i>
                                        </span>
                            <span class="text">Thêm sản phẩm</span>
                        </a>
                        <div class="col-auto">
                        </div>
                        <a href="#"
                           class="btn btn-info btn-icon-split align-content-center"
                           data-target="#editSanPham" data-toggle="modal">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-edit"></i>
                                        </span>
                            <span class="text">Chỉnh sửa</span>
                        </a>
                    </div>
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Image</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Category ID</th>
                                        <th>
                                            <div class="d-flex justify-content-sm-center">Xoá</div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="t">
                                        <tbody>
                                        <tr>
                                            <td>${t.product_id}</td>
                                            <td>${t.name}</td>
                                            <td>${t.description}</td>
                                            <td>${t.image}</td>
                                            <td>${t.price}</td>
                                            <td>${t.quantity}</td>
                                            <td>${t.category_id}</td>
                                            <td>
                                                <div class="d-flex justify-content-sm-center">
                                                    <a href="DeleteProduct?id=${t.product_id}"
                                                       class="btn btn-danger btn-icon-split ">
                                                        <span class="icon text-white-50 ">
                                                            <i class="fas fa-trash"></i>
                                                        </span>
                                                        <span class="text">Xoá</span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <div class="col-sm-12 col-md-7">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                        <ul class="pagination">
                                            <c:if test="${page != 1}">
                                                <li class="paginate_button page-item" id="dataTable_previous">
                                                    <a href="${pageContext.request.contextPath}/Admin/Product/ShowProduct?keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") :
                                                    ""%>&page=${page - 1 }" aria-controls="dataTable" data-dt-idx="0"
                                                       tabindex="0" class="page-link">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:forEach var="i" begin="1" end="${totalpage}">
                                                <c:choose>
                                                    <c:when test="${ page == i}">
                                                        <li class="paginate_button page-item active">
                                                            <a href="${pageContext.request.contextPath}/Admin/Product/ShowProduct?keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") :
                                                            ""%>&page=${i}" aria-controls="dataTable" tabindex="0"
                                                               class="page-link">${ i}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="paginate_button page-item">
                                                            <a href="${pageContext.request.contextPath}/Admin/Product/ShowProduct?keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") :
                                                            ""%>&page=${i}" aria-controls="dataTable" tabindex="0"
                                                               class="page-link">${ i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${page < totalpage}">
                                                <li class="paginate_button page-item next" id="dataTable_next">
                                                    <a href="${pageContext.request.contextPath}/Admin/Product/ShowProduct?keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") :
                                                    ""%>&page=${page + 1}" aria-controls="dataTable" tabindex="0"
                                                       class="page-link">Next</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>

            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn muốn thoát khỏi hệ thống ??</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Bạn chọn xác nhận sẽ quay về trang chủ.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="/home">Xác nhận</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="editSanPham" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id=>Sửa thông tin sản phẩm</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form action="EditProduct" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label>ID</label>
                        <input name="id" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Category ID</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Sửa">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="addSanPham" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id=>Thêm sản phẩm</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form action="AddProduct" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label>ID</label>
                        <input name="id" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Category ID</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Thêm">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/TemplateAdmin/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/TemplateAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/TemplateAdmin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/TemplateAdmin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/TemplateAdmin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/TemplateAdmin/js/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath}/TemplateAdmin/js/demo/chart-pie-demo.js"></script>

</body>
</html>
