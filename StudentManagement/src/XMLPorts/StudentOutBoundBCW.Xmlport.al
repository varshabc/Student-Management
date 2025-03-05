xmlport 50104 "Student Outbound"
{
    Caption = 'Student Outbound';
    Direction = Export;
    Encoding = UTF8;
    UseRequestPage = false;

    schema
    {
        textelement(Students)
        {
            tableelement(StudentHeader; "Student Header")
            {
                XmlName = 'StudentHeader';

                fieldelement(StudentID; StudentHeader."StudentID")
                {
                    XmlName = 'StudentID';
                }

                fieldelement(FirstName; StudentHeader."FirstName")
                {
                    XmlName = 'FirstName';
                }

                fieldelement(LastName; StudentHeader."LastName")
                {
                    XmlName = 'LastName';
                }

                fieldelement(DateOfBirth; StudentHeader."DateOfBirth")
                {
                    XmlName = 'DateOfBirth';
                }

                fieldelement(Gender; StudentHeader."Gender")
                {
                    XmlName = 'Gender';
                }

                fieldelement(Class; StudentHeader."Class")
                {
                    XmlName = 'Class';
                }

                fieldelement(Section; StudentHeader."Section")
                {
                    XmlName = 'Section';
                }

                fieldelement(PhoneNumber; StudentHeader."PhoneNumber")
                {
                    XmlName = 'PhoneNumber';
                }

                fieldelement(Email; StudentHeader."Email")
                {
                    XmlName = 'Email';
                }

                fieldelement(Address; StudentHeader."Address")
                {
                    XmlName = 'Address';
                }
            }


            tableelement(StudentLine; "Student Line")
            {
                XmlName = 'StudentLine';
                LinkTable = StudentHeader;
                LinkFields = "StudentID" = FIELD(StudentID);

                SourceTableView = sorting("StudentID");
                MaxOccurs = Unbounded;
                MinOccurs = Zero;

                fieldelement(LineID; StudentLine."LineNo")
                {
                    XmlName = 'LineNo';
                }

                fieldelement(SubjectCode; StudentLine."SubjectCode")
                {
                    XmlName = 'SubjectCode';
                }

                fieldelement(SubjectName; StudentLine."SubjectName")
                {
                    XmlName = 'SubjectName';
                }

                fieldelement(MarksObtained; StudentLine."MarksObtained")
                {
                    XmlName = 'MarksObtained';
                }

                fieldelement(MaxMarks; StudentLine."MaxMarks")
                {
                    XmlName = 'MaxMarks';
                }

                fieldelement(Grade; StudentLine."Grade")
                {
                    XmlName = 'Grade';
                }
            }
        }
    }
}

