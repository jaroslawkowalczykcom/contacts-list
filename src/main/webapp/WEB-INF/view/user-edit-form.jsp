<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <title>Lista kontaktów - Edycja</title>
</head>

<body>

<div class="container-fluid bg">
    <div class="row">
        <div class="col-md-0 col-sm-0 col-xs-12"></div>
        <div class="col-md-12 col-sm-12 col-xs-12">

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
                <br/>

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
                                        <a class="nav-link" href="${pageContext.request.contextPath}/order/user-list"><i
                                                class="fas fa-home"></i> Strona Główna</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
                                           role="button"
                                           aria-haspopup="true" aria-expanded="false">
                                            <i class="far fa-calendar-alt"></i> Zlecenia</a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=01">Styczeń</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=02">Luty</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=03">Marzec</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=04">Kwiecień</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=05">Maj</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=06">Czerwiec</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=07">Lipiec</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=08">Sierpień</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=09">Wrzesień</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=10">Październik</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=11">Listopad</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/order/user-list-month?number=12">Grudzień</a>
                                        </div>
                                    </li>

                                    <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
                                               role="button"
                                               aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-users"></i> Pracownicy</a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/register/showRegistrationForm"><i
                                                        class="fas fa-user-plus"></i> Dodaj nowego pracownika</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/employee/admin-users"><i
                                                        class="fas fa-list-ol"></i> Lista pracowników</a>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
                                               role="button"
                                               aria-haspopup="true" aria-expanded="false">
                                                <i class="far fa-file"></i> Raporty</a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=01">Styczeń</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=02">Luty</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=03">Marzec</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=04">Kwiecień</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=05">Maj</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=06">Czerwiec</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=07">Lipiec</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=08">Sierpień</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=09">Wrzesień</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=10">Październik</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=11">Listopad</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list-month?number=12">Grudzień</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/admin-list">Roczny
                                                    2018</a>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
                                               role="button"
                                               aria-haspopup="true" aria-expanded="false">
                                                <i class="far fa-file-excel"></i> Pliki XLS</a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=01">Styczeń
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=02">Luty
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=03">Marzec
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=04">Kwiecień
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=05">Maj
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=06">Czerwiec
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=07">Lipiec
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=08">Sierpień
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=09">Wrzesień
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=10">Październik
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=11">Listopad
                                                    .xls</a>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report-month?number=12">Grudzień
                                                    .xls</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/order/report/?type=xls">Roczny
                                                    2018 .xls</a>
                                            </div>
                                        </li>
                                    </security:authorize>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12 center small bg-light">
                        <!--  Show username and roles -->
                        <div class="mt-2">
                            Zalogowany jako: <strong><security:authentication property="principal.username"/></strong>
                            <br/> Uprawnienia: <strong><security:authentication
                                property="principal.authorities"/></strong>
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-1 col-xs-12 text-right bg-light">
                        <!-- Add logout button -->
                        <div class="mt-3">
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Wyloguj" class="btn btn-danger btn-block btn-sm"/>
                            </form:form>
                        </div>
                    </div>
                </div>

                <br/>


                <!-- Registration form -->
                <form:form action="saveUser" modelAttribute="user" method="POST">

                    <form:hidden path="userName"/>
                    <form:hidden path="password"/>

                    <div class="row">
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <!-- Username -->
                            <div class="form-group input-group-sm">
                                <label>Nazwa użytkownika:</label>
                                <form:input path="userName" type="text" class="form-control" name="username"
                                            required="required" disabled="true"/>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <!-- Password -->
                            <div class="form-group input-group-sm">
                                <label>Hasło:</label>
                                <form:input path="password" type="text" class="form-control" name="password"
                                            required="required" disabled="true"/>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <!-- Enabled -->
                            <div class="form-group input-group-sm">
                                <label>Aktywność:</label>
                                <form:input path="enabled" type="text" class="form-control" name="enabled"
                                            required="required"/>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <!-- Register button -->
                            <div class="form-group">
                                <label>Akcja:</label>
                                <button type="submit" class="btn btn-success btn-sm btn-block">Zapisz</button>
                            </div>
                        </div>
                    </div>
                </form:form>


                <!-- Footer -->
                <div class="text-align: center">
                    <label class="label-bottom">Copyright &copy; 2018 by Jarosław Kowalczyk</label>
                </div>

            </div>
            <div class="col-md-0 col-sm-0 col-xs-12"></div>
            </div>
        </div>
    </div>
</div>


</body>
</html>