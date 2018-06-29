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
    <title>Lista kontaktów - Odmowa dostępu</title>
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

                <br/>
                <div class="alert alert-danger col-xs-offset-1 col-xs-10 center">
                    Nie jesteś uprawniony do przeglądania zawartości tej strony.
                </div>
                <div class="center">
                    <br/>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary center">Powrót do strony głównej</a>
                    <br/>
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