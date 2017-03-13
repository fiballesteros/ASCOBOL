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

       FD SalesFile.
       01  SalesRecord.
           88 End-Of-Sales-File    VALUE HIGH-VALUES.
           02  CustomerIDSF              PIC X(5).
           02  CustomerNameSF            PIC X(20).
           02  OilIDSF.
               03  FILLER              PIC X.
               88 EssentialOil   VALUE "E".
               03  OilNameSF         PIC 99.
           02 UnitSizeSF             PIC 99.
           02 UnitSoldSF            PIC 999.

       SD WorkFile.
       01 WorkRecord.
       88 End-Of-Work-File VALUE HIGH-VALUES.
           02  CustomerIDWF              PIC X(5).
           02  CustomerNameWF            PIC X(20).
           02  OilIDWF.
               03 FILLER               PIC X.
               03 OilNumWF           PIC 99.
           02 UnitSizeWF             PIC 99.
           02 UnitSoldWF            PIC 999.

       FD SummaryReport.
           01 PrintLine                   PIC X(64).

       FD SortFile.
           01 SortedRecord                   PIC X(33).

       WORKING-STORAGE SECTION.
       01  Oils-Table.
        02  Oil-Cost-Values.
        03 FILLER               PIC X(40)
                VALUE "0041003200450050002910250055003900650075".
        03 FILLER               PIC X(40)
                VALUE "0080004400500063006500550085004812500065".
        03 FILLER               PIC X(40)
                    VALUE "0060005500670072006501250085006511150105".
        02  FILLER REDEFINES Oil-Cost-VALUES.
        03 OIL-COST           PIC 99V99 OCCURS 30 TIMES.

       01  Report-Heading-Line         PIC X(44)
            VALUE "              AROMAMORA SUMMARY SALES REPORT".

       01  Report-Heading-Underline.
        02  FILLER                  PIC X(13) VALUE SPACES.
        02  FILLER                  PIC X(32) VALUE ALL "-".

       01  Topic-Heading-Line.
           02  FILLER               PIC BX(13) VALUE " CUSTOMER NAME".
           02  FILLER               PIC X(8) VALUE SPACES.
           02  FILLER               PIC X(10) VALUE "CUST-ID   ".
           02  FILLER               PIC X(8) VALUE "SALES   ".
           02  FILLER               PIC X(11) VALUE "QTY SOLD   ".
           02  FILLER               PIC X(11) VALUE "SALES VALUE".

       01  CustomerSalesLine.
           02  PrintCustomerName           PIC X(20).
           02  PrintCustomerID             PIC BBB9(5).
           02  PrintCustomerSales          PIC BBBBBZZ9.
           02  PrintQuantitySold            PIC BBBBBZZ,ZZ9.
           02  PrintSalesValue         PIC BBBB$$$,$$9.99.

       01  TotalSalesLine.
           02  FILLER                  PIC X(33) VALUE SPACES.
           02  FILLER            PIC X(19) VALUE "TOTAL SALES       :".
           02  PrintTotalSales         PIC BBBBBBZZ,ZZ9.

       01  TotalQuantitySold.
           02  FILLER                  PIC X(33) VALUE SPACES.
           02  FILLER           PIC X(19) VALUE "TOTAL QTY SOLD    :".
           02  PrintTotalQualitySold      PIC BBBBBZZZ,ZZ9.

       01  TotalSalesValueLine.
           02  FILLER                  PIC X(33) VALUE SPACES.
           02  FILLER          PIC X(19) VALUE "TOTAL SALES VALUE :".
           02  PrintTotalSalesValue   PIC B$$$$,$$9.99.

       01  CustomerTotal.
           02  CustomerSales              PIC 999.
           02  CustomerQuantitySold           PIC 9(5).
           02  CustomerSalesValue        PIC 9(5)V99.

       01  FinalTotal.
           02  TotalSales           PIC 9(5)    VALUE ZEROS.
           02  TotalQuantitySold          PIC 9(6)    VALUE ZEROS.
           02  TotalSalesValue      PIC 9(6)V99 VALUE ZEROS.

       01  Temp-Variables.
            02  SaleQuantitySold          PIC 99999.
            02  SaleValue           PIC 999999V99.
            02  PreviousCustomerID            PIC X(5).

       PROCEDURE DIVISION.
       CreateSummaryReport.
        SORT WorkFile ON ASCENDING CustomerNameWF
         INPUT PROCEDURE IS ChooseOil
         OUTPUT PROCEDURE IS PrintSummaryReport.

       STOP RUN.

       ChooseOil.
       OPEN INPUT SalesFile.
       READ SalesFile
        AT END SET End-Of-Sales-File TO TRUE
       END-READ.

       PERFORM UNTIL End-Of-Sales-File
           IF EssentialOil
               RELEASE WorkRecord FROM SalesRecord
           END-IF
       READ SalesFile
           AT END SET End-Of-Sales-File TO TRUE
       END-READ
       END-PERFORM.

         CLOSE SalesFile.


       PrintSummaryReport.
       OPEN OUTPUT SummaryReport.
       OPEN OUTPUT SortFile.
       WRITE PrintLine FROM Report-Heading-Line AFTER
       ADVANCING 1 LINE.
       WRITE PrintLine FROM Report-Heading-Underline AFTER
       ADVANCING 1 LINE.
       WRITE PrintLine FROM Topic-Heading-Line AFTER ADVANCING 3 LINES.

       RETURN WorkFile
        AT END SET End-Of-Work-File TO TRUE
       END-RETURN.

       PERFORM PrintCustomerLine UNTIL End-Of-Work-File

       MOVE TotalSales TO PrintTotalSales.
       WRITE PrintLine FROM TotalSalesLine AFTER ADVANCING 3 LINES.

       MOVE TotalQuantitySold TO PrintTotalQuantitySold
       WRITE PrintLine FROM TotalQuantitySoldLine AFTER ADVANCING
       2 LINES.

       MOVE TotalSalesValue TO PrintTotalSalesValue.
       WRITE PrintLine FROM TotalSalesValueLine AFTER ADVANCING 2 LINES.

       CLOSE SummaryReport, SortedFile.

       PrintCustomerLines.
       MOVE ZEROS TO CustomerTotal.
       MOVE CustomerIDWF TO PrintCustomerID, PreviousCustomerID.
       MOVE CustomerNameWF TO PrintCustomerName.

        PERFORM UNTIL CustomerIDWF NOT = PreviousCustomerID
        WRITE SortedRecord FROM WorkRecord
        ADD 1 TO CustomerSales, TotalSales

        COMPUTE SaleQuantitySold = UnitSizeWF * UnitSoldWF
        ADD SaleQuantitySold TO CustomerQuantitySold, TotalQuantitySold

        COMPUTE SaleValue = SaleQuantitySold * (OilNumWF)
        ADD SaleValue TO CustomerSalesValue, TotalSalesValue

        RETURN WorkFile
            AT END SET End-Of-Work-File TO TRUE
        END-RETURN
        END-PERFORM.

        MOVE CustomerSales TO PrintCustomerSales.
        MOVE CustomerQuantitySold TO PrintQuantitySold.
        MOVE CustomerSalesValue TO PrintSalesValue.

       WRITE PrintLine FROM CustomerSalesLine AFTER ADVANCING 2 LINES.

       END-PROGRAM.
