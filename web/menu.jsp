<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="carouselExampleCaptions" class="carousel slide carousel-fade">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature.jpg?sfvrsn=64942d53_4" class="d-block w-100" alt="Wild Landscape"/>
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
            <div class="carousel-caption d-none d-sm-block mb-5">
                <h1 class="mb-4"></h1>
            </div>
        </div>
    </div>

    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">

        <div class="container">
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="home">
                        <span class="brand-text">Chất lượng làm nên thương hiệu</span>
                        <img src="image/AT-Fruit.png" alt="" class="logo-img" />
                    </a>
                </li>
            </ul>
        </div>

        <div class="d-flex align-items-center">
            <!-- Nút Home -->
            <a style="text-align: center" class="nav-link me-3" href="home">
                <i class="fas fa-home"></i>
                <span class="home-button">Home</span>
            </a>

            <!-- Icon Giỏ hàng -->
            <a class="nav-link me-3 cart-icon" href="cart">
                <i style="text-align: center" class="fas fa-cart-plus"></i>
                <span style="color: white" class="badge rounded-pill badge-notification bg-danger">${size}</span>
            </a>
            <c:if test="${not empty cookie.userCookie}">
                <% 
                    String userCookieValue = "";
                    Cookie[] cookies = request.getCookies();
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("userCookie")) {
                            userCookieValue = cookie.getValue();
                            break;
                        }
                    }

                    String[] userInfo = userCookieValue.split(":");
                    String userName = userInfo[1];
                    int isAdmin = 0; // Mặc định không phải admin
                    if (userInfo.length > 2) {
                        isAdmin = Integer.parseInt(userInfo[2]);
                    }
        
                    // Lưu thông tin người dùng vào request scope
                    request.setAttribute("userName", userName);
                    request.setAttribute("isAdmin", isAdmin);
                %>

                <c:if test="${isAdmin == 1}">
                    <a style="text-align: center" class="nav-link auth-button" href="manager">Manage Product</a>
                    <a style="text-align: center" class="nav-link auth-button" href="userlist">Manage User</a>
                    <a style="text-align: center" class="nav-link auth-button" href="orderlist">Manage Order</a>
                </c:if>
                <a style="text-align: center" class="nav-link auth-button" href="history">History Shopping</a>
                <a style="text-align: center" class="active">Hello, ${userName}</a>
                <a class="nav-link auth-button" href="logout">Đăng Xuất</a>
            </c:if>
            <c:if test="${empty cookie.userCookie}">
                <!-- Button Đăng nhập -->
                <a class="nav-link auth-button" href="login.jsp">Đăng nhập</a>
            </c:if>

        </div>
    </nav>

</div>