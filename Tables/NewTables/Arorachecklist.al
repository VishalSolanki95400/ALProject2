table 50160 "Posted ERP checklist"
{
    Caption = 'Posted ERP checklist';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(3; "Area"; Code[20])
        {
            Caption = 'Area';
            // OptionMembers = ,EAF,LRF,VD,CCM,"LT Room","EOT Crane";
            // TableRelation = "Mech. Area Master";
        }
        field(4; Description; Text[300])
        {
            Editable = false;
            Caption = 'Description';
        }
        field(5; "Shift-A"; Code[20])
        {
            Caption = 'Shift-A';
        }
        field(6; "Shift-B"; Code[20])
        {
            Caption = 'Shift-B';
        }
        field(7; "Shift-C"; Code[20])
        {
            Caption = 'Shift-C';
        }
        field(8; "Shift Incharge Name"; Text[50])
        {
            Caption = 'Shift Incharge Name';
        }
        field(9; Notes; Text[100])
        {
            Caption = 'Notes';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {

        }
    }
}
