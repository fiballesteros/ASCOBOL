      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GROSSPAY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Grosspay PIC 9(4)V99 VALUE 7325.78.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "The original grosspay is:" Grosspay.
            MOVE 12.4 TO Grosspay.
            DISPLAY "The grosspay is: ", Grosspay.
            MOVE 123.456 TO Grosspay.
            DISPLAY "The grosspay is: ", Grosspay.
            MOVE 12345.757 TO Grosspay.
            DISPLAY "The grosspay is ", Grosspay.
            MOVE ZEROS TO Grosspay.
            DISPLAY "The grosspay is ", Grosspay.
            MOVE 256347 to Grosspay.
            DISPLAY "The grosspay is ", Grosspay.
            STOP RUN.
       END PROGRAM GROSSPAY.
