<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:useBean id="authUser" scope="session" type="Model.User"/>--%>
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
    <script src="https://kit.fontawesome.com/f9029665cb.js" crossorigin="anonymous"></script>

</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"
           href="<c:url value="/admin/listProduct"/>">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Admin Smart Home</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="<c:url value="/admin/listProduct"/>">
                <span>Quản lý sản phẩm</span></a>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="<c:url value="/admin/listOrder"/>">
                <span>Quản lý đơn hàng</span></a>
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
            <a class="nav-link collapsed" href="<c:url value="/admin/listCustomer"/>"
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
            <div class="container-fluid">

                <!-- Page Heading -->

                <!-- DataTales Example -->
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Danh Sách User</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <div class="dataTables_wrapper">
                                                    <div class="dataTables_wrapper">
                                                        <table id="example" class="table table-bordered" style="min-width: 845px" role="grid" aria-describedby="example_info">
                                                            <thead>
                                                            <tr role="row"><th class="sorting_desc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="descending" aria-label="Mã: activate to sort column ascending" style="width: 98.2969px;">Mã User</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Tên đăng nhập: activate to sort column ascending" style="width: 171.672px;">Tên đăng nhập</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Họ và tên: activate to sort column ascending" style="width: 171.672px;">Họ và tên</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending" style="width: 171.672px;">Email</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Địa chỉ: activate to sort column ascending" style="width: 171.672px;">Địa chỉ</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Ngày sinh: activate to sort column ascending" style="width: 171.672px;">Ngày sinh</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Giới tính: activate to sort column ascending" style="width: 171.672px;">Giới tính</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Điện thoại: activate to sort column ascending" style="width: 171.672px;">Điện thoại</th>
                                                            </tr>
                                                            </thead>
                                                            <c:forEach items="${listC}" var="t">
                                                                <tbody>
                                                                <tr class="odd" role="row">
                                                                    <td class="sorting_1">${t.customerId}</td>
                                                                    <td>${t.username}</td>
                                                                    <td>${t.fullname}</td>
                                                                    <td>${t.email}</td>
                                                                    <td>${t.address}</td>
                                                                    <td>${t.birthday}</td>
                                                                    <td>
                                                                        <c:if test="${t.gender eq true}">
                                                                            Nam
                                                                        </c:if>
                                                                        <c:if test="${t.gender eq false}">
                                                                            Nữ
                                                                        </c:if>
                                                                    </td>
                                                                    <td>${t.phone}</td>
                                                                </tbody>
                                                            </c:forEach>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

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
                        <h5 class="modal-title">Bạn muốn thoát khỏi hệ thống ??</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Bạn chọn xác nhận sẽ quay về trang chủ.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="/logout">Xác nhận</a>
                    </div>
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
    </div>
</div>
</body>
</html>
