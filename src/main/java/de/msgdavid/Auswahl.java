package de.msgdavid;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Auswahl {
    public static ArrayList<Artikel> getArrayListAusArtikeln() {
        ArrayList<Artikel> artikellist = new ArrayList<>();

        String csvFile = "C:\\Mein_Praktikum_Leonie\\Projekte\\Einkaufen\\files\\e.csv";
        BufferedReader br = null;
        String line = "";
        String csvSplitBy = ",";

        try {
            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {

                String[] artikel = line.split(csvSplitBy);

                Artikel artikel1 = getArtikel(artikel);

                artikellist.add(artikel1);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return artikellist;
    }

    public static Artikel getArtikel(String[] artikel) {
        return new Artikel(artikel[0], Double.valueOf(artikel[1]));
    }
}


