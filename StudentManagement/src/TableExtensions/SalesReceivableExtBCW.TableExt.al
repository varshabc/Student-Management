tableextension 50116 SalesReceivablesSetupTableExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

        field(50101; "Posted Student No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}