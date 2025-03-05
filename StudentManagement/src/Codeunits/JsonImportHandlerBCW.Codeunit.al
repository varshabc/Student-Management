codeunit 50101 "Json Import Handler"
{
    Subtype = Normal;
 
    procedure ImportStudentJson(JsonText: Text)
    var
        StudentsArray,StudentLinesArray: JsonArray;
        StudentHeaderObj,JsonObject, StudentLineObj : JsonObject;
         JsonToken,JsonTokenBackup: JsonToken;
        StudentHeaderRec: Record "Student Header";
        StudentLineRec: Record "Student Line"; 
        StudentMgmt: Codeunit "Student Management"; 
        NoSeriesMgt: Codeunit "No. Series";
        NewStudentID: Code[20];
        StudentNoSeries: Record "No. Series";
        SalesSetup : Record "Sales & Receivables Setup";
    begin
        JsonObject.ReadFrom(JsonText);
 
        if JsonObject.Get('Students', JsonToken) then
            StudentsArray := JsonToken.AsArray();
 
        foreach JsonToken in StudentsArray do begin
            StudentHeaderObj := JsonToken.AsObject();
            JsonTokenBackup := JsonToken;
 
            StudentHeaderRec.Init();
            StudentHeaderObj.Get('StudentHeader', JsonToken);
            StudentHeaderObj := JsonToken.AsObject();

            SalesSetup.Get;
            if not StudentNoSeries.Get(SalesSetup."Student No.") then
                Error('No number series found for Student ID.');

            NewStudentID := NoSeriesMgt.GetNextNo(StudentNoSeries."Code", WorkDate(), true);
            StudentHeaderRec."StudentID" := NewStudentID;
 
            StudentHeaderObj.Get('FirstName', JsonToken);
            StudentHeaderRec."FirstName" := JsonToken.AsValue().AsText();
 
            StudentHeaderObj.Get('LastName', JsonToken);
            StudentHeaderRec."LastName" := JsonToken.AsValue().AsText();
 
            StudentHeaderObj.Get('DateOfBirth', JsonToken);
            Evaluate(StudentHeaderRec."DateOfBirth", JsonToken.AsValue().AsText());
 
            StudentHeaderObj.Get('Gender', JsonToken);
            Evaluate(StudentHeaderRec."Gender", JsonToken.AsValue().AsText());
 
            StudentHeaderObj.Get('Class', JsonToken);
            StudentHeaderRec."Class" := JsonToken.AsValue().AsText();
 
            StudentHeaderObj.Get('Section', JsonToken);
            StudentHeaderRec."Section" := JsonToken.AsValue().AsText();
 
            StudentHeaderObj.Get('PhoneNumber', JsonToken);
            StudentHeaderRec."PhoneNumber" := JsonToken.AsValue().AsText();
 
            StudentHeaderObj.Get('Email', JsonToken);
            StudentHeaderRec."Email" := JsonToken.AsValue().AsText();
 
            StudentHeaderObj.Get('Address', JsonToken);
            StudentHeaderRec."Address" := JsonToken.AsValue().AsText();
 
            StudentHeaderRec.Insert();
 
            StudentHeaderObj := JsonTokenBackup.AsObject();
            if StudentHeaderObj.Get('StudentLines', JsonToken) then
                StudentLinesArray := JsonToken.AsArray();
 
            foreach JsonToken in StudentLinesArray do begin
                StudentLineObj := JsonToken.AsObject();
                StudentLineRec.Init();
                StudentLineRec."LineNo" := StudentLineRec.Count + 1;
                StudentLineRec."StudentID" := StudentHeaderRec."StudentID";
 
                StudentLineObj.Get('SubjectCode', JsonToken);
                StudentLineRec."SubjectCode" := JsonToken.AsValue().AsText();
 
                StudentLineObj.Get('SubjectName', JsonToken);
                StudentLineRec."SubjectName" := JsonToken.AsValue().AsText();
 
                StudentLineObj.Get('MarksObtained', JsonToken);
                StudentLineRec.Validate(StudentLineRec.MarksObtained,JsonToken.AsValue().AsInteger());
                
 
                StudentLineObj.Get('MaxMarks', JsonToken);
                StudentLineRec."MaxMarks" := JsonToken.AsValue().AsInteger();
 
                StudentLineObj.Get('Grade', JsonToken);
                StudentLineRec."Grade" := JsonToken.AsValue().AsText();

                 StudentLineObj.Get('Remarks', JsonToken);
                StudentLineRec."Remarks" := JsonToken.AsValue().AsText();

                 StudentLineObj.Get('Weightage', JsonToken);
                StudentLineRec."Weightage" := JsonToken.AsValue().AsDecimal();

 
                StudentLineRec.Insert();
            end;
            StudentMgmt.CreateVendorForStudent(StudentHeaderRec);
        end;
    end;

}
 
 