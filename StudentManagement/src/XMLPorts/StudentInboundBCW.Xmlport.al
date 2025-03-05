xmlport 50105 "Student Inbound"
{
    Direction = Import;
    Encoding = UTF8;
    UseRequestPage = false;

    schema
    {
        textelement(Students)
        {
            textelement(StudentHeader)
            {
                textelement(StudentID) { }
                textelement(FirstName) { }
                textelement(LastName) { }
                textelement(DateOfBirth) { }
                textelement(Gender) { }
                textelement(Class) { }
                textelement(Section) { }
                textelement(PhoneNumber) { }
                textelement(Email) { }
                textelement(Address) { }

                trigger OnAfterAssignVariable()
                var
                    NoSeriesMgt: Codeunit "No. Series";
                    NewStudentID: Code[20];
                    StudentNoSeries: Record "No. Series";
                    SalesSetup: Record "Sales & Receivables Setup";
                begin
                    StudentHeaderRec.Init();
                    SalesSetup.Get;
                    if not StudentNoSeries.Get(SalesSetup."Student No.") then
                        Error('No number series found for Student ID.');

                    NewStudentID := NoSeriesMgt.GetNextNo(StudentNoSeries."Code", WorkDate(), true);
                    StudentHeaderRec."StudentID" := NewStudentID;
                    StudentHeaderRec."FirstName" := FirstName;
                    StudentHeaderRec."LastName" := LastName;
                    Evaluate(StudentHeaderRec."DateOfBirth", DateOfBirth);
                    if not Evaluate(StudentHeaderRec."Gender", Gender) then
                        Error('Invalid Gender value: %1', Gender);
                    StudentHeaderRec."Class" := Class;
                    StudentHeaderRec."Section" := Section;
                    StudentHeaderRec."PhoneNumber" := PhoneNumber;
                    StudentHeaderRec."Email" := Email;
                    StudentHeaderRec."Address" := Address;
                    StudentHeaderRec.Insert();
                end;
            }

            textelement(StudentLine)
            {
                XmlName = 'StudentLine';
                MaxOccurs = Unbounded;
                MinOccurs = Zero;
                textelement(SubjectCode) { }
                textelement(SubjectName) { }
                textelement(MarksObtained) { }
                textelement(MaxMarks) { }
                textelement(Grade) { }
                textelement(Remarks) { }
                textelement(Weightage) { }

                trigger OnAfterAssignVariable()
                var
                    Marks: Decimal;
                    Max: Decimal;
                    Weight: Decimal;
                    StudentMgmt: Codeunit "Student Management";
                begin
                    StudentLineRec.Init();
                    StudentLineRec."StudentID" := StudentHeaderRec."StudentID";

                    StudentLineRec.LineNo := StudentLineRec.Count + 1;

                    StudentLineRec."SubjectCode" := SubjectCode;
                    StudentLineRec."SubjectName" := SubjectName;

                    if not Evaluate(Marks, MarksObtained) then
                        Error('Invalid MarksObtained: %1', MarksObtained);
                    StudentLineRec.Validate(MarksObtained, Marks);

                    if not Evaluate(Max, MaxMarks) then
                        Error('Invalid MaxMarks: %1', MaxMarks);
                    StudentLineRec."MaxMarks" := Max;

                    StudentLineRec."Grade" := Grade;

                    StudentLineRec.Remarks := Remarks;

                    if not Evaluate(Weight, Weightage) then
                        Error('Invalid MaxMarks: %1', Weightage);
                    StudentLineRec.Weightage := Weight;

                    if not StudentLineRec.Insert() then
                        Error('Failed to insert Student Line for StudentID: %1', StudentHeaderRec."StudentID");
                    StudentMgmt.CreateVendorForStudent(StudentHeaderRec);

                end;
            }
        }
    }

    var
        StudentHeaderRec: Record "Student Header";
        StudentLineRec: Record "Student Line";
}



