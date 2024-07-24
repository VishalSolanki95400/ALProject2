table 50141 "Posted MotorGreasing Checklist"
{
    Caption = 'Posted MotorGreasing Checklist';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Editable = false;
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(3; "Motor No."; Code[20])
        {
            Caption = 'Motor No.';
            // TableRelation = "Motor Master";
        }
        field(4; Description; Text[300])
        {
            Caption = 'Description';
        }
        field(5; Frequency; Code[20])
        {
            Caption = 'Frequency';
        }
        field(6; "Execution Date"; Date)
        {
            Caption = 'Execution Date';
        }
        field(7; "Next Due Date"; Date)
        {
            Editable = false;
            Caption = 'Next Due Date';
        }
        field(8; "Motor Greasing"; code[250])
        {
            Caption = 'Motor Greasing';
        }
        field(9; "Location Code"; code[20])
        {
            Caption = 'Location Code';
            Editable = false;
        }
        field(10; "Serial No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
