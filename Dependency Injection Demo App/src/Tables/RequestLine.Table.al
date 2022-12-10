table 50121 "Request Line"
{
    Caption = 'Request Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Type"; Enum "Request Line Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            TableRelation = if ("Type" = const(" ")) "Standard Text"
            else
            if ("Type" = const(Item)) Item
            else
            if ("Type" = const(Resource)) Resource;

            trigger OnValidate()
            begin
                ValidateNo();
            end;

        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 2;
            BlankZero = true;

            trigger OnValidate()
            begin
                ValidateQuantity();
            end;
        }
        field(7; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Requested Date"; Date)
        {
            Caption = 'Requested Date';
            DataClassification = CustomerContent;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
            BlankZero = true;

            trigger OnValidate()
            begin
                ValidateUnitPrice();
            end;
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 2;
            BlankZero = true;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    local procedure ValidateNo()
    var
        FillRequestLine: Codeunit "Fill Request Line";
    begin
        FillRequestLine.FillRequestLine(Rec);
    end;

    local procedure ValidateQuantity()
    var
        FillRequestLine: Codeunit "Fill Request Line";
    begin
        FillRequestLine.ValidateQuantityOnRequestLine(Rec, xRec.Quantity);
    end;

    local procedure ValidateUnitPrice()
    var
        FillRequestLine: Codeunit "Fill Request Line";
    begin
        FillRequestLine.ValidateUnitPriceOnRequestLine(Rec, xRec."Unit Price");
    end;

    internal procedure IsRequestableLine(): Boolean
    begin
        exit("Type" <> "Type"::" ");
    end;
}