package nosi.core.webapp.helpers;

import jakarta.servlet.http.Part;
import nosi.core.webapp.import_export.FileImportAppOrPage;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * @author: Emanuel Pereira
 * 31 Oct 2017
 */
public class ZipUnzipFile {


   // Extract files jar format
   public static List<FileImportAppOrPage> getZipFiles(Part file) {
      List<FileImportAppOrPage> contents = null;
      try {
         contents = new ArrayList<>();
         CheckedInputStream cis = new CheckedInputStream(file.getInputStream(), new Adler32());
         ZipInputStream zis = new ZipInputStream(new BufferedInputStream(cis));
         ZipEntry entry = null;
         while ((entry = zis.getNextEntry()) != null) {
            int order = 3;
            Charset encode = StandardCharsets.UTF_8;
            if (entry.getName().endsWith(".xml") || entry.getName().endsWith(".json") || entry.getName().endsWith(".xsl")) {
               order = 4;
            }
            if (entry.getName().startsWith("SQL/CONFIG") && entry.getName().endsWith("_ENV.xml")) {
               order = 1;
               encode = StandardCharsets.ISO_8859_1;
            }
            if (entry.getName().startsWith("SQL/CONFIG") && entry.getName().endsWith("_ACTION.xml")) {
               order = 2;
               encode = StandardCharsets.ISO_8859_1;
            }
            String ls = System.lineSeparator();
            String line = null;
            DataInputStream in = new DataInputStream(zis);
            StringBuilder content = new StringBuilder();
            BufferedReader d = new BufferedReader(new InputStreamReader(in, encode));
            while ((line = d.readLine()) != null) {
               content.append(line);
               content.append(ls);
            }

            FileImportAppOrPage f = new FileImportAppOrPage(entry.getName(), content.toString(), order);
            contents.add(f);
            zis.closeEntry();
         }
         zis.close();
      } catch (IOException e) {
         e.printStackTrace();
      }
      Collections.sort(contents);
      return contents;
   }
}
