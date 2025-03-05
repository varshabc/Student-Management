page 50124 "Posted Student Photo FactBox"
{
    PageType = CardPart;
    SourceTable = "Posted Student Header";
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
