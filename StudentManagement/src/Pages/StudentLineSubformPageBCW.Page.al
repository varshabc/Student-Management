page 50101 "Student Marks"
{
    PageType = ListPart;
    SourceTable = "Student Line";
    ApplicationArea = All;
    AutoSplitKey = true;


    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("SubjectCode"; Rec."SubjectCode")
                {
                    ApplicationArea = All;
                    Caption = 'Subject Code';
                }

                field("SubjectName"; Rec."SubjectName")
                {
                    ApplicationArea = All;
                    Caption = 'Subject Name';
                }

                field("MarksObtained"; Rec."MarksObtained")
                {
                    ApplicationArea = All;
                    Caption = 'Marks Obtained';
                }

                field("MaxMarks"; Rec."MaxMarks")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Marks';
                }

                field("Grade"; Rec."Grade")
                {
                    ApplicationArea = All;
                    Caption = 'Grade';
                }

                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    Caption = 'Remarks';
                }

                field(Result; Rec.Result)
                {
                    ApplicationArea = All;
                    Caption = 'Result';
                }

                field(Weightage; Rec.Weightage)
                {
                    ApplicationArea = All;
                    Caption = 'Weightage';
                }

            }
        }
    }
}
