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
           SELECT BookMasterFile  ASSIGN TO "BOOKSALES.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT BookSalesFile ASSIGN TO "BOOKMF.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT WorkFile ASSIGN TO "WORK.TMP".

           SELECT ReportFile ASSIGN TO "BSLIST.RPT"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD BookMasterFile.
       01  BMF-Record.
           02 BMF-BookNum        PIC X(5).
           02 BMF-BookTitle      PIC X(25).
           02 BMF-AuthorName     PIC X(25).

       FD  BookSalesFile.
       01  BSF-Record.
       88 EndOfBSF VALUE HIGH-VALUES.
               02 BSF-BookNum        PIC X(5).
               02 BSF-Copies         PIC 99.
               02 BSF-SaleStatus     PIC X.
       88    NormalSale VALUE "N".


       SD WorkFile.
           01  WorkRec.
           88 EndOfWorkFile VALUE HIGH-VALUES.
               02 W-BookNum          PIC X(5).
               02 W-Copies           PIC 99.
               02 FILLER             PIC X.

       FD ReportFile.
           01  PrintLine             PIC X(75).



       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       END PROGRAM BESTSELLERS01.
