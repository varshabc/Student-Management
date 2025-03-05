table 50101 "Student Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "LineNo"; Integer)
        {

            DataClassification = CustomerContent;

        }
        field(2; "StudentID"; Code[20]) { DataClassification = CustomerContent; TableRelation = "Student Header"."StudentID"; }
        field(3; "SubjectCode"; Code[20]) { DataClassification = CustomerContent; }
        field(4; "SubjectName"; Text[50]) { DataClassification = CustomerContent; }
        field(5; "MarksObtained"; Decimal)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                StudentStatus: Enum "Student Status";
            begin
                if "MarksObtained" > 50 then
                    "Result" := StudentStatus::Pass
                else
                    "Result" := StudentStatus::Fail;
            end;
        }
        field(6; "MaxMarks"; Decimal) { DataClassification = CustomerContent; }
        field(7; "Grade"; Text[5]) { DataClassification = CustomerContent; }
        field(8; "Remarks"; Text[100]) { DataClassification = CustomerContent; }
        field(9; "Result"; Enum "Student Status") { DataClassification = CustomerContent; Editable = false; }
        field(10; "Weightage"; Decimal) { DataClassification = CustomerContent; }
    }
    keys
    {
        key(PK; "StudentID", "LineNo") { Clustered = true; }
    }

    trigger OnInsert()
    var
        StudentLineRec: Record "Student Line";
    begin
        if "LineNo" = 0 then begin
            StudentLineRec.Reset();
            StudentLineRec.SetRange("StudentID", "StudentID");
            if StudentLineRec.FindLast() then
                "LineNo" := StudentLineRec."LineNo" + 10000
            else
                "LineNo" := 10000;
        end;
    end;

    trigger OnModify()
    var
        StudentMgmt: Codeunit "Student Management";
    begin
        StudentMgmt.ModifyVendorForStudent(Rec);

    end;


}