table 50168 "POSTED LIGHTENING ARRESTOR"
{
    Caption = 'POSTED LIGHTENING ARRESTOR COUNTER';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(2; "DATE"; Date)
        {
            Caption = 'DATE';
        }
        field(3; "66KV MAIN LINE R-PHASE"; Decimal)
        {
            Caption = '66KV MAIN LINE R-PHASE';
        }
        field(4; "66KV MAIN LINE Y-PHASE"; Decimal)
        {
            Caption = '66KV MAIN LINE Y-PHASE';
        }
        field(5; "66KV MAIN LINE B-PHASE"; Decimal)
        {
            Caption = '66KV MAIN LINE B-PHASE';
        }
        field(6; "12.5/16.0 MVA POWER TRANS"; Decimal)
        {
            Caption = '12.5/16.0 MVA POWER TRANSFORMER R-PHASE';
        }
        field(7; "12.5/16.0 MVA POWER TRANSF"; Decimal)
        {
            Caption = '12.5/16.0 MVA POWER TRANSFORMER Y-PHASE';
        }
        field(8; "12.5/16.0 MVA POWER TRANSFo"; Decimal)
        {
            Caption = '12.5/16.0 MVA POWER TRANSFORMER B-PHASE';
        }
        field(9; "30/36 MVA POWER TRANS"; Decimal)
        {
            Caption = '30/36 MVA POWER TRANSFORMER R-PHASE';
        }
        field(10; "30/36 MVA POWER TRANSF"; Decimal)
        {
            Caption = '30/36 MVA POWER TRANSFORMER Y-PHASE';
        }
        field(11; "30/36 MVA POWER TRANSFO"; Decimal)
        {
            Caption = '30/36 MVA POWER TRANSFORMER B-PHASE';
        }
        field(12; "25MVA EAF TRANSFORMER R-PHASE"; Decimal)
        {
            Caption = '25MVA EAF TRANSFORMER R-PHASE';
        }
        field(13; "25MVA EAF TRANSFORMER Y-PHASE"; Decimal)
        {
            Caption = '25MVA EAF TRANSFORMER Y-PHASE';
        }
        field(14; "25MVA EAF TRANSFORMER B-PHASE"; Decimal)
        {
            Caption = '25MVA EAF TRANSFORMER B-PHASE';
        }
        field(15; "07MVA LRF TRANSFORMER R-PHASE"; Decimal)
        {
            Caption = '07MVA LRF TRANSFORMER R-PHASE';
        }
        field(16; "07MVA LRF TRANSFORMER Y-PHASE"; Decimal)
        {
            Caption = '07MVA LRF TRANSFORMER Y-PHASE';
        }
        field(17; "07MVA LRF TRANSFORMER B-PHASE"; Decimal)
        {
            Caption = '07MVA LRF TRANSFORMER B-PHASE';
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
