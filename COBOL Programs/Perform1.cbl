      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PerformFormat1.
       AUTHOR.  Michael Coughlan.


       PROCEDURE DIVISION.
       TopLevel.
       DISPLAY "In TopLevel. Starting to run program"
       PERFORM OneLevelDown
       DISPLAY "Back in TopLevel.".
       STOP RUN.


       TwoLevelsDown.
           DISPLAY ">>>>>>>> Now in TwoLevelsDown."
           PERFORM ThreeLevelsDown.
           DISPLAY ">>>>>>>> Back in TwoLevelsDown.".


       OneLevelDown.
            DISPLAY ">>>> Now in OneLevelDown"
            PERFORM TwoLevelsDown
            DISPLAY ">>>> Back in OneLevelDown".


       ThreeLevelsDown.
            DISPLAY ">>>>>>>>>>>> Now in ThreeLevelsDown".
