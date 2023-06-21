<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FMS Home Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            FMS's Menu Page
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
                    if (document.pressed == 'Check Auditorium')
                    {
                        document.myform.action = "readyaudi.jsp"
                    }
                    else
                    if (document.pressed == 'Clean Auditorium')
                    {
                        document.myform.action = "cleanaudi.jsp"
                    }
                    return true;
                }
            </script>
            <form name="myform" onsubmit="return OnSubmitForm();">
                <input type="submit" name="button" onclick="document.pressed = this.value" value="Edit Profile">
                <input type="submit" name="button" onclick="document.pressed = this.value" value="Check Auditorium">
                <input type="submit" name="button" onclick="document.pressed = this.value" value="Clean Auditorium">
            </form>
        </div>
    </body>
</html>
