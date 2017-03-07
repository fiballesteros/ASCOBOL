      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CSISEmailDomain.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT GraduateInfo ASSIGN TO "Gradinfo.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT CountryInfo  ASSIGN TO "CountryCodes.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT SortedFile ASSIGN TO "SortedDomain.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT WorkFile ASSIGN TO "WORK.TMP".

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            STOP RUN.
       END PROGRAM CSISEmailDomain.
