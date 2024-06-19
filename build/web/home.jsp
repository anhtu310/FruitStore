<%--
Document : home
Created on : Mar 3, 2024, 11:25:15 PM
Author : tu588
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html> <html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>AT-Fruit</title> <!-- CSS Libraries --> <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet"> <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"> <link href="lib/slick/slick.css" rel="stylesheet"> <link href="lib/slick/slick-theme.css" rel="stylesheet">
        dust
        Copy
        <!-- Template Stylesheet -->
        <link href="./css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- carousel -->
        <jsp:include page="menu.jsp"></jsp:include>


            <!--Main layout-->
            <main>
                <div class="container">
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

                <!-- Products -->
                <section>
                    <div class="text-center">
                        <div class="row">
                            <c:forEach items="${listF}" var="l">
                                <div class="col-lg-3 col-md-6 mb-4">
                                    <div class="card">
                                        <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                                             data-mdb-ripple-color="light">
                                            <img style="width: 320px; height: 200px" src="${l.image}"
                                                 class="w-100"  />
                                            <a href="#!">
                                                <div class="hover-overlay">
                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <a href="details?fid=${l.fruitId}" class="text-reset">
                                                <h2 class="card-title mb-2">${l.fruitName}</h2>
                                            </a>
                                            <a style="color: white">
                                                <span class="badge bg-success me-1">${l.category.categoryName}</span><br>
                                            </a>
                                            <del style="font-size: 20px" class="mb-3 price"><fmt:formatNumber pattern="##,###,### VND" value="${l.price*1.3}"/></del>
                                            <br>
                                            <span style="font-size: 22px;color: red;font-weight:650;" class="mb-3 price"><fmt:formatNumber pattern="##,###,### VND" value="${l.price}"/></span>
                                            <a href="details?fid=${l.fruitId}" class="text-reset">
                                                <input type="button" class="btn btn-success" value="Add to cart" />
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>


            </div>
        </main>
        <!--Main layout-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
