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
    <title>Lista kontaktów</title>
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
                        <security:authorize access="hasAnyRole('EMPLOYEE')">
                        <div class="mt-2">
                            Zalogowany jako: <strong><security:authentication property="principal.username"/></strong>
                            <br/> Uprawnienia: <strong><security:authentication property="principal.authorities"/></strong>
                        </div>
                        </security:authorize>
                    </div>
                    <div class="col-md-1 col-sm-1 col-xs-12 text-right bg-light">
                        <!-- Add logout button -->
                        <security:authorize access="hasAnyRole('EMPLOYEE')">
                        <div class="mt-3">
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Wyloguj" class="btn btn-secondary btn-block btn-sm"/>
                            </form:form>
                        </div>
                        </security:authorize>
                    </div>
                </div>

                <br/>

                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                    </div>
                    <div class="col-md-5 col-sm-5 col-xs-12">
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-12">
                    </div>

                    <!-- BUTTON add Contact -->
                    <security:authorize access="hasAnyRole('EMPLOYEE')">
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <div class="form-group">
                            <input type="button" value="Dodaj kontakt" class="btn btn-primary btn-block btn-sm"
                                   onclick="window.location.href='showFormForAdd'; return false;"/>
                        </div>
                    </div>
                    </security:authorize>

                </div>

                <!--  HTML TABLE -->

                <div class="table-responsive center">
                    <table class="table table-hover table-sm table-striped text-center min">
                        <thead class="table-secondary">
                        <tr>
                            <th scope="col">Nazwa użytkownika</th>
                            <th scope="col">Imię</th>
                            <th scope="col">Nazwisko</th>
                            <th scope="col">Email</th>
                            <th scope="col">Szczegóły</th>
                            <security:authorize access="hasAnyRole('EMPLOYEE')">
                            <th colspan="2" scope="col">Czynność</th>
                            </security:authorize>
                        </tr>
                        </thead>
                        <tbody>

                        <!-- loop over and print contacts -->
                        <c:forEach var="tempUser" items="${users}">

                            <!-- "details" link with customer id -->
                            <c:url var="detailsLink" value="/user/showFormDetails">
                                <c:param name="userId" value="${tempUser.userName}"/>
                            </c:url>

                            <!-- "update" link with customer id -->
                            <c:url var="updateLink" value="/user/showFormForUpdate">
                                <c:param name="userId" value="${tempUser.userName}"/>
                            </c:url>

                            <!-- "delete" link with customer id -->
                            <c:url var="deleteLink" value="/user/delete">
                                <c:param name="userId" value="${tempUser.userName}"/>
                            </c:url>

                            <tr>
                                <td>${tempUser.userName}</td>
                                <td>${tempUser.firstName}</td>
                                <td>${tempUser.lastName}</td>
                                <td>${tempUser.email}</td>

                                <td><a href="${detailsLink}"><i class="fas fa-info-circle ml-2 mr-2" style="color: green"></i></a>
                                </td>

                                <security:authorize access="hasAnyRole('EMPLOYEE')">
                                <td><a href="${updateLink}"><i class="fas fa-edit ml-2 mr-2" style="color: orange"></i></a>
                                </td>
                                <td><a href="${deleteLink}"
                                       onClick="if (!(confirm('Czy na pewno chcesz usunąć kontakt?'))) return false"><i
                                        class="fas fa-trash-alt ml-2 mr-2" style="color: red"></i></a>
                                </td>
                                </security:authorize>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>




                <!-- Footer -->
                <div class="text-align: center">
                    <label class="label-bottom">Copyright &copy; 2018 by Jarosław Kowalczyk</label>
                </div>

            </div>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
    </div>
</div>


</body>
</html>