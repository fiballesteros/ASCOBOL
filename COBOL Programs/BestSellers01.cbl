      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  BESTSELLERS01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT BookMasterFile ASSIGN TO "BOOKMF.DAT"
              ORGANIZATION IS LINE SEQUENTIAL.

       SELECT BookSalesFile ASSIGN TO "BOOKSALES.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.

       SELECT WorkFile ASSIGN TO "TEMP.DAT".

       SELECT ReportFile ASSIGN TO "BSLIST.RPT"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  BookMasterFile.
       01  RecordBMF.
           02 BookNumberBMF        PIC X(5).
           02 BookTitleBMF      PIC X(25).
           02 AuthorBMF     PIC X(25).

       FD  BookSalesFile.
       01  RecordBSF.
       88 EndOfBSF VALUE HIGH-VALUES.
           02 BookNumberBSF        PIC X(5).
           02 CopiesBSF            PIC 99.
           02 SaleStatusBSF        PIC X.
       88  NormalSale VALUE "N".

       FD ReportFile.
       01  PrintLine             PIC X(75).


       SD WorkFile.
       01  WorkRec.
       88 EndOfWorkFile VALUE HIGH-VALUES.
           02 BookNumberWF          PIC X(5).
           02 CopiesWF           PIC 99.
           02 FILLER             PIC X.

       WORKING-STORAGE SECTION.

      *This section presents how the data will be presented
      *in a tabular format

       01  FirstHeading.
           02 FILLER             PIC X(20) VALUE SPACES.
           02 FILLER             PIC X(40)
           VALUE "The Folio Society Best Sellers List".

       01  SecondHeading.
           02 FILLER             PIC X(19) VALUE SPACES.
           02 FILLER             PIC X(33) VALUE ALL "-".

       01  ThirdHeading.
           02 FILLER             PIC X(7) VALUE " RANK".
           02 FILLER             PIC X(17) VALUE "BOOK NO.".
           02 FILLER             PIC X(26) VALUE "BOOK TITLE".
           02 FILLER             PIC X(20) VALUE "AUTHOR NAME".
           02 FILLER             PIC X(5)  VALUE "SALES".

       01  Footer.
           02 FILLER             PIC X(25) VALUE SPACES.
           02 FILLER             PIC X(21) VALUE "** END OF REPORT **".

       01  BookRankLine.
           02 PrintRank           PIC ZZ9.
           02 FILLER               PIC X VALUE ".".
           02 FILLER               PIC X(4) VALUE SPACES.
           02 PrintBookNumber      PIC 9(5).
           02 PrintBookTitle       PIC BBBX(25).
           02 PrintAuthor          PIC BBX(25).
           02 PrintSales           PIC BBZ,ZZ9.

       01 BookRankTable.
           02 BookDetails OCCURS 11 TIMES.
               03 BookNumber      PIC 9(5).
               03 BookTitle       PIC X(25).
               03 AuthorName      PIC X(25).
               03 BookSales       PIC 9(4) VALUE ZEROS.

       01  Rank                    PIC 99.
       01  PreviousBookNum         PIC X(5).
       01  BookSalesTotal          PIC 9(4).

       PROCEDURE DIVISION.
       BEGIN.
       SORT WorkFile ON ASCENDING KEY BookNumberWF
           INPUT PROCEDURE IS SelectSales
           OUTPUT PROCEDURE IS PrintList.
       STOP RUN.

       SelectSales.
           OPEN INPUT BookSalesFile.
               READ BookSalesFile
               AT END SET EndOfBSF TO TRUE
           END-READ
           PERFORM UNTIL EndOfBSF
               IF NormalSale
                   RELEASE WorkRec FROM RecordBSF
               END-IF
           READ BookSalesFile
               AT END SET EndOfBSF TO TRUE
           END-READ
           END-PERFORM
       CLOSE BookSalesFile.

      *The method PrintList is used for displaying
      *the list of best selling books

       PrintList.
       OPEN INPUT BookMasterFile
       OPEN OUTPUT ReportFile
           WRITE PrintLine FROM FirstHeading AFTER ADVANCING PAGE.
           WRITE PrintLine FROM SecondHeading AFTER ADVANCING 1 LINE.
           WRITE PrintLine FROM ThirdHeading AFTER ADVANCING 3 LINES.

       RETURN WorkFile
            AT END SET EndOfWorkfile TO TRUE
       END-RETURN

      *The varying condition below specifies that only 10 data will be printed
      *in the report

       PERFORM GetBookRankings UNTIL EndOfWorkfile
       PERFORM PrintBookRankings
           VARYING Rank FROM 1 BY 1 UNTIL Rank > 10
           WRITE PrintLine FROM Footer AFTER ADVANCING 3 LINES.
       CLOSE ReportFile, BookMasterFile.

       PrintBookRankings.
           MOVE Rank TO PrintRank.
           MOVE BookNumber(Rank) TO PrintBookNumber
           MOVE BookTitle(Rank) TO PrintBookTitle
           MOVE AuthorName(Rank) TO PrintAuthor
           MOVE BookSales(Rank) TO PrintSales
           WRITE PrintLine FROM BookRankLine
               AFTER ADVANCING 2 LINES.

       GetBookRankings.
           MOVE BookNumberWF TO PreviousBookNum
           MOVE ZEROS TO BookSalesTotal
           PERFORM UNTIL BookNumberWF NOT EQUAL TO PreviousBookNum
               OR EndOfWorkfile
                   ADD CopiesWF TO BookSalesTotal
       RETURN WorkFile
           AT END SET EndOfWorkfile TO TRUE
       END-RETURN
       END-PERFORM

       PERFORM WITH TEST AFTER UNTIL BookNumberBMF = PreviousBookNum
       READ BookMasterFile
           AT END DISPLAY "IN C-B-R END-OF-BMF ENCOUNTERED"
       END-READ
       END-PERFORM

       PERFORM CheckBookRank
           VARYING Rank FROM 10 BY -1 UNTIL Rank < 1.

       CheckBookRank.
           IF BookSalesTotal >= BookSales(Rank)
               MOVE BookDetails(Rank) TO BookDetails(Rank + 1)
               MOVE BookNumberBMF TO BookNumber(Rank)
               MOVE BookTitleBMF TO BookTitle(Rank)
               MOVE AuthorBMF TO AuthorName(Rank)
               MOVE BookSalesTotal TO BookSales(Rank)
           END-IF.
