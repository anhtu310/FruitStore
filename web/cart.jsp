<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AT-Fruit</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <style>
        @media (min-width: 1025px) {
            .h-custom {
                height: 100vh !important;
            }
        }



        .card-registration .select-arrow {
            top: 13px;
        }

        .bg-grey {
            background-color: #eae8e8;
        }

        @media (min-width: 992px) {
            .card-registration-2 .bg-grey {
                border-top-right-radius: 16px;
                border-bottom-right-radius: 16px;
            }
        }

        @media (max-width: 991px) {
            .card-registration-2 .bg-grey {
                border-bottom-left-radius: 16px;
                border-bottom-right-radius: 16px;
            }
        }
    </style>
    <body>
        <section class="h-100 h-custom" style="background-color: green;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Giỏ Hàng</h1>
                                            </div>

                                            <hr class="my-4">


                                            <c:if test="${empty listItem}">
                                                <h3 style="text-align: center">Giỏ hàng trống</h3>
                                            </c:if>
                                            <c:forEach items="${listItem}" varStatus="status" var="item">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <!-- Hiển thị thông tin sản phẩm -->
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <img src="${item.image}" class="img-fluid rounded-3">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 style="font-size: 20px" class="text-center">${item.fruitName}</h6>
                                                        <!-- Hiển thị thông tin thể loại -->
                                                        <h6 class="text-center mb-0">${item.categoryName}</h6>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn btn-link px-2" onclick="decrementQuantity(${status.index})">
                                                            <i class="fas fa-minus"></i>
                                                        </button>
                                                        <input min="0" name="quantity" value="${item.quantity}" type="number" class="form-control form-control-sm" onchange="updatePrice(this, ${item.price}, ${status.index})" />
                                                        <button class="btn btn-link px-2" onclick="incrementQuantity(${status.index})">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-3 offset-lg-1">
                                                        <!-- Hiển thị giá tiền -->
                                                        <h6 class="mb-0"><span id="price_${status.index}"><fmt:formatNumber pattern="##,###,### đ" value="${item.price * item.quantity}"/></span></h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                                                    </div>
                                                </div>
                                                <hr class="my-4">
                                            </c:forEach>



                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="home" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Quay lại cửa hàng</a></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Tổng: <span id="totalAmount"></span></h3>
                                            <form action="pay" method="post" id="paymentForm">
                                                <button type="submit" class="btn btn-danger btn-block btn-lg" data-mdb-ripple-color="dark" onclick="redirectToThankYou()" ${listItem.size() == 0 ? 'disabled' : ''}>Thanh Toán</button>
                                            </form>
                                        </div>
                                    </div>


                                    <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            updateTotalAmount();
                                        });

                                        function incrementQuantity(index) {
                                            var input = document.getElementsByName('quantity')[index];
                                            input.stepUp();
                                            updatePrice(input, input.dataset.price, index);
                                            updateTotalAmount();
                                        }

                                        function decrementQuantity(index) {
                                            var input = document.getElementsByName('quantity')[index];
                                            input.stepDown();
                                            updatePrice(input, input.dataset.price, index);
                                            updateTotalAmount();
                                        }

                                        function updatePrice(input, price, index) {
                                            var quantity = parseInt(input.value);
                                            var totalPrice = quantity * price;
                                            var priceElement = document.getElementById('price_' + index);
                                            priceElement.innerHTML = formatPrice(totalPrice);
                                            updateTotalAmount();
                                        }

                                        function updateTotalAmount() {
                                            var totalAmountElement = document.getElementById('totalAmount');
                                            var totalAmount = calculateTotalAmount() * 1000; // Multiply by 1000 to add three zeros
                                            totalAmountElement.textContent = formatPrice(totalAmount);
                                        }

                                        function formatPrice(price) {
                                            return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(price);
                                        }

                                        function calculateTotalAmount() {
                                            var priceElements = document.querySelectorAll('[id^="price_"]');
                                            var totalAmount = 0;

                                            for (var i = 0; i < priceElements.length; i++) {
                                                var priceText = priceElements[i].textContent;
                                                var priceValue = parseFloat(priceText.replace(/[^0-9.-]+/g, ""));
                                                totalAmount += priceValue;
                                            }

                                            return totalAmount;
                                        }

                                        function redirectToThankYou() {
                                            window.location.href = "thankyou";
                                        }
                                    </script>

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