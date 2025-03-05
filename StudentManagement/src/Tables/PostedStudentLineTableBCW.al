table 50104 "Posted Student Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "LineNo"; Integer) { DataClassification = CustomerContent; }
        field(2; "StudentID"; Code[20]) { DataClassification = CustomerContent; TableRelation = "Posted Student Header"."StudentID"; }
        field(3; "SubjectCode"; Code[20]) { DataClassification = CustomerContent; }
        field(4; "SubjectName"; Text[50]) { DataClassification = CustomerContent; }
        field(5; "MarksObtained"; Decimal) { DataClassification = CustomerContent; }
        field(6; "MaxMarks"; Decimal) { DataClassification = CustomerContent; }
        field(7; "Grade"; Text[5]) { DataClassification = CustomerContent; }
        field(8; "Remarks"; Text[100]) { DataClassification = CustomerContent; }
        field(9; "Result"; Enum "Student Status") { DataClassification = CustomerContent; }
        field(10; "Weightage"; Decimal) { DataClassification = CustomerContent; }
    }

    keys
    {
        key(PK; "StudentID", "LineNo") { Clustered = true; }
    }
}