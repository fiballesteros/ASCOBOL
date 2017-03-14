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
       01  FirstHeading.
       02 FILLER             PIC X(20) VALUE SPACES.
       02 FILLER             PIC X(40)
       VALUE "The Folio Society Best Seller List".

       01  SecondHeading.
           02 FILLER             PIC X(19) VALUE SPACES.
           02 FILLER             PIC X(33) VALUE ALL "-".

       01  ThirdHeading.
           02 FILLER             PIC X(7)  VALUE "Rank".
           02 FILLER             PIC X(17) VALUE "Book no.".
           02 FILLER             PIC X(26) VALUE "Book Title".
           02 FILLER             PIC X(20) VALUE "Author".
           02 FILLER             PIC X(5)  VALUE "Sales".

       01  BookRankLine.
           02 PrintRank            PIC ZZ9.
           02 FILLER             PIC X VALUE ".".
           02 FILLER             PIC X(4) VALUE SPACES.
           02 PrintBookNumber    PIC 9(5).
           02 PrintBookTitle     PIC BBBX(25).
           02 PrintAuthor        PIC BBX(25).
           02 PrintSales         PIC BBZ,ZZ9.

       01  BookRankTable.
           02 BookDetails OCCURS 11 TIMES.
           03 BookNum         PIC 9(5).
           03 BookTitle       PIC X(25).
           03 AuthorName      PIC X(25).
           03 BookSales       PIC 9(4) VALUE ZEROS.

       01  Rank                         PIC 99.
       01  PreviousBookNumber           PIC X(5).
       01  BookSalesTotal               PIC 9(4).

       PROCEDURE DIVISION.
       BEGIN.
       SORT WorkFile ON ASCENDING KEY W-BookNum
           INPUT PROCEDURE IS SelectBookSales
           OUTPUT PROCEDURE IS PrintBestSellersList.
       STOP RUN.

      * This method is used to present the report in tabular format.
       SelectBookSales.
           OPEN INPUT BookMasterFile
           OPEN OUTPUT ReportFile
               WRITE PrintLine FROM FirstHeading AFTER ADVANCING PAGE.
               WRITE PrintLine FROM SecondHeading AFTER ADVANCING 1 LINE.
               WRITE PrintLine FROM ThirdHeading AFTER ADVANCING 3 LINES.

       RETURN WorkFile
           AT END SET EndOfWorkfile TO TRUE
       END-RETURN

      *The varying condition specifies that only 10 data will be printed
      *in the report
       PERFORM GetBookRankings UNTIL EndOfWorkfile
       PERFORM PrintBookRankings
           VARYING Rank FROM 1 BY 1 UNTIL Rank > 10

       CLOSE ReportFile, BookMasterFile.

       PrintBestSellersList.
       GetBookRankings.
       PrintBookRankings.
       END PROGRAM BESTSELLERS01.
