<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            User Function Page
        </h1>        
        <div align="center">
            <p>
                <a href="adduser.jsp">New User Registration</a>
                <jsp:include page="link.jsp"/>
            </p>
            <form action="UserFuction" method="POST">
                <table>
                    <tr>
                        <td>Username: </td>
                        <td><input type="text" name="id" size="20"></td>
                    </tr>
                </table>
                <p>
                    <input type="submit" name="btn" value="Search">
                    <input type="submit" name="btn" value="Modify">
                    <input type="submit" name="btn" value="Delete">
                </p>
        </div>
    </form>
</body>
</html>
