table 50196 "Transformer Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Parameter Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Parameter Master"."Parameter Code";
            // trigger OnValidate()
            // var
            // begin
            //     if ParMast.Get("Parameter Code") then
            //         "Parameter Name" G:= ParMast."Parameter Name";
            //     if "Parameter Code" = '' then
            //         "Parameter Name" G:= '';
            // end;
        }
        field(4; "Parameter Name"; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(5; Value; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Transformer Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Transformer Master"."Transformer Code";
            // trigger OnValidate()
            // var
            // begin
            //     if TranMast.Get("Transformer Code") then

            // end;
        }
        field(7; "Transformer Name"; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var

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