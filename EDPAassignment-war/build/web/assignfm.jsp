<%@page import="model.Auditorium"%>
<%@page import="model.AuditoriumFacade"%>
<%@page import="java.util.List"%>
<%@page import="model.Users"%>
<%@page import="model.UsersFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%!
    Context ct;
    Context ct2;
    UsersFacade UsersFacade;
    AuditoriumFacade AuditoriumFacade;
%>
<%
    ct = new InitialContext();
    UsersFacade = (UsersFacade) ct.lookup("java:global/EDPAassignment/EDPAassignment-ejb/UsersFacade");
    ct2 = new InitialContext();
    AuditoriumFacade = (AuditoriumFacade) ct.lookup("java:global/EDPAassignment/EDPAassignment-ejb/AuditoriumFacade");
%>

<script>
    function showFM()
    {
        var name = document.getElementById("name").value;
        document.getElementById("selectedName").innerHTML = name;
    }
</script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign FM Page</title>
    </head>
    <body>
         <h1 style="text-align: center">
            Assign FM Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
            <form action="AssignFm" method="POST">
                <table>
                    <tr>
                        <td>Select FM:</td>
                        <td>

                            <select name="name">
                                <%
                                    List<Users> rm = UsersFacade.findAll();
                                    for (Users j : rm) {
                                        if (j.getRole() == 3) {
                                %>
                                <option value="<%=j.getName()%>"><%=j.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>           
                        </td> </tr>
                    <tr>
                        <td>Select Auditorium:</td>
                        <td>

                            <select name="audi">
                                <%
                                    List<Auditorium> am = AuditoriumFacade.findAll();
                                    for (Auditorium x : am) {
                                        if (x.getStat().equals("Approved")) {
                                %>
                                <option value="<%=x.getId()%>"><%=x.getId()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>           
                        </td> </tr>
                </table>
                <p>
                    <input type="submit" value="Assign" onclick="showFM();">
                </p>
            </form>
        </div>
    </body>
</html>
