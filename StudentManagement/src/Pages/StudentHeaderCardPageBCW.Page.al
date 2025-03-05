page 50100 "Student Card"
{
    PageType = Card;
    SourceTable = "Student Header";

    layout
    {
        area(content)
        {
            group("Student Details")
            {
                field("FirstName"; Rec."FirstName")
                {
                    ApplicationArea = All;
                }
                field("LastName"; Rec."LastName")
                {
                    ApplicationArea = All;
                }
                field("DateOfBirth"; Rec."DateOfBirth")
                {
                    ApplicationArea = All;
                }
                field("Gender"; Rec."Gender")
                {
                    ApplicationArea = All;
                }
                field("Class"; Rec."Class")
                {
                    ApplicationArea = All;
                }
                field("Section"; Rec."Section")
                {
                    ApplicationArea = All;
                }
                field("PhoneNumber"; Rec."PhoneNumber")
                {
                    ApplicationArea = All;
                }
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                }
                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                }
            }

            part("Student Marks"; "Student Marks")
            {
                SubPageLink = "StudentID" = FIELD("StudentID");
                ApplicationArea = All;
            }

        }
        area(FactBoxes)
        {

            part("Student Photo"; "Student Photo FactBox")
            {
                ApplicationArea = All;
                Caption = 'Student Photo';
                SubPageLink = "StudentID" = FIELD("StudentID");
            }

            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
            }

            part("Attached Documents List"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
            }

        }


    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Image = Post;
                trigger OnAction()
                var
                    StudentPosting: Codeunit "Student Posting";
                begin
                    if Confirm('Do you want to post this student record?', false) then
                        StudentPosting.PostStudent(Rec);
                end;
            }

            action("Upload Photo")
            {
                ApplicationArea = All;
                Image = Import;
                Caption = 'Upload Photo';

                trigger OnAction()
                var
                    InStr: InStream;
                    FileName: Text;

                begin
                    if UploadIntoStream('Select a photo', '', 'All Files (*.*)|*.*', FileName, InStr) then begin
                        rec.Photo.ImportStream(InStr, FileName);
                        Rec.Modify(true);
                        Message('Photo uploaded successfully.');
                    end
                end;

            }
        }
    }
}
