package de.msgdavid;

import org.apache.log4j.Logger;

import java.io.*;
import java.util.ArrayList;

public class Util {
    private final static Logger log = Logger.getLogger(Util.class);


    public static void artikelUeberschreiben(String[] markierteArtikel) {
        try {
            ArrayList<Artikel> artikelliste = Auswahl.getArrayListAusArtikeln();
            String markierteArtikels = "";

            for (int i = 0; i < markierteArtikel.length; i++) {
                for (Artikel artikel : artikelliste) {
                    if (markierteArtikel[i].equals(artikel.getName())) {
                        markierteArtikels = markierteArtikels + markierteArtikel[i] + "," + artikel.getPreis() + ";";
                    }
                }
            }
            log.info("markierte artikel als string: " + markierteArtikels);

            FileWriter fr = new FileWriter("C:\\Mein_Praktikum_Leonie\\Projekte\\Einkaufen\\files\\e.csv", false);

            fr.write(markierteArtikels);
            fr.close();

        } catch (IOException e) {
            log.info("file Writer exception");
        }
    }

    public static void artikelHinzufuegen(String neuerArtikelName, String euro, String cent) {
        String neuerArtikel = "";

            neuerArtikel = neuerArtikelName + "," + euro + "." + cent + ";";

        log.info("neuer Artikel String: " + neuerArtikel);

        try {
            FileWriter fr = new FileWriter("C:\\Mein_Praktikum_Leonie\\Projekte\\Einkaufen\\files\\e.csv", true);
            fr.append(neuerArtikel);
            fr.close();

        } catch (IOException e) {
            log.info("file Writer exception");
        }
    }

    public static boolean eingabeUeberpruefen(String eingabe) {
        String buchstaben = "abcdefghijklmnopqrstuvwxyz";
        String zeichen = "0123456789!§$%&/()=?`´^°<>|.:-_+#*'~{[]} ";
        int zaehler = 0;
        char[] eingabenarray = eingabe.toCharArray();
        boolean eingabekorrekt = false;


        for (int i = 0; i < eingabe.length(); i++) {

            if (buchstaben.contains(String.valueOf(eingabenarray[i])) || buchstaben.toUpperCase().contains(String.valueOf(eingabenarray[i])) || zeichen.contains(String.valueOf(eingabenarray[i]))) {
                zaehler++;
            }
        }

        if (zaehler == eingabe.length()) {
            eingabekorrekt = true;
        }
        return eingabekorrekt;
    }
}