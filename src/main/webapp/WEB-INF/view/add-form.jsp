<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">

    <!-- FontAwesome -->
    <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- Date Picker -->
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>

    <!-- Global JS -->
    <script src="${pageContext.request.contextPath}/resources/js/global.js"></script>

    <title>Lista kontaktów - Dodaj</title>
</head>


<body>

<div class="container-fluid bg">
    <div class="row">
        <div class="col-md-1 col-sm-1 col-xs-12"></div>
        <div class="col-md-10 col-sm-10 col-xs-12">
            <div class="form-orders-container">
                <div class="center">
                    <img src="../resources/img/sdm-logo.png">
                    <h1>Lista kontaktów</h1>
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
                                Zalogowany jako: <strong><security:authentication
                                    property="principal.username"/></strong>
                                <br/> Uprawnienia: <strong><security:authentication
                                    property="principal.authorities"/></strong>
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

                <!-- SAVE NEW USER -->
                <form:form action="saveUser" modelAttribute="user" method="POST">

                    <!-- Check for registration error -->
                    <c:if test="${registrationError != null}">
                        <!-- Error message -->
                        <div class="alert alert-danger col-xs-offset-1 col-xs-10 center">
                                ${registrationError}
                        </div>
                    </c:if>

                    <br/>

                    <div class="row">
                        <div class="col-lg-2 col-sm-2 col-12">
                            <label>Status:</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputGroupSelectEnabled"><i
                                            class="fas fa-lock-open"></i></label>
                                </div>
                                <form:select path="enabled" class="form-control form-control-sm"
                                             id="inputGroupSelectEnabled">
                                    <form:option value="1">Aktywny</form:option>
                                    <form:option value="0">Nieaktywny</form:option>
                                </form:select>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-2 col-12">
                            <label>Nazwa użytkownika:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="far fa-user"></i></span>
                                </div>
                                <form:input path="username" type="text" class="form-control" id="username"
                                            required="required"/>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-3 col-12">
                            <label>Hasło:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <form:input path="password" type="text" class="form-control" required="required"
                                            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                            title="Hasło musi zawierać przynajmniej jedną liczbę, jedną dużą i małą literę, oraz przynajmniej 8 znaków."
                                            id="password" name="password"/>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-3 col-12">
                            <label>Email:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-at"></i></span>
                                </div>
                                <form:input path="email" type="text" class="form-control" required="required"/>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-2 col-12">
                            <label>Czynność:</label>
                            <input type="submit" class="btn btn-primary btn-sm btn-block" value="Zapisz"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-2 col-sm-2 col-12">
                            <label>Imię:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="far fa-user"></i></span>
                                </div>
                                <form:input path="firstName" type="text" class="form-control" required="required"/>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-2 col-12">
                            <label>Nazwisko:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="far fa-user"></i></span>
                                </div>
                                <form:input path="lastName" type="text" class="form-control" required="required"/>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-2 col-12">
                            <label>Data urodzenia:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                </div>
                                <form:input path="bornDate" data-provide="datepicker" data-date-language="pl"
                                            data-date-autoclose="true" data-date-today-highlight="true"
                                            data-date-format="dd-mm-yyyy" type="text" ng-model="order.date"
                                            class="form-control" placeholder="DD-MM-RRRR" required="required"/>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-2 col-12">
                            <label>Telefon:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                </div>
                                <form:input path="phone" type="text" class="form-control" required="required"/>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-2 col-12">
                            <label>Kategoria:</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputGroupSelect01"><i
                                            class="fab fa-get-pocket"></i></label>
                                </div>
                                <form:select path="category" class="form-control form-control-sm"
                                             id="inputGroupSelect01" onclick="showSubcategory()" required="required">
                                    <form:option value="służbowy">służbowy</form:option>
                                    <form:option value="prywatny">prywatny</form:option>
                                    <form:option value="inny">inny</form:option>
                                </form:select>
                            </div>
                        </div>
                        <div id="subcategory_other" class="col-lg-2 col-sm-2 col-12">
                            <label>Podkategoria:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="far fa-caret-square-down"></i></span>
                                </div>
                                <form:input path="subcategory" type="text" class="form-control" id="subcategory"/>
                            </div>
                        </div>
                        <div id="subcategory_dictionary" class="col-lg-2 col-sm-2 col-12">
                            <label>Podkategoria:</label>
                            <div class="input-group input-group-sm mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="far fa-caret-square-down"></i></span>
                                </div>
                                <form:select path="subcategory" class="form-control">
                                    <form:option value="" label="- wybierz -" />
                                    <form:options items="${dictionary}" itemValue="word" itemLabel="word" />
                                </form:select>
                            </div>
                        </div>
                    </div>

                    <!-- Authority -->
                    <form:form modelAttribute="authority">
                        <div class="row">
                            <div class="col-lg-2 col-sm-2 col-12">
                                <label>Ranga:</label>
                                <div class="input-group input-group-sm mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="far fa-caret-square-down"></i></span>
                                    </div>
                                    <form:input path="authority" type="text" class="form-control" value="ROLE_USER"
                                                required="required"/>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </form:form>

                <!-- Footer -->
                <div class="text-align: center">
                    <label class="label-bottom">Copyright &copy; 2018 by Jarosław Kowalczyk</label>
                </div>

            </div>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
    </div>
</div>

<!-- Auto fill -->
<script type="text/javascript">

    window.onload = function() {
        document.getElementById("subcategory_other").style.display = "none";
    };

    function showSubcategory() {

        var category = document.getElementById('inputGroupSelect01').value;

        if (category === "prywatny") {
            document.getElementById("subcategory").placeholder = " ";
            document.getElementById("subcategory_dictionary").style.display = "none";
            document.getElementById("subcategory_other").style.display = "none";
        } else if (category === "służbowy") {
            document.getElementById("subcategory_dictionary").style.display = "block";
            document.getElementById("subcategory_other").style.display = "none";
        } else if (category === "inny") {
            document.getElementById("subcategory_dictionary").style.display = "none";
            document.getElementById("subcategory_other").style.display = "block";
            document.getElementById("subcategory").placeholder = "wpisz";
        }
    }
</script>

<!-- DatePicker -->
<script type="text/javascript">
    $('.datepicker').datepicker();
</script>
</body>
</html>