enum 50120 "Request Line Type" implements "Request Line Data"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ';
        Implementation = "Request Line Data" = "Text Request Line";
    }
    value(1; Item)
    {
        Caption = 'Item';
        Implementation = "Request Line Data" = "Item Request Line";
    }
    value(2; Resource)
    {
        Caption = 'Resource';
        Implementation = "Request Line Data" = "Resource Request Line";
    }
}
