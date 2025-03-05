codeunit 50115 "Student Management"
{
    procedure CreateVendorForStudent(StudentHeaderRec: Record "Student Header")
    var
        VendorRec: Record Vendor;
        StudentLineRec: Record "Student Line";
        MinMarks: Decimal;
        VendorExists: Boolean;

    begin

        VendorExists := VendorRec.Get(StudentHeaderRec."StudentID");
        if VendorExists then
            exit;

        VendorRec.Init();
        VendorRec."No." := StudentHeaderRec."StudentID";
        VendorRec.Name := StudentHeaderRec."FirstName" + ' ' + StudentHeaderRec."LastName";
        VendorRec."Phone No." := StudentHeaderRec."PhoneNumber";
        VendorRec."E-Mail" := StudentHeaderRec."Email";

        MinMarks := 100;
        StudentLineRec.SetRange("StudentID", StudentHeaderRec."StudentID");
        if StudentLineRec.FindSet() then begin
            repeat
                if StudentLineRec."MarksObtained" < MinMarks then
                    MinMarks := StudentLineRec."MarksObtained";
            until StudentLineRec.Next() = 0;
        end;

        VendorRec."Failed" := MinMarks < 50;
        VendorRec.Insert();
    end;



    procedure ModifyVendorForStudent(StudentLineRec: Record "Student Line")
    var
        VendorRec: Record Vendor;
        StudentLine: Record "Student Line";
        MinMarks: Decimal;
        VendorExists: Boolean;
    begin

        VendorExists := VendorRec.Get(StudentLineRec."StudentID");
        if not VendorExists then
            exit;

        MinMarks := 100;
        StudentLine.SetRange("StudentID", StudentLineRec."StudentID");
        if StudentLine.FindSet() then begin
            repeat
                if StudentLine."MarksObtained" < MinMarks then
                    MinMarks := StudentLineRec."MarksObtained";
            until StudentLine.Next() = 0;
        end;

        VendorRec."Failed" := MinMarks < 50;
        VendorRec.Modify();
    end;
}
