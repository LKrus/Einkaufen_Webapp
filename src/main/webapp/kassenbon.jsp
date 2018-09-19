<html>
<head>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.time.LocalDateTime" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <title>Kasse</title>
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<h2>Kassenbon:</h2>
<div class="box-2">
    Mein Einkauf:
    <br>
    <br>
---
    <%
        LocalDateTime date = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d.L.y - H:m");
        out.println(date.format(formatter));
    %>
---

    <br>
    <br>

    <%
        String artikelstring = (String) session.getAttribute("artikelstring");
        if (artikelstring == null) {
            out.print("Sie haben nichts gekauft.");
        } else {
            String[] artikel = artikelstring.split(",");

            ArrayList<Double> gesamtpreisliste = (ArrayList<Double>) request.getAttribute("gesamtpreisliste");
            ArrayList<Double> preisliste = (ArrayList<Double>) request.getAttribute("preisliste");
            String[] menge = request.getParameterValues("i");
            double summe = (Double) request.getAttribute("summe");

            for (int i = 0; i < preisliste.size(); i++) {
                if (gesamtpreisliste.get(i) > 0) {
                    out.println(artikel[i] + ", ");
                    out.print(gesamtpreisliste.get(i) + "&#8364;");
    %>
    <br>
    <%
        out.println(menge[i] + " * " + preisliste.get(i) + "&#8364;");
    %>
    <br>
    <br>
    <%
                }
            }
            if (summe > 0) {
                out.println("Summe: " + summe + "&#8364;");
            } else {
                out.print("Sie haben nichts gekauft.");
            }
        }
    %>
</div>
<br>
<form action="einkaufen?action=home" method="POST">
    <input type="submit" value="Weiter einkaufen" name="submit" onclick="" class="button"/>
</form>
<footer>
    Footer
</footer>
</body>
</html>