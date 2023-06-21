<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Auditorium Registration Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            New Auditorium Registration Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
            <form action="AddAudi" method="POST">

                <table>
                    <tr>
                        <td>
                            Auditorium Name: 
                        </td> 
                        <td>
                            <input type="text" name="Aname" size="20">
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            Location:
                        </td> 
                        <td>
                            <input type="text" name="Loc" size="20" value="Floor">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Capacity:
                        </td> 
                        <td>
                            <input type="text" name="cap" size="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Status:
                        </td> 
                        <td>
                            <input type="text" disabled="disabled" name="stat" size="20" value="Available">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            FM:
                        </td> 
                        <td>
                            <input type="text" disabled="disabled" name="cap" size="20" value="Empty">
                        </td>
                    </tr>
                </table>
                <p>
                    <input type="submit" value="Confirm Registration">
                </p>
        </div>
    </form>
</body>
</html>
