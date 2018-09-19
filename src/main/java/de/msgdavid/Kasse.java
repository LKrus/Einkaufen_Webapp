package de.msgdavid;

import org.apache.log4j.Logger;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;

public class Kasse {
    private final static Logger log = Logger.getLogger(Kasse.class);

    public static ArrayList<Double> getGesamtPreise(String selectedArtikel, String[] selectedMenge) {
        DecimalFormat df2 = new DecimalFormat("0.00");
        ArrayList<Double> gesamtPreisListe = new ArrayList<>();
        ArrayList<Artikel> artikelliste = Auswahl.getArrayListAusArtikeln();

        log.info(selectedArtikel + " " + Arrays.toString(selectedMenge));

        String[] artikelarray = selectedArtikel.split(",");
        log.info("artikelarray:" + Arrays.toString(artikelarray));

        double preis;

        for (int m = 0; m < artikelarray.length; m++) {
            for (Artikel artikel : artikelliste) {
                log.info("M: " + m);
                if (artikelarray[m].equals(artikel.getName())) {

                    preis = artikel.getPreis() * Double.valueOf(selectedMenge[m]);
                    preis = (double) Math.round((preis * 100)) / 100;

                    gesamtPreisListe.add(preis);
                }
            }
        }
        log.info("gesamtpreis: " + gesamtPreisListe);
        return gesamtPreisListe;
    }
}