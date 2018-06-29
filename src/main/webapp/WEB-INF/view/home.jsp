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

	<!-- display user name and role -->
	
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
	</p>



    <!--  HTML TABLE -->

    <div class="table-responsive center">
        <table class="table table-hover table-sm table-striped text-center min">
            <thead class="table-secondary">
            <tr>
                <th scope="col">Username</th>
                <th scope="col">Password</th>
                <th scope="col">Enabled</th>
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
                <c:url var="detailsLink" value="/customer/showFormDetails">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <!-- "update" link with customer id -->
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <!-- "delete" link with customer id -->
                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <tr>
                    <td>${tempUser.username}</td>
                    <td>${tempUser.password}</td>
                    <td>${tempUser.enabled}</td>

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
	


	
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Logout" />
	
	</form:form>
	
</body>

</html>









