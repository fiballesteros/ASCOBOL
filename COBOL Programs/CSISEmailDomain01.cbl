      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CSISEmailDomain.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT GraduateInfoFile ASSIGN TO "GradInfo.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT CountryFile  ASSIGN TO "CountryCodes.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT SortedDomainFile ASSIGN TO "SortedDomain.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT WorkFile ASSIGN TO "WORK.TMP".

       DATA DIVISION.
       FILE SECTION.
        FD CountryFile.
           01 CountryRec            PIC X(28).
           88 EndOfCountryFile   VALUE HIGH-VALUES.
       FD GraduateInfoFile.
       01 GradInfoRecGF.
           88 EndOfGradFile      VALUE HIGH-VALUES.
           02 StudentNameGF      PIC X(25).
           02 GradYearGF         PIC 9(4).
           02 CourseCodeGF       PIC 9.
           88 CSISGraduate    VALUE 1 THRU 5.
           02 EmailAddrGF        PIC X(28).
           02 EmailDomainGF      PIC X(20).
           02 CountryCodeGF      PIC XX.

       FD SortedDomainFile.
       01 GradInfoRecSF.
           02 EmailDomainSF      PIC X(20).
           02 StudentNameSF      PIC X(25).
           02 GradYearSF         PIC 9(4).
           02 CourseNameSF       PIC X(25).
           02 CountryNameSF      PIC X(26).

       SD WorkFile.
       01 WorkRec.
           88 EndOfWorkFile      VALUE HIGH-VALUES.
           02 StudentNameWF      PIC X(25).
           02 GradYearWF         PIC 9(4).
           02 CourseCodeWF       PIC 9.
           02 EmailDomainWF      PIC X(20).
           02 CountryCodeWF      PIC XX.

       WORKING-STORAGE SECTION.
       01 CourseTable.
       02 CourseValue.
            03 FILLER         PIC X(25) VALUE "Computer Systems".
            03 FILLER         PIC X(25) VALUE "Grad. Dip. Computing".
            03 FILLER         PIC X(25) VALUE "Grad. Dip. Localisation".
            03 FILLER         PIC X(25) VALUE "Grad. Dip. Music".
            03 FILLER         PIC X(25) VALUE "Computing with French".
       02 FILLER REDEFINES CourseValue.
            03 CourseName      PIC X(5).

       01 CountryTable.
           02 Country OCCURS 243 TIMES INDEXED BY Cidx.
           03 CountryCode    PIC XX.
           03 CountryName    PIC X(26).

       PROCEDURE DIVISION.
       SORT WorkFile ON ASCENDING KEY EmailDomainWF
        INPUT PROCEDURE  IS CSISGraduates
        OUTPUT PROCEDURE IS Email.
       STOP RUN.

       CSISGraduates.
       OPEN INPUT GraduateInfoFile
       READ GraduateInfoFile
       AT END SET EndOfGradFile TO TRUE
       END-READ
       PERFORM UNTIL EndOfGradFile
       IF CSISGraduate
          MOVE StudentNameGF TO StudentNameWF
          MOVE GradYearGF    TO GradYearWF
          MOVE CourseCodeGF  TO CourseCodeWF
          MOVE EmailDomainGF TO EmailDomainWF
          MOVE CountryCodeGF TO CountryCodeWF
          RELEASE WorkRec
       ELSE
          DISPLAY "Student not found " StudentNameGF SPACE CourseCodeGF
       END-IF
       READ GraduateInfoFile
         AT END SET EndOfGradFile TO TRUE
       END-READ
         END-PERFORM
        CLOSE GraduateInfoFile.

       Email.
       PERFORM CreateCountryTable.
           OPEN OUTPUT SortedDomainFile
           RETURN WorkFile
            AT END SET EndOfWorkFile TO TRUE
       END-RETURN
       PERFORM UNTIL EndOfWorkFile
          MOVE StudentNameWF TO StudentNameSF
          MOVE GradYearWF    TO GradYearSF
          MOVE CourseName TO CourseNameSF
          MOVE EmailDomainWF TO EmailDomainSF
          SET Cidx TO 1
          SEARCH Country
             AT END MOVE "Code not found" TO CountryNameSF
             WHEN CountryCode(Cidx) = CountryCodeWF
                  MOVE CountryName(Cidx) TO CountryNameSF
          END-SEARCH
          WRITE GradInfoRecSF
          RETURN WorkFile
             AT END SET EndOfWorkFile TO TRUE
          END-RETURN
       END-PERFORM
       CLOSE SortedDomainFile.

       CreateCountryTable.
       OPEN INPUT CountryFile
           READ CountryFile
           AT END SET EndOfCountryFile TO TRUE
       END-READ
       PERFORM VARYING Cidx FROM 1 BY 1 UNTIL EndOfCountryFile
           MOVE CountryRec TO Country(Cidx)
           READ CountryFile
            AT END SET EndOfCountryFile TO TRUE
       END-READ
       END-PERFORM.
       CLOSE CountryFile.
       CLOSE SortedDomainFile.
       EXIT.
