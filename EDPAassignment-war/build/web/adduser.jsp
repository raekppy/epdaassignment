<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            New User Registration Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
            <form action="AddUser" method="POST">
                <table>
                    <tr>
                        <td>
                            Name:
                        </td> 
                        <td>
                            <input type="text" name="name" size="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender (eg.M/F): 
                        </td> 
                        <td>
                            <input type="text" name="gender" size="20" maxlength="1">
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            Username:
                        </td> 
                        <td>
                            <input type="text" name="id" size="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td> 
                        <td>
                            <input type="text" name="pass" size="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email:
                        </td> 
                        <td>
                            <input type="text" name="mail" size="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Handphone Number:
                        </td> 
                        <td>
                            <input type="text" name="number" size="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Home Address:
                        </td> 
                        <td>
                            <input type="text" name="address" size="20">

                        </td>
                    </tr>
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
                </table>
                <p>
                    <input type="submit" value="Confirm Registration">
                </p>
        </div>
    </form>
</body>
</html>