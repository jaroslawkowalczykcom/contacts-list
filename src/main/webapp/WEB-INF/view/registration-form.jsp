<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <title>Lista kontaktów - Rejestracja</title>
</head>

<body>

<div class="container-fluid bg">
    <div class="row">
        <div class="col-md-1 col-sm-1 col-xs-12"></div>
        <div class="col-md-10 col-sm-10 col-xs-12">

            <div class="form-orders-container">
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-12">

                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12 center">
                        <img src="${pageContext.request.contextPath}/resources/img/sdm-logo.png">
                        <h1>Lista kontaktów</h1>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12 center">

                    </div>
                </div>
                <br />

                <!-- NAVBAR -->
                <div class="row list-inline">
                    <div class="col-md-7 col-sm-7 col-xs-12 text-left  bg-light">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/user/list"><i
                                                class="fas fa-home"></i> Strona Główna</a>
                                    </li>
                                    <li class="nav-item active">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/showMyLoginPage"><i
                                                class="fas fa-sign-in-alt"></i> Logowanie</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>

                    <div class="col-md-4 col-sm-4 col-xs-12 center small bg-light">
                        <!--  Show username and roles -->
                        <security:authorize access="hasAnyRole('USER')">
                            <div class="mt-2">
                                Zalogowany jako: <strong><security:authentication property="principal.username"/></strong>
                                <br/> Uprawnienia: <strong><security:authentication property="principal.authorities"/></strong>
                            </div>
                        </security:authorize>
                    </div>
                    <div class="col-md-1 col-sm-1 col-xs-12 text-right bg-light">
                        <!-- Add logout button -->
                        <security:authorize access="hasAnyRole('USER')">
                            <div class="mt-3">
                                <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                    <input type="submit" value="Wyloguj" class="btn btn-secondary btn-block btn-sm"/>
                                </form:form>
                            </div>
                        </security:authorize>
                    </div>
                </div>

                <br/>

                <!-- Registration form -->
                <form:form action="${pageContext.request.contextPath}/register/processRegistrationForm"
                           modelAttribute="crmUser">

                    <!-- Check for registration error -->
                    <c:if test="${registrationError != null}">
                        <!-- Error message -->
                        <div class="alert alert-danger col-xs-offset-1 col-xs-10 center">
                                ${registrationError}
                        </div>
                    </c:if>

                    <div class="row">
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <!-- User name -->
                            <div class="form-group input-group-sm">
                                <label>Nazwa użytkownika:</label>
                                <form:input path="userName" type="text" class="form-control" name="username"
                                            required="required" placeholder="Wprowadź nazwę użytkownika"/>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <!-- Password -->
                            <div class="form-group input-group-sm">
                                <label>Hasło:</label>
                                <form:input path="password" type="password" class="form-control" name="password"
                                            required="required" placeholder="Wprowadź hasło"/>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group input-group-sm">
                                <label>Imię:</label>
                                <form:input path="firstName" type="text" class="form-control" name="password"
                                            required="required"/>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <!-- Register button -->
                            <div class="form-group">
                                <label>Akcja:</label>
                                <button type="submit" class="btn btn-primary btn-sm btn-block">Rejestruj</button>
                            </div>
                        </div>
                    </div>
                </form:form>

                <!-- Footer -->
                <div class="text-align: center">
                    <label class="label-bottom">Copyright &copy; 2018 by Jarosław Kowalczyk</label>
                </div>

            </div>
        </div>
        <div class="col-md-1 col-sm-1 col-xs-12"></div>
    </div>
</div>


</body>
</html>