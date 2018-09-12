package de.msgdavid;

import org.apache.log4j.Logger;
import java.text.DecimalFormat;
import java.util.ArrayList;

public class Rechnungen {
    private final static Logger log = Logger.getLogger(Rechnungen.class);

    public static double getSumme(ArrayList<Double> gesamtPreisListe) {
        DecimalFormat df2 = new DecimalFormat("0.00");

        double summe = 0;
        for (int i = 0; i < gesamtPreisListe.size(); i++) {
            summe += gesamtPreisListe.get(i);
        }
        log.info("summe: " + summe);
        summe = (double) Math.round((summe * 100)) / 100;
        return summe;
    }


    public static ArrayList<Double> getPreisListe(String selectedArtikel) {
        ArrayList<Double> preisliste = new ArrayList<>();
        ArrayList<Artikel> artikelliste = Auswahl.getArrayListAusArtikeln();

        String[] artikelarray = selectedArtikel.split(",");

        double preis;

        for (int m = 0; m < artikelarray.length; m++) {
            for (Artikel artikel : artikelliste) {

                if (artikelarray[m].equals(artikel.getName())) {
                    preis = artikel.getPreis();
                    preisliste.add(preis);
                }
            }
        }
        return preisliste;
    }

    //methode gesamtpreise neu mit rabatt
    public static void gesamtPreiseNeu() {

    }

//methode array mit den rabatt differenzen
}