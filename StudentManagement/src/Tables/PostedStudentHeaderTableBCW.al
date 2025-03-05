table 50103 "Posted Student Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "StudentID"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "FirstName"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(3; "LastName"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(4; "DateOfBirth"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Gender"; Option)
        {
            OptionMembers = Male,Female,Other;
            DataClassification = CustomerContent;
        }
        field(6; "Class"; Text[10])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Section"; Text[10])
        {
            DataClassification = CustomerContent;
        }
        field(8; "PhoneNumber"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(9; "Email"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(10; "Address"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Photo"; MediaSet)
        {
            DataClassification = CustomerContent;
        }
        field(12; "Status"; Enum "Student Status")
        {
            DataClassification = CustomerContent;
        }
        field(13; "PostedDate"; Date)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "StudentID") { Clustered = true; }
    }
}
