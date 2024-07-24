table 50153 GASProneconfinedspace
{
    Caption = 'Gas Prone/Confined Space';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Gas Prone/Confined Space"; Text[50])
        {
            Caption = 'Gas Prone/Confined Space is free of any toxic gas';
            DataClassification = ToBeClassified;

        }
        field(2; "Oxygen deficiency"; text[50])
        {
            Caption = 'Oxygen deficiency test carned out (min.19.5% and max.23.5% )';
            DataClassification = ToBeClassified;
        }
        field(3; "Ventilation & frameproof"; Text[50])
        {
            Caption = 'Ventilation & frameproof lighting arrangement';
            DataClassification = ToBeClassified;
        }
        field(4; "Apron"; text[50])
        {
            Caption = 'Apron/ jacket/ Breathing Apparatus';
            DataClassification = ToBeClassified;
        }
        field(5; "Adequate means of access"; text[50])
        {
            Caption = 'Adequate means of access & egrees';
            DataClassification = ToBeClassified;

        }
        field(6; "Equipment properly flushed"; Text[50])
        {
            Caption = 'Equipment properly flushed, drained & depressuirised';
            DataClassification = ToBeClassified;
        }
        field(7; "Medical O2 Cylinder"; Text[50])
        {
            Caption = 'Medical O2 Cylinder/ N2 purging';
            DataClassification = ToBeClassified;
        }
        field(8; "safe & appropriate hand"; Text[50])
        {
            Caption = 'safe & appropriate hand tool used';
            DataClassification = ToBeClassified;
        }
        field(9; "Continuous Supervision"; Text[50])
        {
            Caption = 'Continuous Supervision during confined entry';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Gas Prone/Confined Space")
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