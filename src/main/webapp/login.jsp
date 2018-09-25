<?xml version="1.0" encoding="ISO-8859-1" ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <meta charset="UTF-8"/>
    <title>Login</title>
</head>
<div class="background-body">
    <body>
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <h2>Anmeldung:</h2>
    <br/>
    <form action="zuadmin?action=anmelden" method="POST">
        <div class="box-2">
            <label>Username</label>
            <input type="text" name="j_username"/>
            <br/>
            <label>Password: </label>
            <input type="password" name="j_password"/>
        </div>
        <input type="submit" value="Anmelden" class="button"/>
    </form>
    <form action="einkaufen" method="POST">
        <input type="submit" value="Zur&uuml;ck zur Artikelauswahl" class="button"/>
    </form>

    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
    <div class="box-2">
        <%
            out.println("Fehler: " + error);
        %>
    </div>
    <%
        }
    %>
    <footer>
        Footer
    </footer>
    </body>
</div>
</html>