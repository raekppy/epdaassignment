<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clean Auditorium Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            Clean Auditorium Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
            <form action="CleanAudi" method="POST">
                <table>
                    <tr>
                        <td>
                            Auditorium ID:
                        </td> 
                        <td>
                            <input type="text" name="id" size="20">
                        </td>
                    </tr>
                </table>
                <p>
                    <input type="submit" value="Cleaned">
                </p>
            </form>
        </div>
    </body>
</html>
