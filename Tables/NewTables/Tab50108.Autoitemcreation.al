table 50108 Autoitemcreation
{
    Caption = 'Autoitemcreation';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item Type"; code[20])
        {
            TableRelation = Item;
            Caption = 'Item Type';
        }
        field(2; "Type"; Option)
        {
            OptionMembers = Inventory,service,"Non-Inventory";
            Caption = 'Type';
        }
        field(3; "GST Credit"; Option)
        {
            OptionMembers = Availment,"Non-Availment";
            Caption = 'GST Credit';
        }
        field(4; "HSN/SAC Code"; Code[20])
        {
            Caption = 'HSN/SAC Code';
        }
        field(5; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
        }
        field(6; "Gen. prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. prod. Posting Group';
        }
        field(7; "Type_"; Text[20])
        {
            Caption = 'Type';
        }
        field(8; "Base Unit Of Measure"; Code[20])
        {
            Caption = 'Base Unit Of Measure';
        }
    }
    keys
    {
        key(PK; "Item Type")
        {
            Clustered = true;
        }
    }
}
