codeunit 50102 "Student Posting"
{
    [IntegrationEvent(false, false)]
    procedure OnBeforeMoveStudentDetails(var StudentHeader: Record "Student Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterMoveStudentDetails(var PostedStudentHeader: Record "Posted Student Header")
    begin
    end;

    procedure PostStudent(var StudentHeader: Record "Student Header")
    var
        PostedStudentHeader: Record "Posted Student Header";
        PostedStudentLine: Record "Posted Student Line";
        StudentLine: Record "Student Line";
        VendorRec: Record Vendor;
        VendorStatus: Enum "Vendor Status";
        IsFailed: Boolean;
        StudentMgmt: Codeunit "Student Management";
        NoSeriesMgt: Codeunit "No. Series";
        NewStudentID: Code[20];
        StudentNoSeries: Record "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";

    begin
        PostedStudentHeader.Init();
        PostedStudentHeader.TransferFields(StudentHeader);

        SalesSetup.Get;

        if not StudentNoSeries.Get(SalesSetup."Posted Student No.") then
            Error('No number series found for Student ID.');

        NewStudentID := NoSeriesMgt.GetNextNo(StudentNoSeries."Code", WorkDate(), true);
        PostedStudentHeader."StudentID" := NewStudentID;
        PostedStudentHeader.Insert();
        StudentLine.SetRange("StudentID", StudentHeader."StudentID");

        if StudentLine.FindSet() then
            repeat
                PostedStudentLine.Init();
                PostedStudentLine.TransferFields(StudentLine);
                PostedStudentLine."StudentID" := PostedStudentHeader."StudentID";
                PostedStudentLine.Insert();
            until StudentLine.Next() = 0;

        OnBeforeMoveStudentDetails(StudentHeader);
        StudentLine.DeleteAll();
        StudentHeader.Delete();

        OnAfterMoveStudentDetails(PostedStudentHeader);

        Message('Student %1 has been posted', PostedStudentHeader."StudentID");
    end;
}
