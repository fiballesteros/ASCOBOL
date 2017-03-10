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
           02 Country.
           03 CountryCode    PIC X(2).
           03 CountryName    PIC X(26).

       PROCEDURE DIVISION.
       Begin.
       SORT WorkFile ON ASCENDING KEY EmailDomainWF
        INPUT PROCEDURE  IS SelectCSISGraduates
        OUTPUT PROCEDURE IS MakeEmailDomainFile.
       STOP RUN.

       END PROGRAM CSISEmailDomain.
