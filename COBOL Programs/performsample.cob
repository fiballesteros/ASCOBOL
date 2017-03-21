      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PERFORMSAMPLE.
       AUTHOR. FAITH BALLESTEROS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NumofTimes           PIC 9 VALUES 3.

       PROCEDURE DIVISION.
       Begin.
       DISPLAY "Method calling sample"
       DISPLAY "METHOD One."
       PERFORM One NumofTimes TIMES.
       DISPLAY "----------".
       DISPLAY "METHOD Two."
       PERFORM Two NumofTimes TIMES.
       DISPLAY "----------".
       DISPLAY "METHOD Three."
       PERFORM Three NumofTimes TIMES.
       DISPLAY "----------".

       DISPLAY "END OF PROGRAM".

       *To stop the program use the command: STOP RUN.

       STOP RUN.
       One.
           DISPLAY "Hello".
       Two.
           DISPLAY "Hi".
       Three.
           DISPLAY "How are you?".


       END PROGRAM PERFORMSAMPLE.
