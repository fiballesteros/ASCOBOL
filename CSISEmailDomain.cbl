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

       SELECT GraduateInfo ASSIGN TO "GradInfo.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT CountryInfo  ASSIGN TO "CountryCodes.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT SortedFile ASSIGN TO "SortedDomain.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT WorkFile ASSIGN TO "WORK.TMP".

       DATA DIVISION.
       FILE SECTION.
       FD CountryInfo.
           01 CountryRecord.
           02 CountryCode      PIC X(2).
           02 CountryName      PIC X(26).
           88 EndOfCountryInfo   VALUE HIGH-VALUES.

       FD GraduateInfo.
           01 GraduateInfoRecord.
           88 EndOfGradFileGI    VALUE HIGH-VALUES.
           02 StudentNameGI      PIC X(25).
           02 GradYearGI         PIC 9(4).
           02 CourseCodeGI       PIC 9.
           88 CSISGradutaeGI     VALUE 1 THRU 5.
           02 EmailAddrGI        PIC X(28).
           02 EmailDomainGI      PIC X(20).
           02 CountryCodeGI      PIC XX.

       FD SortedFile.
           01 GradInfoRec.
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
       02 CourseValues.
            03 FILLER         PIC X(25) VALUE "Computer Systems".
            03 FILLER         PIC X(25) VALUE "Grad. Dip. Computing".
            03 FILLER         PIC X(25) VALUE "Grad. Dip. Localisation".
            03 FILLER         PIC X(25) VALUE "Grad. Dip. Music".
            03 FILLER         PIC X(25) VALUE "Computing with French".
            03 FILLER         PIC X(25) VALUE "Language with Computing".
       02 FILLER REDEFINES CourseValues.
            03 CourseName      PIC X(5) OCCURS 5 TIMES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            STOP RUN.
       END PROGRAM CSISEmailDomain.
