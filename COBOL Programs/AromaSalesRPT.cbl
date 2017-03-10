      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AROMASALESRPT01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SalesFile ASSIGN TO "Sales.dat"
                 ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SummaryReport ASSIGN TO "AromaSales.rpt"
                 ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SortFile ASSIGN TO "SortSale.dat"
                 ORGANIZATION IS LINE SEQUENTIAL.
           SELECT WorkFile ASSIGN TO "SORT.TMP".
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       END-PROGRAM.
