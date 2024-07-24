table 50116 "Import Status"
{
    Caption = 'Import Status';
    DataClassification = ToBeClassified;

    fields
    {


        field(1; "Supplier No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Supplier No.';
            TableRelation = Vendor;
            trigger OnValidate();
            var
                vendor: Record Vendor;
            begin
                if vendor.Get("Supplier No.") then
                    Rec."Supplier Name" := vendor."Name";
            end;
        }
        field(2; "Supplier Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Supplier';
        }
        field(3; Origin; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Origin';
        }
        field(4; Total; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total';
        }
        field(5; LOT; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'LOT';
        }
        field(6; "PER TON"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'PER TON';
        }
        field(7; RATE; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'RATE';
        }
        field(8; "CONTRACT DATE"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'CONTRACT DATE';
        }
        field(9; "GRADE "; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'GRADE ';
        }
        field(10; INDENTOR; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'INDENTOR';
        }
        field(11; CHA; Text[50])
        {
            DataClassification = ToBeClassified;

            Caption = 'CHA';
        }
        field(12; ARRIVAL; Date)
        {
            DataClassification = ToBeClassified;

            Caption = 'ARRIVAL';
        }
        field(13; PORT; Text[50])
        {
            DataClassification = ToBeClassified;

            Caption = 'PORT';
        }
        field(14; TERM; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'TERM';
        }
        field(15; INVOICE; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INVOICE';
        }
        field(16; "DO VALIDITY"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'DO VALIDITY';
        }
        field(17; "SHIPPING LINE"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'SHIPPING LINE';
        }
        field(18; BL; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'BL';
        }
        field(19; TPT; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'TPT';
        }
        field(20; "CUSTOM DUTY"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'CUSTOM DUTY';
        }
        field(21; "COC DT."; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'COC DT.';
        }
        field(22; "W/H"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'W/H';
        }
        field(23; "SIMS "; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'SIMS ';
        }
        field(24; SECURITY; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'SECURITY';
        }
        field(25; "BOE NO."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'BOE NO.';
        }
        field(26; "DATE"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'DATE';
        }
        field(27; REMARKS; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'REMARKS';
        }
        field(28; "PURCHASE ORDER"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'PURCHASE ORDER';
        }
        field(29; "Import stage status"; Option)
        {
            OptionMembers = "Current Status","Part clearance","SHIPMENT UNDER CLEARANCE","SHIPMENT ARRIVED","SHIPMENT RAILED OUT";
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Supplier No.")
        {
            Clustered = true;
        }
    }
}
