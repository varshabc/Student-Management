page 50102 "Student List"
{
    PageType = List;
    SourceTable = "Student Header";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Student Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("StudentID"; Rec."StudentID") { ApplicationArea = All; }
                field("FirstName"; Rec."FirstName") { ApplicationArea = All; }
                field("LastName"; Rec."LastName") { ApplicationArea = All; }
                field("Class"; Rec."Class") { ApplicationArea = All; }
                field("Section"; Rec."Section") { ApplicationArea = All; }
                field("PhoneNumber"; Rec."PhoneNumber") { ApplicationArea = All; }
            }
        }

    }


    actions
    {
        area(Processing)
        {
            action("Import JSON File")
            {
                ApplicationArea = All;
                Caption = 'Import JSON File';
                Image = Import;
                trigger OnAction()
                var
                    InStream: InStream;
                    JsonText: Text;
                    TempBlob: Codeunit "Temp Blob";
                    DialogText: Text;
                    Fromfile: Text;
                    JsonImportHandler: Codeunit "Json Import Handler";
                    TempText: Text;

                begin
                    DialogText := 'Import Student JSON';
                    UploadIntoStream(DialogText, '', '', Fromfile, InStream);
                    JsonText := '';
                    repeat

                        InStream.ReadText(TempText);
                        JsonText := JsonText + TempText;
                    until InStream.EOS;

                    JsonImportHandler.ImportStudentJson(JsonText);
                    Message('JSON Imported Successfully!');
                end;
            }

            action("Import XML")
            {
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var
                    Outstr: OutStream;
                    Instr: InStream;
                    TempBlob: Codeunit "Temp Blob";
                    DialogText: Text;
                    Fromfile: Text;

                begin
                    DialogText := 'Upload Student XML';
                    UploadIntoStream(DialogText, '', '', Fromfile, Instr);
                    XmlPort.Import(XmlPort::"Student Inbound", Instr);
                    Message('New Student Record is inserted');
                end;
            }

        }
    }
}
