table 50122 PostedCorrectpurchaseline
{
    Caption = 'Posted correct purchase line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "TDS section"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "TDS reason"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "GST Rate"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "HSN Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "GST Credit"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "GST Group Type"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(9; "GST Jurisdiction Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "GST Available"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}