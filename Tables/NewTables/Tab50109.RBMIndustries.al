table 50109 "RBM Industries"
{
    Caption = 'RBM Industries';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Workstation No."; Code[50])
        {
            Caption = 'Workstation No.';
            TableRelation = "Work Center";
            DataClassification = ToBeClassified;
        }
        field(2; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = "",Patch,Dye;
            DataClassification = ToBeClassified;

        }
        field(3; "Dye No."; Integer)
        {
            Caption = 'Dye No.';
            TableRelation = Item;

            DataClassification = ToBeClassified;
        }

        field(4; "Lifetime Capacity"; Integer)
        {
            Caption = 'Lifetime Capacity';
            DataClassification = ToBeClassified;
        }
        field(5; "Tracking Qty"; Integer)
        {
            Caption = 'Tracking Qty';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
            begin
                Rec."Remaining Qty" := rec."Lifetime Capacity" - rec."Tracking Qty";
            end;
        }
        field(6; "Remaining Qty"; Integer)
        {
            Caption = 'Remaining Qty';
            DataClassification = ToBeClassified;

        }
        field(7; "Alert Capacity"; Integer)
        {
            Caption = 'Alert Capacity';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Workstation No.", Type)
        {
            Clustered = true;
        }
    }
}
