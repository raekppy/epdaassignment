<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auditorium Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            Auditorium Function Page
        </h1>
        <div align="center">
       <p>
            <a href="addaudi.jsp">New Auditorium Registration</a>
            <jsp:include page="link.jsp"/>
        </p>
        <form action="AudiFunction" method="POST">
            <table>
                <tr>
                    <td>Auditorium ID: </td>
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
