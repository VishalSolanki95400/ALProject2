table 50189 "Posted Daily CBM Calender"
{
    Caption = 'Posted Daily CBM Calender';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Area"; Option)
        {
            Caption = 'Area';
            OptionMembers = ,EAF,LRF,VD,CCM,"EOT CRANE","DG SE";
        }
        field(4; "Equipment no"; Code[20])
        {
            Caption = 'Equipment no';
        }
        field(5; "Assembly No."; Code[20])
        {
            Caption = 'Assemlly';
        }
        field(6; "Sub Assembly No."; Code[20])
        {
            Caption = 'sub assembly';
        }
        field(7; Department; Code[20])
        {
            Caption = 'Department';
        }
        field(8; HOD; Option)
        {
            Caption = 'HOD';
            OptionMembers = ,MECHNICAL,ELECTRICAL;
        }
        field(9; "Schedule Date"; Date)
        {
            Caption = 'Schedule Date';
        }
        field(10; "Maintenance Type"; Option)
        {
            Caption = 'Maintenance Type';
            OptionMembers = ,"TIME BASED","CONDITION BASED";
        }
        field(15; "Task Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Task Description"; text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Date Of Reading"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Current Reading/Operation"; Decimal)
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
