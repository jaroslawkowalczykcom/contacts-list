<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link type="text/css" rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <title>Lista kontaktów - Logowanie</title>
</head>
<body>

<div class="container-fluid bg">
    <div class="row">
        <div class="col-md-4 col-sm-4 col-xs-12"></div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="form-container">
                <div class="center">
                    <img src="${pageContext.request.contextPath}/resources/img/sdm-logo.png">
                    <h1>Lista kontaktów</h1>
                </div>

                <div style="padding-top: 30px" class="panel-body">
                    <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">

                        <!-- Check for login error -->
                        <c:if test="${param.error != null}">
                            <div class="alert alert-danger col-xs-offset-1 col-xs-10 center">
                                Niepoprawna nazwa użytkownika lub hasło!
                            </div>
                        </c:if>

                        <!-- Check for logout -->
                        <c:if test="${param.logout != null}">
                            <div class="alert alert-success col-xs-offset-1 col-xs-10 center">
                                Zostałeś wylogowany.
                            </div>
                        </c:if>


                        <!-- USER NAME -->
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i
                                        class="far fa-user fa-xs"></i></span>
                            </div>
                            <input type="text" name="username" required="required" class="form-control"
                                   placeholder="Nazwa użytkownika" aria-label="Nazwa użytkownika" aria-describedby="basic-addon1">
                        </div>

                        <!-- PASSWORD -->
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key fa-xs"></i></span>
                            </div>
                            <input type="password" name="password" required="required" class="form-control"
                                   placeholder="Hasło" aria-label="Hasło" aria-describedby="basic-addon1">
                        </div>


                        <!-- LOGIN BUTTON -->
                        <div class="form-group center">
                            <div class="col-sm-12 controls center">
                                <button type="submit" class="btn btn-primary">Zaloguj</button>
                            </div>
                        </div>

                        <!-- HOME PAGE BUTTON -->
                        <div class="form-group center">
                            <div class="col-sm-12 controls center">
                                <a href="${pageContext.request.contextPath}/user/list"><button class="btn btn-light">Strona główna</button></a>
                            </div>
                        </div>
                    </form:form>
                </div>


                <!-- Footer -->
                <div class="text-align: center">
                    <label class="label-bottom">Copyright &copy; 2018 by Jarosław Kowalczyk</label>
                </div>
            </div>

        </div>
        <div class="col-md-4 col-sm-4 col-xs-12"></div>
    </div>
</div>


</body>

</html>