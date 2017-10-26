<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
    <title>Postman</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="lib/bootstrap.min.css">
    <script src="lib/jquery-3.2.1.slim.min.js"></script>
    <script src="lib/popper.min.js"></script>
    <script src="lib/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <img src="img/post-bag.jpg" class="rounded mx-auto d-block float-right" alt="heavy post bag :-)">
        <h1>Postman<c:if test="${not empty username}"> ${username}</c:if></h1>
        <p>Postbag Management System</p>
    </div>
    <c:if test="${empty postBag}">
        <form method="POST">
            <div class="form-group row">
                <div class="input-group">
                    <span class="input-group-addon">Name</span>
                    <input type="text" id="username" name="username" class="form-control input-lg"
                           placeholder="Your name">
                </div>
            </div>
            <div class="form-group row">
                <input type="submit" class="btn btn-primary btn-lg btn-block" value="Begin new day">
            </div>
        </form>
    </c:if>
    <c:if test="${not empty postBag}">
        <h2>Letters</h2>
        <div class="list-group">
            <c:forEach var="letter" items="${postBag}">
                <a href="#" class="list-group-item list-group-item-action justify-content-between">
                    <c:out value="${letter.receiver.person}"/>
                    <c:out value=", ${letter.receiver.street}"/>
                    <c:out value="${letter.receiver.houseNumber}/${letter.receiver.flatNumber}"/>
                    <span class="badge badge-default badge-pill">${letter.size}</span>
                </a>
            </c:forEach>
        </div>
        <div class="form-group row">
            <button type="button" class="btn btn-secondary btn-lg btn-block" data-toggle="modal"
                    data-target="#newLetter">
                Add new letter
            </button>
        </div>
        <div class="modal fade" id="newLetter" tabindex="-1" role="dialog" aria-labelledby="newLetterLabel"
             aria-hidden="true">
            <%@include file="leterDetails.jsp" %>
        </div>
    </c:if>
</div>
</body>
</html>