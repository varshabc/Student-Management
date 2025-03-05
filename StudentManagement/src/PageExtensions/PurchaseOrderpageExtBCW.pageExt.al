pageextension 50114 "Purchase Order Page Ext" extends "Purchase Order"
{
    trigger OnOpenPage()
    var
        VendorRec: Record Vendor;
    begin
        if VendorRec.Get(Rec."Buy-from Vendor No.") then begin
            if VendorRec."Failed" then
                Error('This Vendor has failed. You cannot Open/Create a Purchase Order for this vendor.');
        end;
    end;
}
