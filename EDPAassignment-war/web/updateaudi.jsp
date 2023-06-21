<%@page import="model.Auditorium"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Auditorium Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            Update Auditorium Page
        </h1>
        <div align="center">
            <p>
                <jsp:include page="link.jsp"/>
            </p>
            <form action="UpdateAudi" method="POST">
                <%
                    HttpSession hs = request.getSession(false);
                    Auditorium j = (Auditorium) hs.getAttribute("audi");
                %>
                <table>
                    <tr>
                        <td>Auditorium ID: </td>
                        <td><input type="text" name="id" disabled="disabled" size="20" value="<%=j.getId()%>"></td>
                    </tr>
                    <tr>
                        <td>New Auditorium Name: </td>
                        <td><input type="text" name="Aname" size="20" value="<%=j.getAname()%>"></td>
                    </tr>

                    <tr>
                        <td>New Auditorium Location: </td>
                        <td><input type="text" name="Loc" size="20" value="<%=j.getLoc()%>"></td>  
                    </tr>
                    <tr>
                        <td>New Capacity: </td>
                        <td><input type="text" name="cap" size="20" value="<%=j.getCap()%>"></td>
                    </tr>
                    <tr>
                        <td>
                            New Status:
                        </td> 
                        <td>
                            <input type="text" disabled="disabled" name="stat" size="20" value="<%=j.getStat()%>">
                        </td>
                        <tr>
                        <td>
                            New FM:
                        </td> 
                        <td>
                            <input type="text" disabled="disabled" name="fm" size="20" value="<%=j.getFM()%>">
                        </td>
                </table>
                <p>
                    <input type="submit" value="Update">
                </p>

            </form>
        </div>
    </body>
</html>
