<%-- 
    Document   : details
    Created on : Mar 8, 2024, 3:04:38 AM
    Author     : tu588
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AT-Fruit</title>
        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="./css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <!-- Navbar -->
            <div class="navbar-nav">
                <nav class="navbar navbar-expand-lg navbar-toggler mt-3 mb-5 shadow p-2" style="background-color: green;width:1110px">
                    <!-- Container wrapper -->
                    <div class="container-fluid">

                        <!-- Toggle button -->
                        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent2"
                                aria-controls="navbarSupportedContent2" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>

                        <!-- Collapsible wrapper -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <!-- Link -->
                                <li class="nav-item">
                                    <a style="padding-left: 200px" class="nav-link ${empty param.category ? 'active' : ''}" href="home">Tất Cả</a>
                            </li>
                            <c:forEach items="${listC}" var="lc">
                                <li class="nav-item">
                                    <a class="nav-link ${tag == lc.categoryId ? 'active' : ''}" href="category?category=${lc.categoryId}">${lc.categoryName}</a>
                                </li>
                            </c:forEach>
                        </ul>

                        <!-- Search -->
                        <form action="search" method="post" class=" search-form">
                            <input name="text" type="search" class="form-control rounded-0" placeholder="Search" aria-label="Search">
                            <button type="submit" class="btn btn-secondary" >
                                <i class="fa fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <!-- Container wrapper -->
            </nav>
        </div>
        <!-- Navbar -->
        <!--Main layout-->
        <main class="mt-5 pt-4">
            <div class="container mt-5">
                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <img src="${details.image}" class="img-fluid" alt="" />
                    </div>
                    <div class="col-md-6 mb-4">
                        <!--Content-->
                        <div class="p-4">
                            <div class="mb-3">
                                <a>
                                    <strong><p style="font-size: 40px;">${details.fruitName}</p></strong>
                                </a>

                                <a>
                                    <span style="color: white;font-size: 18px" class="badge bg-success me-1">${details.category.categoryName}</span>
                                </a>
                            </div>
                            <strong><p style="font-size: 20px;">${details.description}</p></strong>
                            <p class="lead">
                                <span class="me-1">
                                    <del><fmt:formatNumber pattern="##,###,### VND" value="${details.price*1.3}"/></del>
                                </span>
                                <span style="font-size: 22px;color: red;font-weight: 650"><fmt:formatNumber pattern="##,###,### VND" value="${details.price}"/></span>
                            </p>

                            <form class="d-flex justify-content-left" action="addtocart" method="post">
                                <div class="form-outline me-1" style="width: 100px;">
                                    <input id="quantityInput" type="number" value="1" class="form-control" name="quantity" />
                                </div>
                                <div class="form-outline me-1">
                                    <input value="${details.fruitId}" id="productIdInput" type="hidden" class="form-control" name="productId" />
                                    <button class="btn btn-success ms-1">
                                        Add to cart
                                        <i class="fas fa-shopping-cart ms-1"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!--Content-->
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
                <hr />
            </div>
        </main>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
