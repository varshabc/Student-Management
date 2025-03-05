codeunit 50117 "Vendor Validation Subscriber"
{

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeValidateEvent', 'Buy-from Vendor No.', false, false)]
    local procedure ValidateVendorSelection(var Rec: Record "Purchase Header"; var xRec: Record "Purchase Header"; CurrFieldNo: Integer)
    var
        VendorRec: Record Vendor;
    begin
        if VendorRec.Get(Rec."Buy-from Vendor No.") then begin
            if VendorRec."Failed" then
                Error('This vendor is marked as Failed and cannot be used for purchase orders.');
        end;
    end;
}
