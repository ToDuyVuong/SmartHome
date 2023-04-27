<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/common/web/header.jsp" %>


    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sản phẩm</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<br>
<br>
<br>

<section>
    <div class="container">
        <div class="row">
            <div class="col">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/category">Category</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Product</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-3">


                <%-- List category dùng foreach                --%>
                <div class="card bg-light mb-3">

                    <div class="card-header bg-primary text-white">
                        <i class="fa fa-list"></i> Loại sản phẩm
                    </div>


                    <%--                    <c:forEach items="${categories}" var="category">--%>
                    <%--                        <p>${category.name}</p>--%>
                    <%--                        <a href="/category/${category.categoryId}">a</a>--%>
                    <%--                    </c:forEach>--%>

<%--                    <select name="categoryId_forProduct">--%>
                        <c:forEach items="${categories}" var="category">
                            <form action="/category/${category.categoryId}"  method="get">
                             <a  href="/category/${category.categoryId}">  <option  value="${category.categoryId}">${category.name}</option></a>
                            </form>
                        </c:forEach>
<%--                    </select>--%>
<%--                    <input type="submit" value="Submit">--%>

<%--                    <select>--%>
<%--                        <c:forEach items="${categories}" var="category">--%>
<%--                            <option value="${category.categoryId}">${category.name}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>

<%--                    <ul class="list-group category_block">--%>
<%--                        &lt;%&ndash;                        <c:forEach items="${categorys}" var="categorys">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                        <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li class="list-group-item"><a href="category.html">aaaa</a></li>&ndash;%&gt;--%>

<%--                        &lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                        </c:forEach>&ndash;%&gt;--%>
<%--                    </ul>--%>
                </div>


                <div class="card bg-light mb-3">
                    <div class="card-header bg-success text-white text-uppercase">Last product</div>
                    <div class="card-body">
                        <img class="img-fluid" src="https://dummyimage.com/600x400/55595c/fff"/>
                        <h5 class="card-title">Product title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the
                            card's content.</p>
                        <p class="bloc_left_price">99.00 $</p>
                    </div>
                </div>
            </div>


            <div class="col">
                <div class="row">
                    <c:forEach items="${products}" var="product">

                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card">
<%--                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff"--%>
<%--                                     alt="Card image cap">--%>

                                <img src="${product.image}"
                                     alt="Hình ảnh sản phẩm"title="" width="150"
                                     height="150">


                                <div class="card-body">
                                    <h4 class="card-title"><a href="/product/detail/${product.productId}"
                                                              title="View Product">${product.name}</a>
                                    </h4>
                                    <p class="card-text">${product.description}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="bloc_left_price">Giá bán: ${product.price} VNĐ</p>
                                        </div>
                                        <div class="col">
                                            <a <c:if test="${not empty sessionScope.id}">
                                                href="/cart/add/${product.productId}"
                                            </c:if>
                                                    <c:if test="${ empty sessionScope.id}">
                                                        href="/login"
                                                    </c:if>
                                                    class="btn btn-success btn-block">Thêm giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>


                    <div class="col-12">
                        <nav aria-label="...">
                            <ul class="pagination">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>

                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <c:forEach begin="1" end="${totalPages}" var="page">
                                    <li class="page-item ${currentPage == page ? 'active' : ''}">
                                        <a class="page-link" href="?page=${page}">${page}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
</script>


</body>
</html>
