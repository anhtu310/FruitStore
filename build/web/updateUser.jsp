<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <body>
        <div class="container">
            <div style="margin-left: 270px;margin-right: 270px" class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6" style="margin-left: 200px">
                            <h2><b>Update User</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="update_user" method="post">
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${details.userId}" name="id" type="text" class="form-control" readonly  required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${details.name}" name="name" type="text" class="form-control" readonly  required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input value="${details.password}" name="pass" type="password" class="form-control"  required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${details.email}" name="email" type="text" class="form-control" readonly  required>
                                </div>
                                <div class="form-group">
                                    <label>Number Phone</label>
                                    <input value="${details.phoneNumber}" name="phone" type="text" class="form-control" pattern="[0-9]{10}" title="Số điện thoại không hợp lệ. Vui lòng nhập 10 chữ số." readonly="" required>
                                </div>
                                <div class="form-group">
                                    <label for="isAdmin">IsAdmin</label>
                                    <select style="width: 15%" class="form-control" id="isAdmin" name="isAdmin">
                                        <option value="1" ${details.isAdmin == 1 ? 'selected' : ''}>Yes</option>
                                        <option value="0" ${details.isAdmin == 0 ? 'selected' : ''}>No</option>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <a href="userlist" class="btn btn-default">Cancel</a>
                                <input type="submit" class="btn btn-success" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/manager.js" type="text/javascript"></script>
</body>
</html>