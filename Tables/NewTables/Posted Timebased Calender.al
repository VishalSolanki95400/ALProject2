table 50145 "Posted Timebased Calender"
{
    Caption = 'Posted Timebased Calender';
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
        field(5; Assemlly; Code[20])
        {
            Caption = 'Assemlly';
        }
        field(6; "sub assembly"; Code[20])
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
            OptionMembers = ,"TIME BASED","Preventive Maintainance","CONDITION BASED";
        }
        field(11; "Date of Maintenance"; Date)
        {
            Caption = 'Date of Maintenance';
        }
        field(12; Frequency; Code[10])
        {
            Caption = 'Frequency';
        }
        field(13; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Complete;
        }
        field(15; "Task Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Task Description"; text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Remarks"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Delay"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; Supervisor; Text[30])
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
