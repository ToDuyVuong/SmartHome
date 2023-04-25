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
    <title>Danh sách đơn hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="<c:url value="/css/vieworder.css"/>">


    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>

</head>
<body>

<br>
<br>
<br>
<section>
    <div class="container">
        <div class="row">
            <div class="col-12 mb-3 mb-lg-5">
                <div class="position-relative card table-nowrap table-card">
                    <div class="card-header align-items-center">
                        <h5 class="mb-0">Danh sách đơn hàng của ${customer.fullname}!</h5>
                        <p class="mb-0 small text-muted">${customer.email }</p>
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                            <tr>
                                <th>Mã đơn</th>
                                <th>Ngày</th>
                                <th>Người nhận</th>
                                <th>Liên hệ</th>
                                <th>Địa chỉ</th>
                                <th>Ghi chú</th>
                                <th>Số lượng</th>
                                <th>Tổng giá</th>
                                <th>Trạng thái</th>
                                <th>Chi tiết</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="item" items="${order}">
                                <form>
                                    <tr class="align-middle">
                                        <td class="text-center" id="orderId" name="orderId">
                                                ${item.orderId}
                                        </td>
                                        <td class="text-center">
                                                ${item.date}
                                        </td>
                                        <td class="text-center">
                                                ${item.customer.fullname}
                                        </td>
                                        <td class="text-center">
                                                ${item.phone}
                                        </td>
                                        <td style="max-width: 20ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                ${item.address}
                                        </td>
                                        <td class="text-center"
                                            style="max-width: 20ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                ${item.note}
                                        </td>
                                        <td class="text-center">
                                                ${item.totalQuantity}
                                        </td>
                                        <td class="text-center">
                                                ${item.totalPrice}
                                        </td>
<%--                                        <td>--%>
<%--                                            <span class="badge fs-6 fw-normal bg-tint-success text-success">${item.status}</span>--%>
<%--                                            <span class="badge fs-6 fw-normal bg-tint-warning text-warning">Pending</span>--%>
<%--                                        </td>--%>

<%--                                        <td>--%>
<%--                                            <span class="badge fs-6 fw-normal ${item.status == 'ChuaXuLy' ? 'bg-tint-warning text-warning' : 'bg-tint-success text-success'}">${item.status}</span>--%>
<%--                                        </td>--%>
                                        <td>
                                            <span>${item.status}</span>
<%--                                            <span class="badge fs-6 fw-normal ${item.status == 'ChuaXuLy' ? 'bg-tint-warning text-warning' : item.status == 'DangXuLy' ? 'bg-tint-primary text-primary' : 'bg-tint-success text-success'}">${item.status}</span>--%>
                                        </td>
                                        <td class="text-center">
                                            <a title="submit" href="/order/detail/${item.orderId}" class="text-secondary">Chi tiết</a>
                                        </td>

                                            <%--                                        <td>--%>
                                            <%--                                            <div class="d-flex align-items-center">--%>
                                            <%--                                                <span><i class="fa fa-arrow-up" aria-hidden="true"></i></span>--%>
                                            <%--                                                <span>$145</span>--%>
                                            <%--                                            </div>--%>
                                            <%--                                        </td>--%>
                                            <%--                                        <td>--%>
                                            <%--                                            <span class="badge fs-6 fw-normal bg-tint-success text-success">Completed</span>--%>
                                            <%--                                        </td>--%>
                                            <%--                                        <td>Renee Sims</td>--%>
                                            <%--                                        <td>--%>
                                            <%--                                            <div class="d-flex align-items-center">--%>
                                            <%--                                                <span><i class="fa fa-arrow-up" aria-hidden="true"></i></span>--%>
                                            <%--                                                <span style="max-width: 30ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaCompleted</span>--%>
                                            <%--                                            </div>--%>
                                            <%--                                        </td>--%>
                                            <%--                                        <td>--%>
                                            <%--                                            <div class="d-flex align-items-center">--%>
                                            <%--                                                <span><i class="fa fa-arrow-up" aria-hidden="true"></i></span>--%>
                                            <%--                                                <span class="text-truncate" title="Completed"--%>
                                            <%--                                                      style="max-width: 30ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaCompleted</span>--%>
                                            <%--                                            </div>--%>
                                            <%--                                        </td>--%>
                                            <%--                                        <td>--%>
                                            <%--                                            <div class="d-flex align-items-center">--%>
                                            <%--                                                <span><i class="fa fa-arrow-up" aria-hidden="true"></i></span>--%>
                                            <%--                                                <span class="text-truncate" title="Completed"--%>
                                            <%--                                                      style="max-width: 30ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">CompletedCompletedCompletedCompletedCompletedCompletedCompletedCompletedCompletedCompletedCompleted</span>--%>
                                            <%--                                            </div>--%>
                                            <%--                                        </td>--%>


                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer text-end">
                        <a href="/profile" class="btn btn-gray">Quay lại trang cái nhân</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<br>
<br>
<br>
<section class="vh-100" style="background-color: #35558a;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100 text-center">
            <div class="col">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-light btn-lg" data-mdb-toggle="modal"
                        data-mdb-target="#exampleModal">
                    <i class="fas fa-info me-2"></i> Get information
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header border-bottom-0">
                                <button type="button" class="btn-close" data-mdb-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-start text-black p-4">
                                <h5 class="modal-title text-uppercase mb-5" id="exampleModalLabel">Johnatan Miller</h5>
                                <h4 class="mb-5" style="color: #35558a;">Thanks for your order</h4>
                                <p class="mb-0" style="color: #35558a;">Payment summary</p>
                                <hr class="mt-2 mb-4"
                                    style="height: 0; background-color: transparent; opacity: .75; border-top: 2px dashed #9e9e9e;">

                                <div class="d-flex justify-content-between">
                                    <p class="fw-bold mb-0">Ether Chair(Qty:1)</p>
                                    <p class="text-muted mb-0">$1750.00</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="small mb-0">Shipping</p>
                                    <p class="small mb-0">$175.00</p>
                                </div>

                                <div class="d-flex justify-content-between pb-1">
                                    <p class="small">Tax</p>
                                    <p class="small">$200.00</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="fw-bold">Total</p>
                                    <p class="fw-bold" style="color: #35558a;">$2125.00</p>
                                </div>

                            </div>
                            <div class="modal-footer d-flex justify-content-center border-top-0 py-4">
                                <button type="button" class="btn btn-primary btn-lg mb-1"
                                        style="background-color: #35558a;">
                                    Track your order
                                </button>
                            </div>
                        </div>
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