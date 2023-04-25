<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@include file="/common/web/header.jsp" %>

    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="<c:url value="/css/productlist.css"/>">



</head>
<body>
<br>
<br>


<section>
    <div class="container d-flex justify-content-center mt-50 mb-50">

        <div class="row">
            <div class="col-md-4 mt-2">


                <c:forEach items="${products}" var="product">

                <div class="card">
                    <div class="card-body">
                        <div class="card-img-actions">

                            <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt="">


                        </div>
                    </div>

                    <div class="card-body bg-light text-center">
                        <div class="mb-2">
                            <h6 class="font-weight-semibold mb-2">
                                <a href="/product/detail/${product.productId}" class="text-default mb-2" data-abc="true">${product.name}</a>
                            </h6>

                            <a href="#" class="text-muted" data-abc="true">Laptops & Notebooks</a>
                        </div>

                        <h3 class="mb-0 font-weight-semibold">$250.99</h3>

                        <div>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                        </div>

                        <div class="text-muted mb-3">34 reviews</div>

                        <a  <c:if test="${not empty sessionScope.id}">
                            href="/cart/add/${product.productId}"
                        </c:if>
                                <c:if test="${ empty sessionScope.id}">
                                    href="/login"
                                </c:if>>
                            <button type="button"  class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Thêm giỏ hàng</button>
                        </a>




                    </div>
                </div>
                </c:forEach>



            </div>


            <div class="col-md-4 mt-2">


             <%--   <div class="card">
                    <div class="card-body">
                        <div class="card-img-actions">

                            <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt="">


                        </div>
                    </div>

                    <div class="card-body bg-light text-center">
                        <div class="mb-2">
                            <h6 class="font-weight-semibold mb-2">
                                <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook with 500GB HDD & 8GB RAM</a>
                            </h6>

                            <a href="#" class="text-muted" data-abc="true">Laptops & Notebooks</a>
                        </div>

                        <h3 class="mb-0 font-weight-semibold">$250.99</h3>

                        <div>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                        </div>

                        <div class="text-muted mb-3">34 reviews</div>

                        <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>


                    </div>
                </div>--%>




            </div>

            <div class="col-md-4 mt-2">


                <div class="card">
                    <div class="card-body">
                        <div class="card-img-actions">

                            <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt="">


                        </div>
                    </div>

                    <div class="card-body bg-light text-center">
                        <div class="mb-2">
                            <h6 class="font-weight-semibold mb-2">
                                <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook with 500GB HDD & 8GB RAM</a>
                            </h6>

                            <a href="#" class="text-muted" data-abc="true">Laptops & Notebooks</a>
                        </div>

                        <h3 class="mb-0 font-weight-semibold">$250.99</h3>

                        <div>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                        </div>

                        <div class="text-muted mb-3">34 reviews</div>

                        <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>


                    </div>
                </div>




            </div>


            <div class="col-md-4 mt-2">


                <div class="card">
                    <div class="card-body">
                        <div class="card-img-actions">

                            <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt="">


                        </div>
                    </div>

                    <div class="card-body bg-light text-center">
                        <div class="mb-2">
                            <h6 class="font-weight-semibold mb-2">
                                <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook with 500GB HDD & 8GB RAM</a>
                            </h6>

                            <a href="#" class="text-muted" data-abc="true">Laptops & Notebooks</a>
                        </div>

                        <h3 class="mb-0 font-weight-semibold">$250.99</h3>

                        <div>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                        </div>

                        <div class="text-muted mb-3">34 reviews</div>

                        <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>


                    </div>
                </div>




            </div>


            <div class="col-md-4 mt-2">


                <div class="card">
                    <div class="card-body">
                        <div class="card-img-actions">

                            <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt="">


                        </div>
                    </div>

                    <div class="card-body bg-light text-center">
                        <div class="mb-2">
                            <h6 class="font-weight-semibold mb-2">
                                <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook with 500GB HDD & 8GB RAM</a>
                            </h6>

                            <a href="#" class="text-muted" data-abc="true">Laptops & Notebooks</a>
                        </div>

                        <h3 class="mb-0 font-weight-semibold">$250.99</h3>

                        <div>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                        </div>

                        <div class="text-muted mb-3">34 reviews</div>

                        <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>


                    </div>
                </div>




            </div>


            <div class="col-md-4 mt-2">


                <div class="card">
                    <div class="card-body">
                        <div class="card-img-actions">

                            <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png" class="card-img img-fluid" width="96" height="350" alt="">


                        </div>
                    </div>

                    <div class="card-body bg-light text-center">
                        <div class="mb-2">
                            <h6 class="font-weight-semibold mb-2">
                                <a href="#" class="text-default mb-2" data-abc="true">Toshiba Notebook with 500GB HDD & 8GB RAM</a>
                            </h6>

                            <a href="#" class="text-muted" data-abc="true">Laptops & Notebooks</a>
                        </div>

                        <h3 class="mb-0 font-weight-semibold">$250.99</h3>

                        <div>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                            <i class="fa fa-star star"></i>
                        </div>

                        <div class="text-muted mb-3">34 reviews</div>

                        <button type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</button>


                    </div>
                </div>




            </div>





        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>