<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/common/web/header.jsp" %>
    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/ra.css"/>


    <link rel="stylesheet" th:href="@{/css/signin.css}"/>

    <title>Đăng ký tài khoản</title>
</head>
<body>


<%--<%@include file="/common/web/header.jsp"%>--%><br>
<section class="row" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div
                class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                <div class="card" style="border-radius: 15px;">
                    <div class="card-body p-5">
                        <form action="<c:url value = "register/add" />" method=POST
                              enctype="multipart/form-data" onsubmit="return confirm('Xác nhận đăng ký.');">
                            <h2 class="text-uppercase text-center mb-5">Đăng Ký Tài
                                Khoản</h2>

                            <!-- Hiển thông báo -->
                            <c:if test="${messageRegister != null}">
                                <div class="alert alert-primary" role="alert">
                                    <i>${messageRegister}</i>
                                </div>
                            </c:if>

                            <div>
                                <c:if test="${not empty sessionScope.messageRegister}">
                                    <div class="alert alert-primary" role="alert">
                                        <i><%=session.getAttribute("messageRegister")%>
                                        </i>
                                    </div>
                                </c:if>
                            </div>

                            <div>

                                <%-- <div class="mb-3">
                                <label for="ID_USER" class="form-label">User ID</label> <input
                                    type="hidden" value="${user.is_Edit()}"> <input
                                    type="text" readonly="readonly" class="form-control"
                                    value="${user.getID_USER() }" id="ID_USER" name="ID_USER"
                                    aria-describedby="ID_USER" placeholder="ID">
                            </div> --%>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="fullname">Họ và tên:</label> <input
                                        type="text" value="${customer.fullname}" id="fullname"
                                        name="fullname" aria-describedby="fullname"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="username">Tài khoản:</label> <input
                                        type="text" value="${customer.username}" id="username"
                                        name="username" aria-describedby="username"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="email"> Email:</label> <input
                                        type="email" value="${customer.email}" id="email"
                                        name="email" aria-describedby="email"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="col-md-6 mb-4">
                                    <label class="form-label" for="form3Example1cg">Giới
                                        tính:</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                               id="femaleGender" value="false" checked/> <label
                                            class="form-check-label " for="femaleGender">Nữ</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                               id="maleGender" value="true"/> <label
                                            class="form-check-label" for="maleGender">Nam</label>
                                    </div>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="birthday">Ngày sinh:</label> <input
                                        type="date" value="${customer.birthday}" id="birthday"
                                        name="birthday" aria-describedby="birthday"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4 ">
                                    <label class="form-label" for="phone">Số điện thoại:</label> <input
                                        type="tel" value="${customer.phone}" id="phone" name="phone"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="address">Địa chỉ:</label> <input
                                        type="text" value="${customer.address}" id="address"
                                        name="address" class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="password">Mật khẩu:</label> <input
                                        type="password" value="${customer.password}" id="password"
                                        name="password" class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="password2">Xác nhận lại
                                        mật khẩu:</label> <input type="password"
                                                                 value="${customer.password2}" id="password2"
                                                                 name="password2"
                                                                 class="form-control form-control-lg"/>
                                </div>

                            </div>

                            <div class="d-flex justify-content-center">
                                <button type="submit"
                                        class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Đăng Ký
                                </button>
                            </div>

                            <p class="text-center text-muted mt-5 mb-0">
                                Đã có một tài khoản? <a href="login"
                                                        class="fw-bold text-body"><i>Đăng nhập</i></a>
                            </p>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

</section>


