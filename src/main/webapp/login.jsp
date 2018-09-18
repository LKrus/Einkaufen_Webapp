<?xml version="1.0" encoding="ISO-8859-1" ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <meta charset="UTF-8"/>
    <title>Login</title>
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<h2>Anmeldung:</h2>
<br/>
<form action="einkaufen?action=anmelden" method="POST">
<div class="box-2">
    <label>Username</label>
    <input type="text" name="j_username"/>
    <br/>
    <label>Password: </label>
    <input type="password" name="j_password"/>

</div>

    <input type="submit" value="Anmelden" class="button"/>
</form>
<form action="einkaufen?action=home" method="POST">
    <input type="submit" value="Zur&uuml;ck zur Artikelauswahl" class="button"/>
</form>
<%
    String error=request.getParameter("error");
    if (error!=null){
        out.println("Fehler: "+error);
    }
%>
<footer>
    Footer
</footer>
</body>
</html>