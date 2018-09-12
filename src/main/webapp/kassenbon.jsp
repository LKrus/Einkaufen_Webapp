<html>
<head>
<%@ page import="java.util.ArrayList, java.util.Arrays"%>

<title>Kasse</title>
</head>
<body>

<h3>Kassenbon:</h3>

<%
String artikelstring = (String) session.getAttribute("artikelstring");
String [] artikel = artikelstring.split(",");

ArrayList<Double> gesamtpreisliste =(ArrayList<Double>) request.getAttribute("gesamtpreisliste");
ArrayList<Double> preisliste =(ArrayList<Double>) request.getAttribute("preisliste");
String[] menge = request.getParameterValues("i");
double summe = (Double) request.getAttribute("summe");

for(int i=0; i<preisliste.size();i++){
  out.println(artikel[i]+"      ");
  out.print(gesamtpreisliste.get(i)+"&#8364;");
  %>
  </br>
  <%
  out.println(menge[i]+" * "+preisliste.get(i)+"&#8364;");
%>
</br>
<%
}
out.println("Summe: "+summe+"&#8364;");
%>
<form action="einkaufen?action=kasse"method="POST"/>
</body>
</html>