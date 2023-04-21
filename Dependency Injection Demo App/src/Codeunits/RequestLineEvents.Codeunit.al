codeunit 50128 "Request Line Events"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Request Line", OnAfterFillLineData, '', false, false)]
    local procedure HandleOnAfterFillLineData(var RequestLine: Record "Request Line")
    begin
        RequestLine.Description += ' (C)';
    end;
}
