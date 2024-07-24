table 50115 "IMPORT SALE CONTRACT"
{
    Caption = 'IMPORT SALE CONTRACT';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sr. No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Sr. No.';
        }
        field(2; "Party No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Party No.';
            TableRelation = Vendor;
            trigger OnValidate();
            var
                vendor: Record Vendor;
            begin
                if vendor.Get("Party No.") then
                    Rec."Party Name" := vendor."Name";
            end;
        }
        field(3; "Party Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Party Name';
        }
        field(4; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity';
        }
        field(5; Rate; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rate';
        }
        field(6; "Sales Contract"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Sales Contract';
        }
        field(7; Grade; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Grade';
        }
        field(8; "Origin "; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Origin ';
        }
        field(9; Indenter; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Indenter';
        }
        field(10; "Dated "; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Dated ';
        }
        field(11; "Payment Terms"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment Terms';
        }
        field(12; "QTY-1"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-1';
        }
        field(13; "QTY-2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-2';
        }
        field(14; "QTY-3"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-3';
        }
        field(15; "QTY-4"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-4';
        }
        field(16; "QTY-5 "; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-5 ';
        }
        field(17; "QTY-6"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-6';
        }
        field(18; "QTY-7"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-7';
        }
        field(19; "QTY-8"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-8';
        }
        field(20; "QTY-9"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-9';
        }
        field(21; "QTY-10"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY-10';
        }
        field(22; INV; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INV';
        }
        field(23; BAL; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'BAL';
        }
        field(24; "BAL QTY"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'BAL QTY';
        }
        field(25; "Cont. Exp."; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cont. Exp.';
        }
        field(26; "Mail Drop"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mail Drop';
        }
    }
    keys
    {
        key(PK; "Sr. No.")
        {
            Clustered = true;
        }
    }
}
