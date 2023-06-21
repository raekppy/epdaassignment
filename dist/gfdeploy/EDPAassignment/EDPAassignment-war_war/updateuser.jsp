<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify User Profile Page</title>
    </head>
    <body>

        <div align="center">
            <p>
                <jsp:include page="link.jsp"/>
            </p>
            <form action="UpdateUser" method="POST">
                <%
                    HttpSession hs = request.getSession(false);
                    Users j = (Users) hs.getAttribute("user");
                %>
                <table>
                    <tr>
                        <td>Username: </td>
                        <td><input type="text" name="id" disabled="disabled" size="20" value="<%=j.getId()%>"></td>
                    </tr>
                    <tr>
                        <td>New Name: </td>
                        <td><input type="text" name="name" size="20" value="<%=j.getName()%>"></td>
                    </tr>

                    <tr>
                        <td>New Gender: </td>
                        <td><input type="text" name="gender" size="20" maxlength="1" value="<%=j.getGender()%>"></td>  
                    </tr>
                    <tr>
                        <td>New Password: </td>
                        <td><input type="text" name="pass" size="20" value="<%=j.getPassword()%>"></td>
                    </tr>
                    <tr>
                        <td>New Handphone Number: </td>
                        <td><input type="text" name="number" size="20" value="<%=j.getHpno()%>"></td>  
                    </tr>
                    <tr>
                        <td>New Email: </td>
                        <td><input type="text" name="mail" size="20" value="<%=j.getEmail()%>"></td>
                    </tr>

                    <tr>
                        <td>New Address: </td>
                        <td><input type="text" name="address" size="20" value="<%=j.getAddress()%>"></td>  
                    </tr>
                    <tr>
                        <td>New Role:
                            <select id="dropbox" name="role" value="<%=j.getRole()%>">
                                <option value="" disabled="disabled" selected="selected">Select New User Role</option>
                                <option value="1">Chief Operating Officer (COO)</option>
                                <option value="2">Reservation Staff</option>
                                <option value="3">Facility Management Staff</option>
                                <option value="4">Students</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <p>
                    <input type="submit" value="Update">
                </p>
        </div>
    </form>
</body>
</html>
