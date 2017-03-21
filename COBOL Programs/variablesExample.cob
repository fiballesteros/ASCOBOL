      ******************************************************************
      * Author:
      * Date:
      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
        PROGRAM-ID. FragmentA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Num1      PIC 9(3) VALUE ZEROS.
       01 Num2       PIC 9(3) VALUE ZEROS.
       01 SUMTOTAL        PIC 9(4) VALUE ZEROS.
       01 DIFFERENCE        PIC 9(4) VALUE ZEROS.
       01 PRODUCT        PIC 9(4) VALUE ZEROS.
       01 QUOTIENT        PIC 9(4) VALUE ZEROS.
       PROCEDURE DIVISION.
       Calc-Result.
           DISPLAY "ENTER A NUMBER: ".
           ACCEPT Num1.
           DISPLAY "ENTER A NUMBER: ".
           ACCEPT Num2.
           ADD Num1 TO Num2 GIVING SUMTOTAL.
           SUBTRACT Num1 FROM Num2 GIVING DIFFERENCE.
           MULTIPLY Num1 by Num2 GIVING PRODUCT.
           DIVIDE Num1 by Num2 GIVING QUOTIENT.
           Display "The sum is: " SUMTOTAL.
           Display "The difference is: " DIFFERENCE.
           Display "The product is: " PRODUCT.
           Display "The quotient is: " QUOTIENT.
           STOP RUN.

       END PROGRAM FragmentA.
