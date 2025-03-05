page 50103 "Posted Student Card"
{

    PageType = Card;
    Caption = 'Posted Student Card';
    SourceTable = "Posted Student Header";
    InsertAllowed = false;
    Editable = false;


    layout
    {
        area(content)
        {
            group("General")
            {
                field("StudentID"; Rec."StudentID") { ApplicationArea = All; }
                field("FirstName"; Rec."FirstName") { ApplicationArea = All; }
                field("LastName"; Rec."LastName") { ApplicationArea = All; }
                field("Class"; Rec."Class") { ApplicationArea = All; }
                field("Section"; Rec."Section") { ApplicationArea = All; }
                field("PhoneNumber"; Rec."PhoneNumber") { ApplicationArea = All; }
            }

            part("Posted Student Subform"; "Posted Student Subform")
            {
                SubPageLink = "StudentID" = FIELD("StudentID");
                ApplicationArea = All;
            }
        }

        area(FactBoxes)
        {
            part("Student Photo"; "Posted Student Photo FactBox")
            {
                ApplicationArea = All;
                Caption = 'Student Photo';
                SubPageLink = "StudentID" = FIELD("StudentID");
            }
            
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
            }

            part("Attached Documents List"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
            }

        }
    }

}
