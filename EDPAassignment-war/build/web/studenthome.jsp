<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Menu Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            Student Home Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
            <script type="text/javascript">
                function OnSubmitForm()
                {
                    if (document.pressed == "Edit Profile")
                    {
                        document.myform.action = "updatestaff.jsp"
                    } else
                    if (document.pressed == 'Book Auditorium')
                    {
                        document.myform.action = "bookaudi.jsp"
                    } else
                    if (document.pressed == 'View Reservation')
                    {
                        document.myform.action = "ViewBook"
                    }
                    return true;
                }
            </script>
            <form name="myform" onsubmit="return OnSubmitForm();">
                <input type="submit" name="button" onclick="document.pressed = this.value" value="Edit Profile">
                <input type="submit" name="button" onclick="document.pressed = this.value" value="Book Auditorium">
                <input type="submit" name="button" onclick="document.pressed = this.value" value="View Reservation">
            </form>
        </div>
    </body>
</html>
