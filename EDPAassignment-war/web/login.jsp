<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        </p>
        <h1 style="text-align: center">
            APU Auditorium Reservation System (ARS)
        </h1>
        <div align="center">
        <form action="Login" method="POST">
            <table>
                <tr>
                    <td>Username: </td>
                    <td><input type="text" name="id" size="20"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="pass" size="20"></td>
                </tr>
            </table>
            <td>
                Role:
                <select id="dropbox" name="role">
                    <option value="" disabled="disabled" selected="selected">Select New User Role</option>
                    <option value="1">Chief Operating Officer (COO)</option>
                    <option value="2">Reservation Staff</option>
                    <option value="3">Facility Management Staff</option>
                    <option value="4">Students</option>
                </select>
            </td>
            <p>
                <input type="submit" value="Confirm">
            </p>
        </div>
        </form>
    </body>
</html>
