pageextension 50117 SalesReceivablesSetupPageExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Order Nos.")
        {
            field("Student No."; Rec."Student No.")
            {
                ApplicationArea = All;
            }

            field("Posted Student No."; Rec."Posted Student No.")
            {
                ApplicationArea = All;
            }
        }
    }
}