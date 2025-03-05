table 50100 "Student Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "StudentID"; Code[20]) { DataClassification = ToBeClassified; }
        field(2; "FirstName"; Text[50]) { DataClassification = ToBeClassified; }
        field(3; "LastName"; Text[50]) { DataClassification = ToBeClassified; }
        field(4; "DateOfBirth"; Date) { DataClassification = ToBeClassified; }
        field(5; "Gender"; Option)
        {
            OptionMembers = Male,Female,Other;
            DataClassification = ToBeClassified;
        }
        field(6; "Class"; Text[20]) { DataClassification = ToBeClassified; }
        field(7; "Section"; Text[10]) { DataClassification = ToBeClassified; }
        field(8; "PhoneNumber"; Text[15]) { DataClassification = ToBeClassified; }
        field(9; "Email"; Text[50]) { DataClassification = ToBeClassified; }
        field(10; "Address"; Text[100]) { DataClassification = ToBeClassified; }
        field(11; "Photo"; MediaSet)
        {
            DataClassification = CustomerContent;
        }
        field(12; "Status"; Enum "Student Status") { DataClassification = ToBeClassified; }



    }


    keys
    {
        key(PK; "StudentID") { Clustered = true; }
    }

    trigger OnInsert()
    var
        StudentMgmt: Codeunit "Student Management";
        NoSeriesMgt: Codeunit "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";
        NewStudentID: Code[20];
        StudentNoSeries: Record "No. Series";
    begin
        SalesSetup.Get;
        if not StudentNoSeries.Get(SalesSetup."Student No.") then
            Error('No number series found for Student ID.');

        NewStudentID := NoSeriesMgt.GetNextNo(StudentNoSeries."Code", WorkDate(), true);
        "StudentID" := NewStudentID;
        StudentMgmt.CreateVendorForStudent(Rec);

    end;


}
