<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch sử mua hàng</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <section style="background-color: green;">
            <div class="container ">
                <div class="d-flex justify-content-center align-items-center ">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row ">
                                    <div class="col-lg-12">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Lịch sử mua hàng</h1>
                                            </div>
                                            <hr class="my-4">
                                            <c:if test="${not empty orders}">
                                                <c:forEach items="${orders}" var="order">
                                                    <div class="row mb-4">
                                                        <div class="col-12">
                                                            <h4>Mã đơn hàng: ${order.orderId}</h4>
                                                            <h5>Tổng: <fmt:formatNumber pattern="##,###,### đ" value="${order.totalAmount}"/></h5>
                                                            <h5>Ngày mua: <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy"/></h5>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-4">
                                                        <div class="col-12">
                                                            <h5>Order Details:</h5>
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Sản phẩm</th>
                                                                        <th>Tên</th>
                                                                        <th>Số lượng</th>
                                                                        <th>Giá tiền</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${listI}" var="item">
                                                                        <c:if test="${item.orderId == order.orderId}">
                                                                            <tr>
                                                                                <td>
                                                                                    <img src="${item.fruitName}" style="height: 100px;width: 150px">
                                                                                </td>
                                                                                <td>${item.image}</td>
                                                                                <td>${item.quantity}</td>
                                                                                <td><fmt:formatNumber pattern="##,###,### đ" value="${item.price * item.quantity}"/></td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <hr class="my-4">
                                                </c:forEach>
                                            </c:if>
                                                <c:if test="${empty orders}">
                                                <h3 style="text-align: center">Bạn chưa mua sản phẩm nào</h3>
                                            </c:if>
                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="home" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Quay lại cửa hàng</a></h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>