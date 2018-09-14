<?xml version="1.0" encoding="ISO-8859-1" ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <meta charset="UTF-8"/>
    <title>Warenkorb</title>
</head>
<body>
<header>
    Header
    <ul>
        <li><a href="#home.jsp">Home</a></li>
        <li><a href="#warenkorb.jsp">Warenkorb</a></li>
        <li><a href="#kassenbon.jsp">Kasse</a></li>
    </ul>
</header>
<h2>Warenkorb:</h2>
<%
    String artikelstring = "";
%>
<form action="einkaufen?action=warenkorb" method="POST">
    <div class="box-2">
        <%
            String[] selectedArtikel = request.getParameterValues("artikel");

            if (selectedArtikel != null) {
                for (int i = 0; i < selectedArtikel.length; i++) {
                    out.println(" " + selectedArtikel[i]);
                    artikelstring += selectedArtikel[i] + ",";
        %>
        <br>
        <input type="number" name="i" value="0" min="0"/>
        <br>
        <br>
        <%
                }
            } else {
                out.println("nichts gew&auml;hlt");
            }
            session.setAttribute("artikelstring", artikelstring);
        %>
    </div>
    <%
        if(selectedArtikel!=null){
            %>
    <input type="submit" value="Zur Kasse" name="submit" onclick="" class="button"/>
    <%
        }
    %>

</form>
<br>
<form action="einkaufen?action=home" method="POST">
    <input type="submit" value="Warenkorb &auml;ndern" name="submit" onclick="" class="button"/>
</form>
<footer>
    Footer
</footer>
</body>
</html>