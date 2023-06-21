<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve Auditorium Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            Approve Reservation Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
            <form action="ApproveAudi" method="POST">
                <table>
                    <tr>
                        <td>
                            Booking ID:
                        </td> 
                        <td>
                            <input type="text" name="id" size="20">
                        </td>
                    </tr>
                </table>
                <p>
                    <input type="submit" value="Approve">
                </p>
            </form>
        </div>
    </body>
</html>
