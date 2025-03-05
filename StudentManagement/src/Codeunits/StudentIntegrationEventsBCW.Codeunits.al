codeunit 50105 "Student Integration Events"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Student Posting", 'OnBeforeMoveStudentDetails', '', false, false)]
    local procedure HandleOnBeforeMoveStudentDetails(var StudentHeader: Record "Student Header")
    begin
        RunOutboundXMLPort(StudentHeader);
    end;

    local procedure RunOutboundXMLPort(StudentHeader: Record "Student Header")
    var
        OutStream: OutStream;
        TempBlob: Codeunit "Temp Blob";
        ExportedFileName: Text;
        
    begin
        TempBlob.CreateOutStream(OutStream);
        StudentHeader.SetRange("StudentID", StudentHeader."StudentID");
        XmlPort.EXPORT(50104, OutStream, StudentHeader);
        ExportedFileName := 'ExportedStudent.xml';
        DownloadFromStream(
            TempBlob.CreateInStream(),
            'Exported Student Data',
            '',
            'XML Files (*.xml)|*.xml',
            ExportedFileName
        );

        Message('Outbound XMLPort executed for Student: %1', StudentHeader."StudentID");
    end;
}
