      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NAMES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 StudentName.
           02 FirstName PIC X(15) VALUE "JOHN".
           02 Surname PIC X(15) VALUE "POWER".
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "First name:", FirstName.
            DISPLAY "Surname: ", Surname.
            MOVE "COUGHLAN" TO Surname.
            MOVE "TOM" TO FirstName.
            DISPLAY "First name:", FirstName.
            DISPLAY "Surname: ", Surname.
            MOVE "FITZPATRICK" TO Surname.
            MOVE "ALEXANDER" TO FirstName.
            DISPLAY "First name:", FirstName.
            DISPLAY "Surname: ", Surname.
            MOVE "JOHN RYAN" TO StudentName.
            MOVE ALL "x" TO StudentName.

            STOP RUN.
       END PROGRAM NAMES.
