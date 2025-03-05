pageextension 50115 "Vendor Card Page Ext" extends "Vendor Card"
{
    layout
    {
        addafter(Blocked)
        {
            field(Failed; Rec.Failed)
            {
                ApplicationArea = all;
            }
        }
    }
}