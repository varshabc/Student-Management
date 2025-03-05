page 50123 "Student Photo FactBox"
{
    PageType = CardPart;
    SourceTable = "Student Header";
    Caption = 'Student Photo';
    Editable = false;

    layout
    {
        area(content)
        {
            field("Student Photo"; Rec."Photo")
            {
                ShowCaption = false;
                ApplicationArea = All;
            }
        }
    }
}
