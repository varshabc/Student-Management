tableextension 50113 "Vendor Table Ext" extends Vendor
{
    fields
    {
        field(50100; "Failed"; Boolean)
        {
            Caption = 'Failed';
            DataClassification = ToBeClassified;
            Editable = false; 
        }
    }
}
