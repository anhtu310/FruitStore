<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>AT-Fruit</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-2">
                            <a class="nav-link me-3" href="home">
                                <span style="color: white; font-size: 24px;margin-left: 20px" class="home-button">Home</span>
                            </a>
                        </div>
                        <div class="col-sm-3">
                            <h2><b>Manage Product</b></h2>
                        </div>
                        <div class="col-sm-3">
                            <a style="margin-right: 40px" href="#addEmployeeModal" class="btn btn-primary" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                        </div>
                        <div class="col-sm-4">
                            <a style="width: 20%" href="manager" class="btn btn-primary"><i class="material-icons"></i>All</a>
                            <form action="search1" method="post" class="form-inline" style="max-width: 20rem">
                                <div>
                                    <input style="width: 80%" name="text" type="search" class="form-control rounded-0" placeholder="Search" aria-label="Search">
                                    <button type="submit" class="btn btn-primary" style="border: none;width:20%">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listF}" var="f">
                            <tr>
                                <td>${f.fruitId}</td>
                                <td>${f.fruitName}</td>
                                <td>
                                    <img src="${f.image}">
                                </td>
                                <td>${f.category.categoryName}</td>
                                <td><fmt:formatNumber pattern="##,###,### VND" value="${f.price}" /></td>
                                <td>
                                    <a href="load?fid=${f.fruitId}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="delete?fid=${f.fruitId}" class="delete" data-toggle="modal" onclick="return confirm('Are you sure you want to delete this product?') && showAlert();"> <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i> </a> <script> function showAlert() {
                                            alert("Product deleted successfully!");
                                            return true;
                                        }</script>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>

                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                                <c:if test="${not empty mess}">
                                    <script>
                                        alert("${mess}");
                                    </script>
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" ></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="lc">
                                        <option value="${lc.categoryId}">${lc.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>

        </script>
    </body>
</html>