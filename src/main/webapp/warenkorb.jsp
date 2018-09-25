<%@ page import="de.msgdavid.Artikel" %>
<%@ page import="java.util.ArrayList" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <meta charset="UTF-8"/>
    <title>Warenkorb</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<div class="background-body">
<body>

<h2>Warenkorb:</h2>
<%
    String artikelstring = "";
%>
<form action="zukassenbon" method="POST">
    <div class="box-2">
        <%
            ArrayList<Artikel> list = (ArrayList<Artikel>) request.getAttribute("list");
            String[] selectedArtikel = request.getParameterValues("artikel");

            if (selectedArtikel != null) {
                for (int i = 0; i < selectedArtikel.length; i++) {
                    for (Artikel artikel : list) {
                        if (selectedArtikel[i].equals(artikel.getName())) {
                            out.println(selectedArtikel[i] + ", " + artikel.getPreis()+"&#8364;");
                            artikelstring += selectedArtikel[i] + ",";
        %>
        <br>
        <input type="number" class="number" name="i" value="0" min="0"/>
        <br>
        <br>
        <%
                        }
                    }
                }
            } else {
                out.println("Sie haben nichts gew&auml;hlt.");
            }
            session.setAttribute("artikelstring", artikelstring);
        %>
    </div>
    <%
        if (selectedArtikel != null) {
    %>
    <input type="submit" value="Bezahlen" name="submit" onclick="" class="button"/>
    <%
        }
    %>

</form>
<br>
<form action="einkaufen" method="POST">
    <input type="submit" value="Warenkorb &auml;ndern" name="submit" onclick="" class="button"/>
</form>
<footer>
    Footer
</footer>
</body>
</div>
</html>