<%--
<section class="row" style="background-color: #111sea;">
    <div class="col-6 offset-3 mt-4">
        <form action="<c:url value = "/user/register/SaveOrUpdate" />"
            method=POST enctype="multipart/form-data">
            <div class="card">
                <div class="card-header">
                    <h2>${user.is_Edit() ? 'Edit User':'Add New User'}</h2>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="ID_USER" class="form-label">User ID</label> <input
                            type="hidden" value="${user.is_Edit()}"> <input
                            type="text" readonly="readonly" class="form-control"
                            value="${user.getID_USER() }" id="ID_USER" name="ID_USER"
                            aria-describedby="ID_USER" placeholder="ID">
                    </div>
                    <c:if test="${user.getImage() == null }">
                        <img id="image" src="/templates/images/noimage.jpg" alt=""
                            style="width: 60px" class="img-fuild rounded border">
                    </c:if>
                    <c:if test="${user.getImage() != null }">
                        <img id="image"
                            src="/admin/main/crudUser/images/${user.getImage()}" alt=""
                            style="width: 60px" class="img-fuild rounded border">
                    </c:if>
                    <div class="md-3">
                        <label for="imageFile" class="form-label">Image</label> <input
                            type="file" class="form-control-file"
                            value="${user.getImageFile()}" id="imageFile" name="imageFile"
                            aria-describedby="imageFile" placeholder="Image"
                            accept=".jpg, .png"> /////////
                    </div>

                    <div class="md-3">
                        <label for="Name" class="form-label">Name</label> <input
                            type="text" class="form-control" value="${user.getName() }"
                            id="Name" name="Name" aria-describedby="Name" placeholder="Name">
                    </div>

                    <div class="md-3">
                        <label for="Username" class="form-label">Username</label> <input
                            type="text" class="form-control" value="${user.getUsername()}"
                            id="Username" name="Username" aria-describedby="Username"
                            placeholder="Username">
                    </div>

                    <div class="md-3">
                        <label for="Password" class="form-label">Password</label> <input
                            type="text" class="form-control" value="${user.getPassword() }"
                            id="Password" name="Password" aria-describedby="Password"
                            placeholder="Password">
                    </div>

                    <div class="md-3">
                        <label for="Password" class="form-label">Gender</label> <input
                            id="Gender" class="form-check-input" type="radio" name="Gender"
                            ${user.isGender()?'checked':''} value="true"> <label
                            for="Gender" class="form-check-label">Nam</label>
                    </div>

                    <div class="md-3">
                        <label for="Phone" class="form-label">Phone</label> <input
                            type="text" class="form-control" value="${user.getPhone() }"
                            id="Phone" name="Phone" aria-describedby="Phone"
                            placeholder="Phone">
                    </div>

                    <div class="md-3">
                        <label for="Address" class="form-label">Address</label> <input
                            type="text" class="form-control" value="${user.getAddress() }"
                            id="Address" name="Address" aria-describedby="Address"
                            placeholder="Address">
                    </div>

                    <div class="md-3">
                        <label for="BDay" class="form-label">BirthDay</label> <input
                            type="date" class="form-control" value="${user.getBDay() }"
                            id="BDay" name="BDay" aria-describedby="BDay" placeholder="BDay">
                    </div>

                    <div class="md-3">
                        <label for="Role" class="form-label">Role</label> <input
                            id="Role" class="form-check-input" type="radio" name="Role"
                            ${user.isRole()?'checked':''} value="false"> <label
                            for="Role" class="form-check-label">Seller</label>
                    </div>

                    <div class="md-3">
                        <label for="Active" class="form-label">Active</label> <input
                            id="Active" class="form-check-input" type="radio" name="Active"
                            ${user.isActive()?'checked':''} value="true"> <label
                            for="Active" class="form-check-label">Hoạt động</label>
                    </div>
                </div>

            </div>

            <div class="card-footer text-muted">
                <a href="<c:url value="/admin/main/crudUser/add"/>"
                    class="btn btn-secondery"><i class="fas fas-new"></i>New</a> <a
                    href="<c:url value="/admin/main/crudUser/"/>"
                    class="btn btn-success"><i class="fas fas-bars"></i>List
                    Category</a>
                <button class="btn btn-primary" type="submit">
                    <i class="fas fas-save"></i>
                    <c:if test="${user._Edit }">
                        <span>Update</span>
                    </c:if>
                    <c:if test="${!user._Edit }">
                        <span>Save</span>
                    </c:if>
                </button>
            </div>
        </form>
    </div>
</section> --%>


<!--




<section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div class="card shadow-2-strong card-registration"
                    style="border-radius: 15px;">
                    <div class="card-body p-4 p-md-5">
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
                        <form>

                            <div class="row">
                                <div class="col-md-6 mb-4">

                                    <div class="form-outline">
                                        <input type="text" id="firstName"
                                            class="form-control form-control-lg" /> <label
                                            class="form-label" for="firstName">First Name</label>
                                    </div>

                                </div>
                                <div class="col-md-6 mb-4">

                                    <div class="form-outline">
                                        <input type="text" id="lastName"
                                            class="form-control form-control-lg" /> <label
                                            class="form-label" for="lastName">Last Name</label>
                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-4 d-flex align-items-center">

                                    <div class="form-outline datepicker w-100">
                                        <input type="text" class="form-control form-control-lg"
                                            id="birthdayDate" /> <label for="birthdayDate"
                                            class="form-label">Birthday</label>
                                    </div>

                                </div>
                                <div class="col-md-6 mb-4">

                                    <h6 class="mb-2 pb-1">Gender:</h6>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                            name="inlineRadioOptions" id="femaleGender" value="option1"
                                            checked /> <label class="form-check-label"
                                            for="femaleGender">Female</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                            name="inlineRadioOptions" id="maleGender" value="option2" />
                                        <label class="form-check-label" for="maleGender">Male</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                            name="inlineRadioOptions" id="otherGender" value="option3" />
                                        <label class="form-check-label" for="otherGender">Other</label>
                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-4 pb-2">

                                    <div class="form-outline">
                                        <input type="email" id="emailAddress"
                                            class="form-control form-control-lg" /> <label
                                            class="form-label" for="emailAddress">Email</label>
                                    </div>

                                </div>
                                <div class="col-md-6 mb-4 pb-2">

                                    <div class="form-outline">
                                        <input type="tel" id="phoneNumber"
                                            class="form-control form-control-lg" /> <label
                                            class="form-label" for="phoneNumber">Phone Number</label>
                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">

                                    <select class="select form-control-lg">
                                        <option value="1" disabled>Choose option</option>
                                        <option value="2">Subject 1</option>
                                        <option value="3">Subject 2</option>
                                        <option value="4">Subject 3</option>
                                    </select> <label class="form-label select-label">Choose option</label>

                                </div>
                            </div>

                            <div class="mt-4 pt-2">
                                <input class="btn btn-primary btn-lg" type="submit"
                                    value="Submit" />
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> -->
</body>