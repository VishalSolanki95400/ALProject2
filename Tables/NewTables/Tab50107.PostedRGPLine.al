table 50111 postedRGPLine
{
    Caption = 'postedRGPLine';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(3; "No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = item."No.";
            trigger OnValidate()
            var
                irec: Record Item;
            begin
                if No <> '' then begin
                    if irec.Get(No) then begin
                        Description := irec.Description;
                        "Unit Cost" := irec."Unit Cost";
                    end;
                end;
            end;

        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(7; UOM; Code[20])
        {
            Caption = 'UOM';
        }
        field(8; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
        }
        field(9; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
        }
        field(10; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
        }
        field(11; "Qty to Ship"; Decimal)
        {
            Caption = 'Qty to Ship';
        }
        field(12; "Qty Shipped"; Decimal)
        {
            Caption = 'Qty Shipped';
        }
        field(13; "Issue Type"; Option)
        {
            Caption = 'Issue Type';
            OptionMembers = " ",Issue,Return;
        }
        field(14; "Qty to Received"; Decimal)
        {
            Caption = 'Qty to Received';
        }
        field(15; "Qty Received"; Decimal)
        {
            Caption = 'Qty Received';
        }
        field(16; Remarks; Text[50])
        {
            Caption = 'Remarks';
        }
        field(17; "FARGP Led. Entry No."; Code[20])
        {
            Caption = 'FARGP Led. Entry No.';
        }

    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
}
