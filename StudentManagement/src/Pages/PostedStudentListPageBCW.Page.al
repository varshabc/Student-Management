page 50109 "Posted Student List"
{
    PageType = List;
    SourceTable = "Posted Student Header";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Posted Student Card";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("StudentID"; Rec."StudentID") { ApplicationArea = All; }
                field("FirstName"; Rec."FirstName") { ApplicationArea = All; }
                field("LastName"; Rec."LastName") { ApplicationArea = All; }
                field("Class"; Rec."Class") { ApplicationArea = All; }
                field("Section"; Rec."Section") { ApplicationArea = All; }
                field("PhoneNumber"; Rec."PhoneNumber") { ApplicationArea = All; }
                field("Email"; Rec."Email") { ApplicationArea = All; }
                field("Status"; Rec."Status") { ApplicationArea = All; }
            }
        }
    }


}
