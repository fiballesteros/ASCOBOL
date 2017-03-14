      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BESTSELLERS01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CountryFile  ASSIGN TO "BOOKSALES.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT GraduateInfoFile ASSIGN TO "BOOKMF.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT WorkFile ASSIGN TO "WORK.TMP".

           SELECT ReportFile ASSIGN TO "BSLIST.RPT"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       END PROGRAM BESTSELLERS01.
