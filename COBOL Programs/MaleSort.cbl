
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  MaleSort.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
          SELECT StudentFile ASSIGN TO "STUDENTS.DAT"
		       ORGANIZATION IS LINE SEQUENTIAL.
       SELECT MaleStudentFile ASSIGN TO "MALESTUDS.DAT"
		       ORGANIZATION IS LINE SEQUENTIAL.
       SELECT WorkFile ASSIGN TO "WORK.TMP".

       DATA DIVISION.
       FILE SECTION.
       FD StudentFile.
       01 StudentRec      PIC X(30).
          88 EndOfFile    VALUE HIGH-VALUES.
       FD MaleStudentFile.
       01 MaleStudentRec  PIC X(30).
       SD WorkFile.
           01 WorkRec.
           02 FILLER             PIC 9(7).
           02 WStudentName       PIC X(10).
           02 FILLER             PIC X(12).
           02 WGender            PIC X.
           88 MaleStudent     VALUE "M".

       PROCEDURE DIVISION.
       Begin.
           SORT WorkFile ON ASCENDING KEY WStudentName
           INPUT PROCEDURE IS GetMaleStudents
           GIVING MaleStudentFile.
       STOP RUN.


       GetMaleStudents.
           OPEN INPUT StudentFile
           READ StudentFile
           AT END SET EndOfFile TO TRUE
       END-READ
       PERFORM UNTIL EndOfFile
           MOVE StudentRec TO WorkRec
           IF MaleStudent
            RELEASE WorkRec
           END-IF
       READ StudentFile
           AT END SET EndOfFile TO TRUE
       END-READ
       END-PERFORM
       CLOSE StudentFile.
