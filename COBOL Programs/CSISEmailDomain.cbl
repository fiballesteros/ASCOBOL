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
           01 GraduateInfoRecordGI.
           88 EndOfGradFile     VALUE HIGH-VALUES.
           02 Grad-Name         PIC X(25).
           02 Grad-Year         PIC 9(4).
           02 Course-Code       PIC 9.
           88 CSISGraduate      VALUE 1 THRU 5.
           02 Grad-Email        PIC X(28).
           02 Grad-Email-Domain PIC X(20).
           02 Country-Code      PIC XX.

       FD SortedFile.
           01 Email-Domain    PIC X(20).
           01 Grad-Name          PIC X(25).
           01 Grad-Year         PIC 9(4).
           01 CourseNameSF       PIC X(25).
           01 CountryNameSF      PIC X(26).

       SD WorkFile.
       01 WorkRec.
           88 EndOfWorkFile      VALUE HIGH-VALUES.
           02 StudentNameWF      PIC X(25).
           02 GradYearWF         PIC 9(4).
           02 CourseCodeWF       PIC 9.
           02 EmailDomainWF      PIC X(20).
           02 CountryCodeWF      PIC XX.

       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            STOP RUN.
       END PROGRAM CSISEmailDomain.
