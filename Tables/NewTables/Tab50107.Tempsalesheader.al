table 50107 "Temp sales header "
{
    Caption = 'Temp sales header ';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Line No."; Code[20])
        {
            Caption = 'Line No.';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(4; "Location code"; Code[20])
        {
            Caption = 'Location code';
        }
        field(5; "Posting date"; Date)
        {
            Caption = 'Posting date';
            trigger OnValidate()
            begin
                "Posting date" := Today;
            end;
        }
        field(6; "External Doc No."; Code[20])
        {
            Caption = 'External Doc No.';
        }
        field(7; "Type "; Option)
        {
            Caption = 'Type ';
            OptionMembers = "",order,invoice;
        }
        field(8; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(9; UOM; Code[20])
        {
            Caption = 'UOM';
        }
        field(10; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(11; "unit cost"; Decimal)
        {
            Caption = 'unit cost';
        }
        field(12; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(13; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "",Open,Closed;
        }
        field(14; "Sales order No."; Code[20])
        {
            Caption = 'Sales order No.';
        }
    }
    keys
    {
        key(PK; "No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
