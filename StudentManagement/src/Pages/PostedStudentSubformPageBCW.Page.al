page 50108 "Posted Student Subform"
{
    PageType = ListPart;
    SourceTable = "Posted Student Line"; 
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("SubjectCode"; Rec."SubjectCode") { ApplicationArea = All; }
                field("SubjectName"; Rec."SubjectName") { ApplicationArea = All; }
                field("MarksObtained"; Rec."MarksObtained") { ApplicationArea = All; }
                field("MaxMarks"; Rec."MaxMarks") { ApplicationArea = All; }
                field("Grade"; Rec."Grade") { ApplicationArea = All; }
            }
        }
    }
}
